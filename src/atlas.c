#include <stdio.h>
#include <stdlib.h>

extern int yylex();
int yyparse();

int main(void){

    int ret = yyparse();
    if (ret!=0)
      return EXIT_FAILURE;
    return EXIT_SUCCESS;

}
