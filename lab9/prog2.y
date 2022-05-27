%{
#include<stdio.h>
int yylex();
int yyerror(char* s);
%}
%token ID NUM OPENING_PARANTHESIS CLOSING_PARANTHESIS
%token RELATIONAL_OPERATOR
%left RELATIONAL_OPERATOR
%%
RelationalExpression : E {
printf("Valid Relational Expression\n\n");
return 0;
}
E : expr RELATIONAL_OPERATOR expr | OPENING_PARANTHESIS E CLOSING_PARANTHESIS
expr : ID | NUM
%%

int main(){
printf("Enter expression:\n");
yyparse();
}

int yyerror(char* s) {
printf("Invalid Relational Expression\n\n");
}
