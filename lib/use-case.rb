# typed: false
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
  class << self
    def call(...) = new.call(...)
    def [](...) = call(...)
    def to_proc = method(:call).to_proc
  end

  module ActiveJobExtensions
    def call_later(...) = const_get(:Job).perform_later(...)

    def job_class = @job_class ||= ::ActiveJob::Base

    def job_class=(klass)
      @job_class = klass
    end

    def inherited(subclass)
      job = subclass.const_set(
        :Job,
        Class.new(UseCase.job_class) do
          class << self
            alias configure class_eval
          end
        end
      )

      job.define_method(:perform) do |*args, **kwargs, &block|
        subclass.call(*args, **kwargs, &block)
      end
    end
  end

  if defined?(::ActiveSupport)
    ::ActiveSupport.on_load(:active_job) do
      ::UseCase.extend(ActiveJobExtensions)
    end
  end
end

