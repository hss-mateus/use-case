# typed: strong
class Either
  extend T::Generic

  abstract!
  sealed!

  Value = type_member(:out) { { upper: T.anything } }
  Failure = type_member(:out) { { upper: T.anything } }

  class UnavailableAttributeError < StandardError
    Value = type_member(:out)
    Failure = type_member(:out)

    sig {returns(Either[Value, Failure])}
    attr_reader :either

    sig {params(either: Either[Value, Failure]).void}
    def initialize(either); end
  end

  sig {returns(T.nilable(Symbol))}
  attr_reader :tag

  sig {params(tag: T.nilable(Symbol)).void}
  def initialize(tag = nil); end

  sig {abstract.returns(Value)}
  def value; end

  sig {abstract.returns(Failure)}
  def failure; end

  sig {abstract.returns(T.any(Value, Failure))}
  def value_or_failure; end

  sig {abstract.returns(T::Boolean)}
  def ok?; end

  sig {abstract.returns(T::Boolean)}
  def err?; end

  sig {
    abstract
      .type_parameters(:T)
      .params(block: T.proc.params(value_or_failure: T.any(Value, Failure)).returns(T.type_parameter(:T)))
      .returns(
        T.any(
          Either[T.any(Value, T.type_parameter(:T)), Failure],
          Either[Value, T.any(Failure, T.type_parameter(:T))]
        )
      )
  }
  def map(&block); end

  sig {
    abstract
      .type_parameters(:T)
      .params(block: T.proc.params(value: Value).returns(T.type_parameter(:T)))
      .returns(Either[T.any(Value, T.type_parameter(:T)), Failure])
  }
  def map_ok(&block); end

  sig {
    abstract
      .type_parameters(:T)
      .params(block: T.proc.params(failure: Failure).returns(T.type_parameter(:T)))
      .returns(Either[Value, T.any(T.type_parameter(:T), Failure)])
  }
  def map_err(&block); end

  sig {
    abstract
      .type_parameters(:A, :B)
      .params(block: T.proc.params(value: Value).returns(Either[T.type_parameter(:A), T.type_parameter(:B)]))
      .returns(Either[T.type_parameter(:A), T.any(Failure, T.type_parameter(:B))])
  }
  def then(&block); end

  sig {params(tags: Symbol, block: T.proc.params(value: Value).void).returns(T.self_type)}
  def on_ok(*tags, &block); end

  sig {params(tags: Symbol, block: T.proc.params(failure: Failure).void).returns(T.self_type)}
  def on_err(*tags, &block); end

  sig {params(tags: T::Array[Symbol]).returns(T::Boolean)}
  def tags_match?(tags); end
end

class Ok < Either
  Value = type_member(:out) { { upper: T.anything } }
  Failure = type_member(:out) { { fixed: T.noreturn } }

  sig {override.returns(Value)}
  attr_reader :value

  sig {
    type_parameters(:T)
      .params(value: T.type_parameter(:T), tag: T.nilable(Symbol))
      .returns(Ok[T.type_parameter(:T)])
  }
  def self.new(value, tag = nil); end

  sig {params(value: Value, tag: T.nilable(Symbol)).void}
  def initialize(value, tag = nil); end

  sig {override.returns(T.noreturn)}
  def failure; end

  sig {override.returns(Value)}
  def value_or_failure; end

  sig {override.returns(TrueClass)}
  def ok?; end

  sig {override.returns(FalseClass)}
  def err?; end

  sig {
    override
      .type_parameters(:A, :B)
      .params(block: T.proc.params(value: Value).returns(Either[T.type_parameter(:A), T.type_parameter(:B)]))
      .returns(Either[T.type_parameter(:A), T.any(Failure, T.type_parameter(:B))])
  }
  def then(&block); end

  sig {
    override
      .type_parameters(:T)
      .params(block: T.proc.params(value: T.any(Value, Failure)).returns(T.type_parameter(:T)))
      .returns(Ok[T.any(T.type_parameter(:T), Value)])
  }
  def map(&block); end

  sig {
    override
      .type_parameters(:T)
      .params(block: T.proc.params(value: Value).returns(T.type_parameter(:T)))
      .returns(Ok[T.any(T.type_parameter(:T), Value)])
  }
  def map_ok(&block); end

  sig {
    override
      .type_parameters(:T)
      .params(_block: T.proc.params(failure: Failure).returns(T.type_parameter(:T)))
      .returns(Ok[Value])
  }
  def map_err(&_block); end
end

class Err < Either
  Value = type_member(:out) { { fixed: T.noreturn } }
  Failure = type_member(:out) { { upper: T.anything } }

  sig {override.returns(Failure)}
  attr_reader :failure

  sig {
    type_parameters(:T)
      .params(failure: T.type_parameter(:T), tag: T.nilable(Symbol))
      .returns(Err[T.type_parameter(:T)])
  }
  def self.new(failure, tag = nil); end

  sig {params(failure: Failure, tag: T.nilable(Symbol)).void}
  def initialize(failure, tag = nil); end

  sig {override.returns(T.noreturn)}
  def value; end

  sig {override.returns(Failure)}
  def value_or_failure; end

  sig {override.returns(FalseClass)}
  def ok?; end

  sig {override.returns(TrueClass)}
  def err?; end

  sig {
    override
      .type_parameters(:A, :B)
      .params(_block: T.proc.params(value: Value).returns(Either[T.type_parameter(:A), T.type_parameter(:B)]))
      .returns(Either[T.type_parameter(:A), T.any(Failure, T.type_parameter(:B))])
  }
  def then(&_block); end

  sig {
    override
      .type_parameters(:T)
      .params(block: T.proc.params(value: Failure).returns(T.type_parameter(:T)))
      .returns(Err[T.type_parameter(:T)])
  }
  def map(&block); end

  sig {
    override
      .type_parameters(:T)
      .params(_block: T.proc.params(value: Value).returns(T.type_parameter(:T)))
      .returns(Err[Failure])
  }
  def map_ok(&_block); end

  sig {
    override
      .type_parameters(:T)
      .params(block: T.proc.params(failure: Failure).returns(T.type_parameter(:T)))
      .returns(Err[T.type_parameter(:T)])
  }
  def map_err(&block); end
end
