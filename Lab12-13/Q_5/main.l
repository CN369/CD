%{
    #include <stdio.h>
    #include "y.tab.h"
%}

digit [0-9]

%%
{digit}+ {yylval = atoi(yytext); return DIGIT;}
max {return MAX;}
min {return MIN;}
[+] {return ADD;}
[*] {return MUL;}
[ \t] {;}
\n {return 0;}
. {return yytext[0];}
%%

int yywrap(){
	return 1;
}