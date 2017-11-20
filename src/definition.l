%{
#define NAND_OP 149
#define XOR_OP 150
#define XNOR_OP 151
#define OR_OP 152
#define NOR_OP 153
#define NOT_OP 154
#define EQUALITY_CHECK_OP 155
#define NOT_EQUAL_OP 156
#define IF_AND_ONLY_IF_OP 157
#define IF_THEN_OP 158
#define BOLD_ARROW_OP 159
#define WHILE_STMT 160
#define AND_OP 161
#define ASSIGN_OP 162
#define MUL_OP 163
#define DIV_OP 164
#define REMAINDER_OP 165 
#define GTE_OP 166
#define LTE_OP 167
#define GT_OP 168
#define LT_OP 169
#define ADD_OP 170
#define SUB_OP 171
#define STDIN_OP 172
#define STDOUT_OP 173
#define TRUTH_TYPE 174
#define INTEGER_TYPE 175
#define STRING_TYPE 176
#define FLOAT_TYPE 177
#define RELATION_TYPE 178
#define IF_CLAUSE 179
#define ELSE_CLAUSE 180
#define CONST_IDENTIFIER 181
#define BOOLEAN 182
#define STRING 183
#define TRUTH_VAL 184
#define FLOAT 185
#define INTEGER 186
#define IDENTIFIER 187
#define COMMENT 188
#define PROG_END 189
#define PROG_INIT 190
#define PRED 191
#define FUNCTION 192

%}

%%

\#\#[^\n]*                      return COMMENT;
"init"                          return PROG_INIT;
"get"                           return STDIN_OP;
"say"                           return STDOUT_OP;
((is)|(are))                    return ASSIGN_OP;
"pure"                          return CONST_IDENTIFIER;
\-\>							return IF_THEN_OP;
\<\-\> 							return IF_AND_ONLY_IF_OP;
\=\>                            return BOLD_ARROW_OP;
"xor"                           return XOR_OP;
"nor"                           return NOR_OP;
"xnor"                          return XNOR_OP;
"and"                           return AND_OP;
"nand"                          return NAND_OP;
"truth"                         return TRUTH_TYPE;
"float"                         return FLOAT_TYPE;
"int"                           return INTEGER_TYPE;
"string"                        return STRING_TYPE;
"rel"                           return RELATION_TYPE;
"not"							return NOT_OP;
"if"                            return IF_CLAUSE;
"else"                          return ELSE_CLAUSE;
"as long as"                    return WHILE_STMT;
"remains"                       return EQUALITY_CHECK_OP;
"pred"							return PRED;
"function"						return FUNCTION;
\=\=                            return EQUALITY_CHECK_OP;
\=								return ASSIGN_OP;
\!\=							return NOT_EQUAL_OP;
\*								return MUL_OP;
\/								return DIV_OP;
\%								return REMAINDER_OP;
\>\=							return GTE_OP;
\<\=							return LTE_OP;
\>								return GT_OP;
\<								return LT_OP;
\+								return ADD_OP;
\-								return SUB_OP;
\!								return NOT_OP;
\?                              return IF_CLAUSE;
\{              	            return '{';
\}              				return '}';
\[              		        return '[';
\]             					return ']';
\:             					return ':';
\(             					return '(';
\)             					return ')';
\,             					return ',';
\;             					return ';';
\$                              return '$';
\@\@                            return PROG_END;
" "								return ' ';

((true)|(false)|(un))			return BOOLEAN;
\"(\\.|[^"])*\"                 return STRING;
\'(\\.|[^'])*\'                 return TRUTH_VAL;

[-+]?[0-9]*\.[0-9]*([eE][-+]?[0-9]+)?		return FLOAT;
[-+]?[0-9]+								    return INTEGER;
[a-zA-Z][a-zA-Z0-9_]*						return IDENTIFIER;
.                                                       ;
%%

int yywrap(void){
  return 1;
}
