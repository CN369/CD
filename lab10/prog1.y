%{
#include<stdio.h>
#include <stdlib.h>
%}

%token NUMBER ID                        
%left '+' '-'                                          
%left '*' '/'
%%

expr: expr '+' expr  {printf("exp -> expr + expr\n");}                                      
     |expr '-' expr {printf("exp -> expr - expr\n");}  
     |term      {printf("exp -> term\n");}  
     ;
term: term '*' factor {printf("term -> term * factor\n");}  
     | factor {printf("term -> factor\n");}  
     ;
factor: '('expr')' {printf("factor -> (expr)\n");} 
     | NUMBER  {printf("factor -> factor\n");} 
     ;
     
%%

main()
{
printf("Enter the expression\n");
yyparse();
printf("\nExpression is valid\n");
exit(0);
}

int yyerror(char *s)
{
printf("\nExpression is invalid");
exit(0);
}