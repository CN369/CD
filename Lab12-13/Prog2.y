%{
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
void yyerror(char const *s);
int yylex();
%}  

%token ZERO ONE

%%
S   :   N '+' N {$$=$1+$3;printf("%d\n", $$);}
    |   N       {$$=$1;printf("%d\n", $$);}
    ;
N   :   L       {}
L   :   L B     {$$=$1*2+$2;}
    |   B       {$$=$1;}
    ;
B   :   ZERO    {$$=$1;}
    |   ONE     {$$=$1;}
    ;
%%

int main(){
    printf("Enter the input expression: ");
    yyparse();
    printf("Valid expression");
}

void yyerror(char const *s){
    printf("\nInvalid expression\n");
    printf("Something went wrong:  %s\n",s);
    exit(0);
}