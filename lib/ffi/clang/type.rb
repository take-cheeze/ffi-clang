module FFI
	module Clang
		class Type
			def initialize(type)
				@type = type
			end

			def kind
				@type[:kind]
			end

      def kind_spelling
        Lib.extract_string Lib.get_type_kind_spelling @type[:kind]
      end

			def spelling
				Lib.extract_string Lib.get_type_spelling(@type)
			end

			def variadic?
				Lib.is_function_type_variadic(@type) != 0
			end

			def pod?
				Lib.is_pod_type(@type) != 0
			end

			def num_arg_types
				Lib.get_num_arg_types(@type)
			end

      def canonical
        Type.new Lib.get_canonical_type(@type)
      end

      def const_qualified?
        Lib.is_const_qualified_type(@type) != 0
      end

			def arg_type(i)
				Type.new Lib.get_arg_type(@type, i)
			end

			def result_type
				Type.new Lib.get_result_type(@type)
			end
		end
	end
end
