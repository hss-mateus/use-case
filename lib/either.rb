# typed: strong

# An utility class for handling computations that can fail.
#
#   [Ok.new(2), Err.new("message")]
#     .sample                                                                    #: Either[Integer, String]
#     .map_ok         { |value| value.to_f }                                     #: Either[Float, String]
#     .map_err        { |failure| failure.to_sym }                               #: Either[Float, Symbol]
#     .map            { |value_or_failure| value_or_failure.to_s }               #: Either[String, String]
#     .pipe           { |value| Ok.new(value.to_i) }                             #: Either[Integer, String]
#     .pipe           { |value| rand(2).even? ? Ok.new(value) : Err.new(99.9) }  #: Either[Integer, String | Float]
#     .pipe           { |value| Ok.new(value, :tag) }                            #: Either[Integer, String | Float]
#     .on_ok          { |value| puts "the value is: #{value}" }                  #: Either[Integer, String | Float]
#     .on_err         { |failure| puts "the failure is: #{failure}" }            #: Either[Integer, String | Float]
#     .on_ok(:tag)    { |value| puts "a tag was matched!" }                      #: Either[Integer, String | Float]
#     .zip(Ok.new(3))                                                            #: Either[[Integer, Integer], String | Float]
#
# @sealed
# @abstract
#: [out Value < top, out Failure < top]
class Either
  #: [Value, Failure]
  class UnavailableAttributeError < StandardError
    #: Either[Value, Failure]
    attr_reader :either

    #: (Either[Value, Failure] either) -> void
    def initialize(either)
      super
      @either = either
    end
  end

  #: Symbol?
  attr_reader :tag

  #: (?Symbol? tag) -> void
  def initialize(tag = nil)
    @tag = tag
  end

  # Creates a new copy, with `tag` changed
  #
  #   result = Ok.new(2)    # => Ok(2)
  #   result.with_tag(:foo) # => Ok(2, :foo)
  #
  # @abstract
  #: (Symbol? tag) -> self
  def with_tag(tag) = raise NotImplementedError

  # When an instance of `Ok`, returns the underlying value.
  # Otherwise, raises `UnavailableAttributeError`.
  #
  #    Ok.new(2).value # => 2
  #   Err.new(2).value # => UnavailableAttributeError
  #
  # @abstract
  #: -> Value
  def value = raise NotImplementedError

  # When an instance of `Err`, returns the underlying value.
  # Otherwise, raises `UnavailableAttributeError`.
  #
  #    Ok.new(2).value # => UnavailableAttributeError
  #   Err.new(2).value # => 2
  #
  # @abstract
  #: -> Failure
  def failure = raise NotImplementedError

  # Returns the underlying value.
  #
  #    Ok.new(2).value_or_failure # => 2
  #   Err.new(2).value_or_failure # => 2
  #
  # @abstract
  #: -> (Value | Failure)
  def value_or_failure = raise NotImplementedError

  # Is an instance of `Ok`?
  #
  #    Ok.new(2).ok? # => true
  #   Err.new(2).ok? # => false
  #
  # @abstract
  #: -> bool
  def ok? = raise NotImplementedError

  # Is an instance of `Err`?
  #
  #    Ok.new(2).ok? # => true
  #   Err.new(2).ok? # => false
  #
  # @abstract
  #: -> bool
  def err? = raise NotImplementedError

  # Passes `value_or_failure` to `block`, and returns the corresponding
  # `Either`, assigning the `block` return value to `value_or_failure`.
  #
  #    Ok.new(2).map { |x| x.to_s } # => Ok("2")
  #   Err.new(2).map { |x| x.to_s } # => Err("2")
  #
  # @abstract
  #: [T] { ((Value | Failure) value_or_failure) -> T } -> Either[T, T]
  def map(&block) = raise NotImplementedError

  # When an instance of `Ok`, passes `value` to block, and returns a new `Ok`,
  # assigning the `block` return value to `value`.
  # Otherwise, the block doesn't get executed and the value is returned as-is.
  #
  #    Ok.new(2).map_ok { |x| x.to_s } # => Ok("2")
  #   Err.new(2).map_ok { |x| x.to_s } # => Err(2)
  #
  # @abstract
  #: [T] { (Value value) -> T } -> Either[T, Failure]
  def map_ok(&block) = raise NotImplementedError

  # When an instance of `Err`, passes `value` to block, and returns a new `Err`,
  # assigning the `block` return value to `value`.
  # Otherwise, the block doesn't get executed and the value is returned as-is.
  #
  #    Ok.new(2).map_err { |x| x.to_s } # => Ok(2)
  #   Err.new(2).map_err { |x| x.to_s } # => Err("2")
  #
  # @abstract
  #: [T] { (Failure failure) -> T } -> Either[Value, T]
  def map_err(&block) = raise NotImplementedError

  # When an instance of `Ok`, passes `value` to block, and returns the `Either`
  # result returned from the block.
  # Otherwise, the block doesn't get executed and the value is returned as-is.
  #
  #    Ok.new(2).pipe { |x|  Ok(x.to_s) } # => Ok("2")
  #    Ok.new(2).pipe { |x| Err(x.to_s) } # => Err("2")
  #   Err.new(2).pipe { |x|  Ok(x.to_s) } # => Err(2)
  #   Err.new(2).pipe { |x| Err(x.to_s) } # => Err(2)
  #
  # @abstract
  #: [A, B] { (Value value) -> Either[A, B] } -> Either[A, Failure | B]
  def pipe(&block) = raise NotImplementedError

  # When an instance of `Err`, passes `failure` to block, and returns the
  # `Either` result returned from the block.
  # Otherwise, the block doesn't get executed and the value is returned as-is.
  #
  #    Ok.new(2).or { |x|  Ok(x.to_s) } # => Ok(2)
  #    Ok.new(2).or { |x| Err(x.to_s) } # => Ok(2)
  #   Err.new(2).or { |x|  Ok(x.to_s) } # => Ok("2")
  #   Err.new(2).or { |x| Err(x.to_s) } # => Err("2")
  #
  # @abstract
  #: [A, B] { (Failure failure) -> Either[A, B] } -> Either[Value | A, B]
  def or(&block) = raise NotImplementedError

  # When an instance of `Ok`, passes `value` to block.
  # Otherwise, the block doesn't get executed.
  # If `tags` are specified, the block gets executed only if a tag is matched.
  # Returns itself.
  #
  #    ok =  Ok.new(2, :foo)
  #   err = Err.new(2, :foo)
  #   block = ->(value) { puts "okay! #{value}" }
  #
  #    ok.on_ok(&block)             # =>  Ok(2, :foo) | "okay! 2"
  #    ok.on_ok(:foo, :bar, &block) # =>  Ok(2, :foo) | "okay! 2"
  #    ok.on_ok(:bar, :baz, &block) # =>  Ok(2, :foo) | no output
  #   err.on_ok(&block)             # => Err(2, :foo) | no output
  #   err.on_ok(:foo, :bar, &block) # => Err(2, :foo) | no output
  #
  #: (*Symbol tags) { (Value value) -> void } -> self
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
  #
  #: (*Symbol tags) { (Failure failure) -> void } -> self
  def on_err(*tags, &block)
    map_err(&block) if tags_match?(tags)

    self
  end

  # When Active Record is available, runs the block in a transaction. If the
  # block returns an `Err`, the transaction is rolled back. If the block raises
  # `ActiveRecord::Rollback`, `fallback` is returned.
  #
  #   result = Ok.new("email@example.com")
  #   fallback = Err.new("fallback")
  #
  #   User.count # => 0
  #
  #   result.pipe_transaction(fallback:) { |email|
  #     user = User.create!(email:)
  #
  #     Err.new("aborted")
  #   } # => Err("aborted")
  #
  #   User.count # => 0
  #
  #   valid_result.pipe_transaction(fallback:) { |email|
  #     User.create!(email:)
  #
  #     raise ActiveRecord::Rollback
  #   } # => Err("fallback")
  #
  #   User.count # => 0
  #
  #   valid_result.pipe_transaction(fallback:) { |email|
  #     Ok.new(User.create!(email:))
  #   } # => Ok(#<User ...>)
  #
  #   User.count # => 1
  #
  #: [A, B] (fallback: Either[A, B]) { (Value value) -> Either[A, B] } -> Either[A, Failure | B]
  def pipe_transaction(fallback:, &block)
    pipe { |val|
      result = fallback

      ActiveRecord::Base.transaction do
        result = block.call(val)
        result.on_err { raise ActiveRecord::Rollback }
      end

      result
    }
  end

  # Pipes `self` to `other`, then joins both `value`s into a tuple.
  #
  #    Ok.new(2).zip(Ok.new(3))  # => Ok([2, 3])
  #   Err.new(2).zip(Ok.new(3))  # => Err(2)
  #    Ok.new(2).zip(Err.new(3)) # => Err(3)
  #   Err.new(2).zip(Err.new(3)) # => Err(2)
  #
  #: [A, B] (Either[A, B]) -> Either[[Value, A], Failure | B]
  def zip(other)
    pipe { |val|
      other.map_ok { |val2|
        [val, val2]
      }
    }
  end

  private

  #: (Array[Symbol] tags) -> bool
  def tags_match?(tags) = tags.none? || tags.include?(tag)
end

#: [out Value < top, out Failure = bot]
class Ok < Either
  # @override
  #: Value
  attr_reader :value

  #: [T] (T value, ?Symbol? tag) -> Ok[T]
  def self.new(value, tag = nil) = super #: as Ok[T]

  #: (Value value, ?Symbol? tag) -> void
  def initialize(value, tag = nil)
    super(tag)

    @value = value
  end

  # @override
  #: (Symbol? tag) -> self
  def with_tag(tag) = self.class.new(value, tag)

  # @override
  #: -> bot
  def failure = raise UnavailableAttributeError, self

  # @override
  #: -> Value
  def value_or_failure = value

  # @override
  #: -> bool
  def ok? = true

  # @override
  #: -> bool
  def err? = false

  # @override
  #: [A, B] { (Value value) -> Either[A, B] } -> Either[A, B]
  def pipe(&block) = block.call(value)

  # @override
  #: [A, B] { (Failure failure) -> Either[A, B] } -> Ok[Value | A]
  def or(&_block) = self

  # @override
  #: [T] { (Value value) -> T } -> Ok[T]
  def map(&block) = map_ok(&block)

  # @override
  #: [T] { (Value value) -> T } -> Ok[T]
  def map_ok(&block)
    new_value = block.call(value)

    Ok.new(new_value, tag)
  end

  # @override
  #: [T] { (Failure failure) -> T } -> Ok[Value]
  def map_err(&_block) = self
end

#: [out Value < bot, out Failure < top]
class Err < Either
  # @override
  #: Failure
  attr_reader :failure

  #: [T] (T value, ?Symbol? tag) -> Err[bot, T]
  def self.new(value, tag = nil) = super #: as Err[bot, T]

  #: (Failure failure, ?Symbol? tag) -> void
  def initialize(failure, tag = nil)
    super(tag)

    @failure = failure
  end

  # @override
  #: (Symbol? tag) -> self
  def with_tag(tag) = Err.new(failure, tag)

  # @override
  #: -> bot
  def value = raise UnavailableAttributeError, self

  # @override
  #: -> Failure
  def value_or_failure = failure

  # @override
  #: -> bool
  def ok? = false

  # @override
  #: -> bool
  def err? = true

  # @override
  #: [A, B] { (Value value) -> Either[A, B] } -> Err[bot, Failure | B]
  def pipe(&_block) = self #: as Err[bot, Failure]

  # @override
  #: [A, B] { (Failure failure) -> Either[A, B] } -> Either[A, B]
  def or(&block) = block.call(failure)

  # @override
  #: [T] { (Failure failure) -> T } -> Err[bot, T]
  def map(&block) = map_err(&block)

  # @override
  #: [T] { (Value value) -> T } -> Err[bot, Failure]
  def map_ok(&_block) = self #: as Err[bot, Failure]

  # @override
  #: [T] { (Failure failure) -> T } -> Err[bot, T]
  def map_err(&block)
    new_failure = block.call(failure)

    Err.new(new_failure, tag)
  end
end
