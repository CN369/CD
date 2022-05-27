%{
#include<stdio.h>
int yylex();
int yyerror(char* s);
%}

%token ID NUM OPENING_PARANTHESIS CLOSING_PARANTHESIS
%token LOGICAL_OPERATOR
%left LOGICAL_OPERATOR
%%
LogicalExpression : E {
printf("Valid logical expression\n\n");
return 0;
}
E : expr LOGICAL_OPERATOR expr | OPENING_PARANTHESIS E CLOSING_PARANTHESIS
expr : ID | NUM
%%
int main()
{
printf("Enter valid logical expression\n");
yyparse();
}
int yyerror(char* s) 
{
printf("Invalid logical expression\n\n");
}
