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
        all_classes.filter_map { |c| c if c < ::UseCase }
      end

      sig {override.void}
      def decorate
        root.create_path(constant) do |klass|
          ret = signature.return_type
          ret_str = sanitize_signature_types(ret.to_s)

          klass.create_method("call", parameters:, return_type: ret_str, class_method: true)
          klass.create_method("[]", parameters:, return_type: ret_str, class_method: true)
          klass.create_method(
            "to_proc",
            return_type: sanitize_signature_types(T::Types::Proc.new(types, ret).to_s),
            class_method: true
          )
        end
      end

      private

      sig {returns(UnboundMethod)}
      def method = signature.method

      sig {returns(T.untyped)}
      def signature
        @signature ||= T::Utils.signature_for_instance_method(constant, :call) ||
                       T.unsafe(T::Private::Methods::Signature).new_untyped(method: constant.instance_method(:call))
      end

      sig {returns(T::Hash[Symbol, T::Types::Base])}
      def types
        @types ||= {
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
      def parameters
        @parameters ||=
          method.parameters.map { |kind, name|
            type = types.fetch(name, T.untyped).to_s
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
    end
  end
end
