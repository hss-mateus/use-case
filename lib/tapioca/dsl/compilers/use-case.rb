# typed: strict
module Tapioca
  module Compilers
    #: [ConstantType = singleton(::UseCase)]
    class UseCase < Tapioca::Dsl::Compiler
      # @override
      #: -> Enumerable[Class[::UseCase]]
      def self.gather_constants
        descendants_of(::UseCase)
      end

      # @override
      #: -> void
      def decorate
        root.create_path(constant) do |scope|
          scope.create_method("call", parameters:, return_type:, class_method: true)
          scope.create_method("[]", parameters:, return_type:, class_method: true)
          scope.create_method("to_proc", return_type: proc_type, class_method: true)

          decorate_job(scope) if defined?(::ActiveJob)
        end
      end

      #: -> UnboundMethod
      def call_method = constant.instance_method(:call) # method_of(constant, :call)

      #: -> Array[RBI::TypedParam]
      def parameters = compile_method_parameters_to_rbi(call_method)

      #: -> String
      def return_type = compile_method_return_type_to_rbi(call_method)

      #: -> String
      def proc_type
        inner_params = parameters.map { |item|
          "#{item.param.name}: #{item.type}"
        }.join(", ")

        params = ".params(#{inner_params})" unless inner_params.strip.empty?

        "T.proc#{params}.returns(#{return_type})"
      end

      #: -> Class[::ActiveJob::Base]
      def job = Object.const_get("#{constant}::Job")

      #: -> String
      def job_return_type = "T.any(#{job}, FalseClass)"

      #: (RBI::Scope scope) -> void
      def decorate_job(scope)
        scope.create_method("call_later", parameters:, return_type: job_return_type, class_method: true)

        root.create_class(job.to_s, superclass_name: job.superclass.to_s) do |job_scope|
          job_scope.create_method(
            "configure",
            parameters: [create_block_param("block", type: "T.proc.bind(T.class_of(#{job})).void")],
            return_type: "void",
            class_method: true
          )

          job_scope.create_method("perform", parameters:, return_type:)
          job_scope.create_method("perform_now", parameters:, return_type:, class_method: true)
          job_scope.create_method("perform_later", parameters:, return_type: job_return_type, class_method: true)
        end
      end
    end
  end
end
