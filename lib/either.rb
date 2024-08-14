# typed: true
class Either
  extend T::Generic if defined?(T)

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

  def tags_match?(tags) = tags.none? || tags.include?(tag)
end
