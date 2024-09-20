# typed: true
if defined?(T)
  class Either
    extend T::Generic

    sealed!
  end
end

# An utility class for handling computations that can fail.
#
#   [Ok.new(2), Err.new("message")]
#     .sample                                                                 # => Either[Integer, String]
#     .map_ok      { |value| value.to_f }                                     # => Either[Float, String]
#     .map_err     { |failure| failure.to_sym }                               # => Either[Float, Symbol]
#     .map         { |value_or_failure| value_or_failure.to_s }               # => Either[String, String]
#     .pipe        { |value| Ok.new(value.to_i) }                             # => Either[Integer, String]
#     .pipe        { |value| rand(2).even? ? Ok.new(value) : Err.new(99.9) }  # => Either[Integer, T.any(String, Float)]
#     .pipe        { |value| Ok.new(value, :tag) }                            # => Either[Integer, T.any(String, Float)]
#     .on_ok       { |value| puts "the value is: #{value}" }                  # => Either[Integer, T.any(String, Float)]
#     .on_err      { |failure| puts "the failure is: #{failure}" }            # => Either[Integer, T.any(String, Float)]
#     .on_ok(:tag) { |value| puts "a tag was matched!" }                      # => Either[Integer, T.any(String, Float)]
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

  # When an instance of `Ok`, returns the underlying value.
  # Otherwise, raises `UnavailableAttributeError`.
  #
  #    Ok.new(2).value # => 2
  #   Err.new(2).value # => UnavailableAttributeError
  def value; end

  # When an instance of `Err`, returns the underlying value.
  # Otherwise, raises `UnavailableAttributeError`.
  #
  #    Ok.new(2).value # => UnavailableAttributeError
  #   Err.new(2).value # => 2
  def failure; end

  # Returns the underlying value.
  #
  #    Ok.new(2).value_or_failure # => 2
  #   Err.new(2).value_or_failure # => 2
  def value_or_failure; end

  # Is an instance of `Ok`?
  #
  #    Ok.new(2).ok? # => true
  #   Err.new(2).ok? # => false
  def ok?; end

  # Is an instance of `Err`?
  #
  #    Ok.new(2).ok? # => true
  #   Err.new(2).ok? # => false
  def err?; end

  # Passes `value_or_failure` to `block`, and returns the corresponding
  # `Either`, assigning the `block` return value to `value_or_failure`.
  #
  #    Ok.new(2).map { |x| x.to_s } # => Ok("2")
  #   Err.new(2).map { |x| x.to_s } # => Err("2")
  def map(&block); end

  # When an instance of `Ok`, passes `value` to block, and returns a new `Ok`,
  # assigning the `block` return value to `value`.
  # Otherwise, the block doesn't get executed and the value is returned as-is.
  #
  #    Ok.new(2).map_ok { |x| x.to_s } # => Ok("2")
  #   Err.new(2).map_ok { |x| x.to_s } # => Err(2)
  def map_ok(&block); end

  # When an instance of `Err`, passes `value` to block, and returns a new `Err`,
  # assigning the `block` return value to `value`.
  # Otherwise, the block doesn't get executed and the value is returned as-is.
  #
  #    Ok.new(2).map_err { |x| x.to_s } # => Ok(2)
  #   Err.new(2).map_err { |x| x.to_s } # => Err("2")
  def map_err(&block); end

  # When an instance of `Ok`, passes `value` to block, and returns the `Either`
  # result returned from the block.
  # Otherwise, the block doesn't get executed and the value is returned as-is.
  #
  #    Ok.new(2).pipe { |x|  Ok(x.to_s) } # => Ok("2")
  #    Ok.new(2).pipe { |x| Err(x.to_s) } # => Err("2")
  #   Err.new(2).pipe { |x|  Ok(x.to_s) } # => Err(2)
  #   Err.new(2).pipe { |x| Err(x.to_s) } # => Err(2)
  def pipe(&block); end

  # When an instance of `Ok`, passes `value` to block.
  # Otherwise, the block doesn't get executed.
  # If `tags` are specified, the block gets executed only if a tag is matched.
  # Returns itself.
  #
  #    ok =  Ok.new(2, :foo)
  #   err = Err.new(2, :foo)
  #   block = ->(failure) { puts "okay! #{failure}" }
  #
  #    ok.on_ok(&block)             # =>  Ok(2, :foo) | "okay! 2"
  #    ok.on_ok(:foo, :bar, &block) # =>  Ok(2, :foo) | "okay! 2"
  #    ok.on_ok(:bar, :baz, &block) # =>  Ok(2, :foo) | no output
  #   err.on_ok(&block)             # => Err(2, :foo) | no output
  #   err.on_ok(:foo, :bar, &block) # => Err(2, :foo) | no output
  def on_ok(*tags, &block)
    map_ok(&block) if tags_match?(tags)

    self
  end

  # When an instance of `Err`, passes `failure` to block.
  # Otherwise, the block doesn't get executed.
  # If `tags` are specified, the block gets executed only if a tag is matched.
  # Returns itself.
  #
  #    ok =  Ok.new(2, :foo)
  #   err = Err.new(2, :foo)
  #   block = ->(failure) { puts "oops! #{failure}" }
  #
  #    ok.on_err(&block)             # =>  Ok(2, :foo) | no output
  #    ok.on_err(:foo, :bar, &block) # =>  Ok(2, :foo) | no output
  #   err.on_err(&block)             # => Err(2, :foo) | "oops! 2"
  #   err.on_err(:foo, :bar, &block) # => Err(2, :foo) | "oops! 2"
  #   err.on_err(:bar, :baz, &block) # => Err(2, :foo) | no output
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

  def pipe(&block) = block.call(value)

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

  def pipe(&_block) = self

  def map(&block) = map_err(&block)

  def map_ok(&_block) = self

  def map_err(&block)
    new_failure = block.call(failure)

    self.class.new(new_failure, tag)
  end
end
