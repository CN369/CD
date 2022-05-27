%{
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
int count=0;
void yyerror(char const *s);
int yylex();
%}  

%token letter opening_bracket closing_bracket 
%left '(' ')'

%%
P   :   opening_bracket P closing_bracket  
        {count++, printf("Rule 1: Printing Brackets...\n");}
    |   letter    {printf("Rule 2: Termination\n");}
    ;
%%

int main(){
    printf("Enter the input expression: ");
    yyparse();
    printf("Valid expression with %d matching parenthesis\n", count);
}

void yyerror(char const *s){
    printf("\nInvalid expression\n");
    printf("Something went wrong:  %s\n",s);
    exit(0);
}