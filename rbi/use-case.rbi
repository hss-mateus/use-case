# typed: strong
class UseCase
  # sig {
  #   type_parameters(:T)
  #     .params(value: T.type_parameter(:T), tag: T.nilable(Symbol))
  #     .returns(Ok[T.type_parameter(:T)])
  # }
  # def Ok(value, tag = nil); end

  # sig {
  #   type_parameters(:T)
  #     .params(failure: T.type_parameter(:T), tag: T.nilable(Symbol))
  #     .returns(Err[T.type_parameter(:T)])
  # }
  # def Err(failure, tag = nil); end
end
