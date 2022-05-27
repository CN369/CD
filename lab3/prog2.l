%{
#include<stdio.h>
int lines=0, words=0,smallLetters=0,capitalLetters=0,digits=0;
int specialCharacters=0,total=0,operators=0 ;
%}
%%
 
[\n] { lines++; words++;}
[\t  ' '] words++;
[A-Z] capitalLetters++;
[a-z] smallLetters++;
[0-9] digits++; 
"+"|"-"|"*"|"/" operators++; 
. specialCharacters++;
%%

main(void)
{
yyin= fopen("input.txt","r");
yylex();
total=smallLetters+capitalLetters+digits+specialCharacters+operators; 
printf("\n %d lines", lines);
printf("\n %d words",words);
printf("\n %d small letters", smallLetters);
printf("\n %d capital letters",capitalLetters);
printf("\n %d digits", digits); 
printf("\n %d special characters",specialCharacters); 
printf("\n %d operators",operators); 
printf("\n %d Total characters\n",total);
}
 
int yywrap()
{
return(1);
}