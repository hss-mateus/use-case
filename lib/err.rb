# typed: ignore
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
