# typed: true
require "use-case"

module Tapioca
  module Extensions
    module UseCase
      class Metadata
        include Tapioca::RBIHelper
        extend T::Sig

        def initialize(constant)
          @constant = constant
        end

        sig {returns(T.class_of(::UseCase))}
        attr_reader :constant

        def job
          @job ||= Object.const_get("#{constant}::Job")
        end

        sig {returns(T.untyped)}
        def signature
          @signature ||= T::Utils.signature_for_instance_method(constant, :call) ||
                         T.unsafe(T::Private::Methods::Signature).new_untyped(method: constant.instance_method(:call))
        end

        sig {returns(UnboundMethod)}
        def method = signature.method

        sig {returns(T::Hash[Symbol, T::Types::Base])}
        def arg_types
          @arg_types ||= {
            **signature.arg_types.to_h,
            signature.rest_name => signature.rest_type,
            **signature.kwarg_types,
            signature.keyrest_name => signature.keyrest_type,
            signature.block_name => signature.block_type
          }.compact
        end

        sig {returns(T::Hash[Symbol, String])}
        def arg_defaults
          path, _ = T.must(method.source_location)

          @arg_defaults ||=
            RuboCop::AST::ProcessedSource
              .new(File.read(path), RUBY_VERSION.to_f)
              .ast
              .each_node
              .find { _1.def_type? && _1.method_name == :call }
              .arguments
              .argument_list
              .to_h { [_1.name, _1.default_value&.source] }
              .compact
        end

        sig {returns(T::Array[RBI::TypedParam])}
        def params
          @params ||=
            method.parameters.map { |kind, name|
              type = arg_types.fetch(name, T.untyped).to_s
              default = arg_defaults.fetch(name, "nil")
              name = name.to_s

              case kind
              when :req
                create_param(name, type:)
              when :opt
                create_opt_param(name, type:, default:)
              when :rest
                create_rest_param(name, type:)
              when :keyreq
                create_kw_param(name, type:)
              when :key
                create_kw_opt_param(name, type:, default:)
              when :keyrest
                create_kw_rest_param(name, type:)
              when :block
                create_block_param(name, type:)
              end
            }
        end

        sig {returns(String)}
        def return_type = sanitize_signature_types(signature.return_type.to_s)

        def later_return_type = sanitize_signature_types("T.any(#{job}, FalseClass)")

        def to_proc_return_type = sanitize_signature_types(T::Types::Proc.new(arg_types, signature.return_type).to_s)

        sig {returns(T::Array[RBI::TypedParam])}
        def job_configure_params
          [create_block_param("block", type: "T.proc.bind(T.class_of(#{job})).void")]
        end
      end

      attr_accessor :__tapioca_use_cases

      def old_inherited(subclass)
        meta = Metadata.new(subclass)
        @__tapioca_use_cases ||= {}
        @__tapioca_use_cases[subclass] = meta

        super

        meta.job.undef_method :perform if defined?(::ActiveJob)
      end

      ::UseCase.singleton_class.prepend(self)
    end
  end
end
