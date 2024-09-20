# typed: true

begin
  require "sorbet-runtime"
rescue LoadError
end

require "either"

# Utility class to be used within `Result` methods.
#
# For example, given the following definitions:
#
#   class Increment < UseCase
#     def call(value)
#       Ok.new(value + 1)
#     end
#   end
#
#   class Divide < UseCase
#     def call(a, b)
#       if b.zero?
#         Err.new("cannot divide by zero")
#       else
#         Ok.new(a / b)
#       end
#     end
#   end
#
# These classes can be called like this:
#
#   Divide[2, 3]
#   Divide.(2, 3)
#   Divide.call(2, 3)
#   Divide.new.call(2, 3)
#   Divide.to_proc.call(2, 3)
#
#   Divide[2, 3].pipe(&Increment)
#
# = Sorbet
#
# When using together with `sorbet` and `tapioca`, type definitions can be
# generated for DSL methods.
#
# For example, given the following annotations:
#
#   class Increment < UseCase
#     sig {params(value: Integer).returns(Ok[Integer])}
#     def call(value)
#       # ...
#     end
#   end
#
#   class Divide < UseCase
#     sig {params(a: Integer, b: Integer).returns(Either[Integer, String])}
#     def call(a, b)
#       # ...
#     end
#   end
#
# By running `tapioca dsl`, the following files will be created:
#
#   # sorbet/rbi/dsl/divide.rbi
#   class Divide
#     class << self
#       sig { params(a: ::Integer, b: ::Integer).returns(Either[::Integer, ::String]) }
#       def [](a, b); end
#
#       sig { params(a: ::Integer, b: ::Integer).returns(Either[::Integer, ::String]) }
#       def call(a, b); end
#
#       sig { returns(T.proc.params(a: ::Integer, b: ::Integer).returns(Either[::Integer, ::String])) }
#       def to_proc; end
#     end
#   end
#
# ---
#
#   # sorbet/rbi/dsl/increment.rbi
#   class Increment
#     class << self
#       sig { params(value: ::Integer).returns(Ok[::Integer]) }
#       def [](value); end
#
#       sig { params(value: ::Integer).returns(Ok[::Integer]) }
#       def call(value); end
#
#       sig { returns(T.proc.params(value: ::Integer).returns(Ok[::Integer])) }
#       def to_proc; end
#     end
#   end
#
# Sorbet will raise a type error in these conditions:
#
#   Increment["foo"]           # Expected `Integer` but found `String("foo")` for argument `value`
#   Increment[2, 3]            # Too many arguments provided for method `Increment.[]`. Expected: `1`, got: `2`
#   Increment[2].pipe(&Divide) # Expected `T.proc.params(arg0: Integer).returns(Either[T.anything, T.anything])`
#                              # but found `T.proc.params(arg0: Integer, arg1: Integer).returns(Either[Integer, String])` for block argument
class UseCase
  extend T::Sig if defined?(T)

  class << self
    def to_proc
      ->(*args, **kwargs, &block) { call(*args, **kwargs, &block) }
    end

    def [](...)
      T.unsafe(new).call(...)
    end

    def call(...)
      T.unsafe(new).call(...)
    end
  end

  # def Ok(value, tag = nil) = Ok.new(value, tag)
  # def Err(failure, tag = nil) = Err.new(failure, tag)
end
