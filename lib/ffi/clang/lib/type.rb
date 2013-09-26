module FFI
	module Clang
		module Lib
			enum :kind, [:type_invalid, 0,
                   :type_unexposed, 1,
                   :type_void, 2,
                   :type_dependent, 26,
                   :type_pointer, 101,
                   :type_lvalue_ref, 103,
                   :type_record, 105,
                   :type_enum, 106,
                   :type_function_proto, 111
                  ]

			class CXType < FFI::Struct
				layout(
					:kind, :kind,
					:data, [:pointer, 2]
				)
			end

      attach_function :get_pointee_type, :clang_getPointeeType, [CXType.by_value], CXType.by_value
      attach_function :get_type_kind_spelling, :clang_getTypeKindSpelling, [:kind], CXString.by_value
			attach_function :get_type_spelling, :clang_getTypeSpelling, [CXType.by_value], CXString.by_value
			attach_function :is_function_type_variadic, :clang_isFunctionTypeVariadic, [CXType.by_value], :uint
			attach_function :is_pod_type, :clang_isPODType, [CXType.by_value], :uint
			attach_function :get_num_arg_types, :clang_getNumArgTypes, [CXType.by_value], :int
			attach_function :get_arg_type, :clang_getArgType, [CXType.by_value, :uint], CXType.by_value
			attach_function :get_result_type, :clang_getResultType, [CXType.by_value], CXType.by_value
      attach_function :get_canonical_type, :clang_getCanonicalType, [CXType.by_value], CXType.by_value
      attach_function :is_const_qualified_type, :clang_isConstQualifiedType, [CXType.by_value], :uint

		end
	end
end
