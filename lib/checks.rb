# typed: strong
module UseCase::Checks
  class Increment < UseCase
    #: (Integer value) -> Ok[Integer]
    def call(value)
      Ok.new(value + 1)
    end
  end

  class Divide < UseCase
    #: (Integer a, Integer b) -> Either[Integer, String]
    def call(a, b)
      if b.zero?
        Err.new("cannot divide by zero")
      else
        Ok.new(a / b)
      end
    end
  end

  Divide[2, 3]
  Divide.(2, 3)
  Divide.call(2, 3)
  Divide.new.call(2, 3)
  Divide.new.call(2, 3).pipe(&Increment)
  Divide.to_proc

  result = [Ok.new(2).with_tag(:tag), Err.new("message")]                   #: [Ok[Integer], Err[bot, String]]
    .sample                                                                 #: Either[Integer, String]

  result                                                                    #: Either[Integer, String]
    .map_ok      { |value| value.to_f }                                     #: Either[Float, String]
    .map_err     { |failure| failure.to_sym }                               #: Either[Float, Symbol]
    .map         { |value_or_failure| value_or_failure.to_s }               #: Either[String, String]
    .pipe        { |value| Ok.new(value.to_i) }                             #: Either[Integer, String]
    .pipe        { |value| rand(2).even? ? Ok.new(value) : Err.new(99.9) }  #: Either[Integer, String | Float]
    .pipe        { |value| Ok.new(value, :tag) }                            #: Either[Integer, String | Float]
    .on_ok       { |value| puts "the value is: #{value}" }                  #: Either[Integer, String | Float]
    .on_err      { |failure| puts "the failure is: #{failure}" }            #: Either[Integer, String | Float]
    .on_ok(:tag) { |value| puts "a tag was matched!" }                      #: Either[Integer, String | Float]
    .zip(result)                                                            #: Either[[Integer, Integer], String | Float]
    .value_or_failure                                                       #: Array[Integer] | String | Float

  Ok.new(2).value             #: Integer
  Err.new(2).failure          #: Integer
  Ok.new(2).value_or_failure  #: Integer
  Err.new(2).value_or_failure #: Integer
end
