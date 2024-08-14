# typed: true

begin
  require "sorbet-runtime"
rescue LoadError
end

require "either"
require "ok"
require "err"

class UseCase
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

  def Ok(value, tag = nil) = Ok.new(value, tag)
  def Err(failure, tag = nil) = Err.new(failure, tag)
end
