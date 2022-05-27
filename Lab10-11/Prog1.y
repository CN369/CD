%{
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
%}  

%token digit 
%left '+' '-'
%left '*' '/'

%%
exp     :     exp addop term      {printf("Rule 1: exp -> exp addop term\n");}  
        |     term                {printf("Rule 2: exp -> term\n");}
        ; 
addop   :     '+'                 {printf("Rule 3: addop -> +\n");}
        |     '-'                 {printf("Rule 4: addop -> -\n");}
        ;
term    :     term mulop factor   {printf("Rule 5: term -> term mulop factor\n");}
        |     factor              {printf("Rule 6: term -> factor\n");}
        ;
mulop   :     '*'                 {printf("Rule 7: mulop -> *\n");}
        ;
factor  :     '(' exp ')'         {printf("Rule 8: factor -> ( exp ) \n");}
        |     number              {printf("Rule 9: factor -> number\n");}
        ;
number  :     number digit        {printf("Rule 10: number -> number digit\n");}
        |     digit               {printf("Rule 11: number -> digit\n");}
        ;
%%

main(){
    printf("Enter the input expression: ");
    yyparse();
    printf("Expression is Valid");
    exit(0);

}

int yyerror(char *s)
{
printf("\nExpression is invalid");
exit(0);
}