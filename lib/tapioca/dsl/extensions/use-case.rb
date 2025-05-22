# typed: false
module Tapioca
  module Extensions
    module UseCase
      def inherited(subclass)
        super

        Object.const_get("#{subclass}::Job").undef_method :perform if defined?(::ActiveJob)
      end

      if defined?(::ActiveSupport)
        ::ActiveSupport.on_load(:active_job) do
          ::UseCase.singleton_class.prepend(::Tapioca::Extensions::UseCase)
        end
      end
    end
  end
end
