%{
#include<stdio.h> 
%}
%%
"day" ;
%%

void main(void)
{
yyin= fopen("input.txt","r");
yyout= fopen("output.txt","w");
yylex();
 
}
 
int yywrap()
{
return(1);
}