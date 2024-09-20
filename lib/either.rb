# typed: true
if defined?(T)
  class Either
    extend T::Generic

    sealed!
  end
end

class Either
  class UnavailableAttributeError < StandardError
    attr_reader :either

    def initialize(either)
      super
      @either = either
    end
  end

  attr_reader :tag

  def initialize(tag = nil)
    @tag = tag
  end

  def value; end

  def failure; end

  def value_or_failure; end

  def ok?; end

  def err?; end

  def map(&block); end

  def map_ok(&block); end

  def map_err(&block); end

  def then(&block); end

  def on_ok(*tags, &block)
    map_ok(&block) if tags_match?(tags)

    self
  end

  def on_err(*tags, &block)
    map_err(&block) if tags_match?(tags)

    self
  end

  private

  def tags_match?(tags) = tags.none? || tags.include?(tag)
end

class Ok < Either
  attr_reader :value

  def initialize(value, tag = nil)
    super(tag)

    @value = value
  end

  def failure = raise UnavailableAttributeError, self

  def value_or_failure = value

  def ok? = true

  def err? = false

  def then(&block) = block.call(value)

  def map(&block) = map_ok(&block)

  def map_ok(&block)
    new_value = block.call(value)

    self.class.new(new_value, tag)
  end

  def map_err(&_block) = self
end

class Err < Either
  attr_reader :failure

  def initialize(failure, tag = nil)
    super(tag)

    @failure = failure
  end

  def value = raise UnavailableAttributeError, self

  def value_or_failure = failure

  def ok? = false

  def err? = true

  def then(&_block) = self

  def map(&block) = map_err(&block)

  def map_ok(&_block) = self

  def map_err(&block)
    new_failure = block.call(failure)

    self.class.new(new_failure, tag)
  end
end
