%{
#include<stdio.h> 
%} 
%%
"MOVE"|"LEFT"|"RIGHT"|"UP"|"DOWN" {
    printf("\nToken: %s ", yytext);
}
[0-9]|[1-9][0-9]* {
    printf("\nToken: %s ", yytext);
}
[ \t\n]+ 
. {
    printf("\nInvalid token: %s",yytext);
}
%%

main(void)
{
yyin= fopen("input3.txt","r");

yylex();


 
}
 
int yywrap()
{
return(1);
}