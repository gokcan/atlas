#include <stdio.h>

extern int yylex();

int main(void){
    int token = yylex();
    char* tokens[] = {
        "NAND_OP",
        "XOR_OP",
        "XNOR_OP",
        "OR_OP",
        "NOR_OP",
        "NOT_OP",
        "EQUALITY_CHECK_OP",
        "NOT_EQUAL_OP",
        "IF_AND_ONLY_IF_OP",
        "IF_THEN_OP",
        "BOLD_ARROW_OP",
        "WHILE_STMT",
        "AND_OP",
        "EQUAL_OP",
        "MUL_OP",
        "DIV_OP",
        "REMAINDER_OP",
        "GTE_OP",
        "LTE_OP",
        "GT_OP",
        "LT_OP",
        "ADD_OP",
        "SUB_OP",
        "STDIN_OP",
        "STDOUT_OP",
        "TRUTH_TYPE",
        "INTEGER_TYPE",
        "STRING_TYPE",
        "FLOAT_TYPE",
        "RELATION_TYPE",
        "IF_CLAUSE",
        "ELSE_CLAUSE",
        "CONST_IDENTIFIER",
        "BOOLEAN",
        "STRING",
        "TRUTH_VAL",
        "FLOAT",
        "INTEGER",
        "IDENTIFIER"
    };

    while(token){
        if(token < 149){
          printf(" %c ", token);
        }
        else{
          printf(" %s ", tokens[token-149]);
        }
        token = yylex();
    }

    return 0;
}



