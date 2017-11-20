%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "y.tab.h"
    void yyerror(char *);
    int yylex(void);
    extern char* yytext;
%}

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

%left ADD_OP SUB_OP
%left MUL_OP DIV_OP

// %nonassoc Negation
%%

Program: PROG_INIT Block PROG_END
;

Block  : Statements Block
      | Statements
;

Statements: Stmt
| Stmt Statements
;

Stmt  : Function
      | Pred
      | Other
;

Other : FunctionCall
      | While
      | Conditional
      | Assignment
      | Declaration
      | RelationStatement
      | Std
;

Declaration: TypeModifier Type IDENTIFIER Semicolon
;

Assignment : TypeModifier Type IDENTIFIER ASSIGN_OP AssignmentTail
            | TypeModifier Type TRUTH_VAL ASSIGN_OP AssignmentTail
          | IDENTIFIER ASSIGN_OP AssignmentTail
          | TRUTH_VAL ASSIGN_OP AssignmentTail
;

TypeModifier : CONST_IDENTIFIER
;

AssignmentTail:  LogicExpr
              |  LEQExpr
              |  ArithmeticExpression
              ;

FunctionCall : IDENTIFIER '(' CallParameterList ')' Semicolon
;

CallParameterList : CallParameterList ',' CallParameter
                  | CallParameter
;

CallParameter: IDENTIFIER
              | Value
              | TRUTH_VAL
;

Semicolon : ';'
          |
;

Std: STDIN_OP IDENTIFIER '+' Value
    | STDOUT_OP IDENTIFIER '+' Value
    | STDIN_OP Value
    | STDOUT_OP Value
;

RelationStatement: RELATION_TYPE IDENTIFIER ASSIGN_OP '[' Value ':' Value ']' Semicolon
;

CompoundProposition: CompoundProposition Connective CompoundProposition
| Negation CompoundProposition 
| Proposition
| '(' CompoundProposition ')'
;
Proposition: TRUTH_VAL
            | BOOLEAN
;

Conditional: IF_CLAUSE LogicExpr '{' Statements '}'
| IF_CLAUSE LogicExpr '{' Statements '}' ELSE_CLAUSE '{' Statements '}'
;

LogicExpr: LogicExpr ComparisonOperator CompoundProposition
      | CompoundProposition
;

LEQExpr : LEQExpr LogicOperator NumericType
      | BOOLEAN
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

While: WHILE_STMT LogicExpr '{' Statements '}' ;

Negation : NOT_OP
;

ArithmeticExpression : NumericType ArithmeticOperator NumericType
                      | '(' ArithmeticExpression ')'
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
      | RELATION_TYPE
;

NumericType: INTEGER_TYPE
      | FLOAT_TYPE
      |
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
