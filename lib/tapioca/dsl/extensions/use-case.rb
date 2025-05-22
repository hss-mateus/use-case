# typed: strict
module Tapioca
  module Extensions
    module UseCase
      #: (::UseCase subclass) -> void
      def inherited(subclass)
        super

        Object.const_get("#{subclass}::Job").undef_method :perform if defined?(::ActiveJob)
      end

      if defined?(::ActiveSupport)
        ::ActiveSupport #: as untyped
          .on_load(:active_job) do
          ::UseCase.singleton_class.prepend(::Tapioca::Extensions::UseCase)
        end
      end
    end
  end
end
