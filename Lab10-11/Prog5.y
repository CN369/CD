%{
    #include <stdio.h>
    #include <stdlib.h>
%}

%token character

%%
S    :    '(' L ')'
     |    character         {printf("%c", $1);}
     ;
L    :    L ',' S
     |    S 
     ;
%%

main(){
    printf("Enter the input expression: ");
    yyparse();
    printf("\nValid expression");
}

yyerror(){ 
    printf("\nInvalid expression");
    exit(0);
}