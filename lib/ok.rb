# typed: ignore
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
