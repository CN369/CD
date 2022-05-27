%{
    #include <stdio.h>
    #include <stdlib.h>
%}

%token num
%left '+'
%left '*'

%%
E    :    E '+' T    {printf("+ ");}
     |    T 
     ;
T    :    T '*' F    {printf("* ");}
     |    F 
     ;
F    :    '(' E ')'  
     |    num        {printf("%d ", $1);}
%%

yyerror(char const *s){
    printf("\nInvalid expression\n");
    printf("Something went wrong:  %s\n",s);
    exit(0);
}

int main(){
    printf("Enter the input expression: ");
    yyparse();
    printf("\nValid expression");
}