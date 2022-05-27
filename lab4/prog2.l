%{
#include<stdio.h> 
int digits=0,val=0;
%}
DIGIT    [0-9]
%%
{DIGIT} {
    if(digits==0)
    printf("Digits are ");
    printf("%s ", yytext);
    digits++;
}
. {
    printf("");
}
%%

main(void)
{
yyin= fopen("input2.txt","r");

yylex();

printf("\n\nTotal Digits are: %d",digits);

 
}
 
int yywrap()
{
return(1);
}