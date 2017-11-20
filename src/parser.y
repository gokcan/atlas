%token NAND_OP 
%token XOR_OP 
%token XNOR_OP 
%token OR_OP 
%token NOR_OP
%token NOT_OP 
%token EQUALITY_CHECK_OP 
%token NOT_EQUAL_OP 
%token IF_AND_ONLY_IF_OP 
%token IF_THEN_OP
%token BOLD_ARROW_OP
%token WHILE_STMT
%token AND_OP
%token ASSIGN_OP
%token MUL_OP
%token DIV_OP
%token REMAINDER_OP 
%token GTE_OP 
%token LTE_OP 
%token GT_OP
%token LT_OP
%token ADD_OP
%token SUB_OP
%token STDIN_OP
%token STDOUT_OP
%token TRUTH_TYPE
%token INTEGER_TYPE
%token STRING_TYPE
%token FLOAT_TYPE
%token RELATION_TYPE
%token IF_CLAUSE
%token ELSE_CLAUSE
%token CONST_IDENTIFIER 
%token BOOLEAN 
%token STRING 
%token TRUTH_VAL
%token FLOAT
%token INTEGER
%token IDENTIFIER
%token COMMENT
%token PROG_END
%token PROG_INIT
%token PRED
%token FUNCTION
%start Program

%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "y.tab.h"
    void yyerror(char *);
    int yylex(void);
    extern char* yytext;
%}

%%

Program: PROG_INIT Block PROG_END
      |
;

Block  : Statements Block
      | error Block
      |
;

Statements: Stmt
| Stmt Statements
;

Stmt  : Function
      | Pred
      | Other
;

Other : FunctionCall Semicolon
      | While
      | If
      | Assignment Semicolon
      | Definition Semicolon
      | Std
;

Definition : ;

Assignment : ;

FunctionCall : 

;

Semicolon : ';'
          |
;

Std: STDIN_OP IDENTIFIER '+' Value
    | STDOUT_OP IDENTIFIER '+' Value
    | STDIN_OP Value
    | STDOUT_OP Value
;

CompoundProposition: CompoundProposition Connective CompoundProposition
| Negation CompoundProposition 
| Proposition
| BOOLEAN 
| '(' CompoundProposition ')'
;

Proposition: IDENTIFIER
            | TRUTH_VAL
;

IfStatement: IF_CLAUSE LogicExpr '{' Statements '}'
| IF_CLAUSE LogicExpr '{' Statements '}' ELSE '{' Statements '}'
;

LogicExpr: CompoundProposition ComparisonOperator CompoundProposition
      | CompoundProposition
;

Pred: PRED IDENTIFIER '(' ParameterList ')' '{' Statements '}'

Function: FUNCTION Type IDENTIFIER '(' ParameterList ')' '{' Statements '}'
;

ParameterList : Parameter ',' ParameterList
            | Parameter
;

Parameter : IDENTIFIER ':' Type
            |
;

WhileStatement: WHILE_STMT LogicExpr '{' Statements '}' ;

Negation : NOT_OP
         |
;

ArithmeticOperator  : ADD_OP
                    | SUB_OP
                    | MUL_OP
                    | DIV_OP
                    | REMAINDER_OP
;

ComparisonOperator :  EQUALITY_CHECK_OP 
              | NOT_EQUAL_OP 
;

LogicOperator :  GTE_OP
            | LTE_OP
            | LT_OP
            | GT_OP
;

Connective : AND_OP
      | OR_OP
      | NAND_OP
      | XOR_OP
      | XNOR_OP
      | NOR_OP
      | IF_AND_ONLY_IF_OP
      | IF_THEN_OP
;

Type: NumericType
      | STRING_TYPE
      | TRUTH_TYPE
;

NumericType: INTEGER_TYPE
      | FLOAT_TYPE
;

Value: INTEGER
    | STRING
    | BOOLEAN
    | FLOAT
;

%%

void yyerror(char *s) {
 fprintf(stderr, "%s at %s\n", s,yytext);
}

int main(void){
 yyparse();
  if(yynerrs < 1){
	  printf("Program has been parsed successfully!\n");
	}
 return 0;
}

