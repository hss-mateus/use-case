# typed: true
require "rubocop/ast"
require "tapioca/dsl"

module Tapioca
  module Compilers
    class UseCase < Tapioca::Dsl::Compiler
      extend T::Sig
      extend T::Generic

      ConstantType = type_member { { fixed: T.class_of(::UseCase) } }

      sig {override.returns(T::Enumerable[T.class_of(::UseCase)])}
      def self.gather_constants
        T.unsafe(::UseCase).__tapioca_use_cases&.keys || []
      end

      sig {override.void}
      def decorate
        root.create_path(constant) do |klass|
          meta = T.unsafe(::UseCase).__tapioca_use_cases[constant]

          klass.create_method("call", parameters: meta.params, return_type: meta.return_type, class_method: true)
          klass.create_method("[]", parameters: meta.params, return_type: meta.return_type, class_method: true)
          klass.create_method("to_proc", return_type: meta.to_proc_return_type, class_method: true)

          if defined?(::ActiveJob)
            klass.create_method("call_later", parameters: meta.params, return_type: meta.later_return_type, class_method: true)

            root.create_class(meta.job.to_s, superclass_name: ::UseCase.job_class.to_s) do |job_klass|
              job_klass.create_method("perform", parameters: meta.params, return_type: meta.return_type)
              job_klass.create_method("configure", parameters: meta.job_configure_params, return_type: "void", class_method: true)
              job_klass.create_method("perform_now", parameters: meta.params, return_type: meta.return_type, class_method: true)
              job_klass.create_method("perform_later", parameters: meta.params, return_type: meta.later_return_type, class_method: true)
            end
          end
        end
      end
    end
  end
end
