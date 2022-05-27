%{
#include "y.tab.h"
#include<stdio.h>
int yylval;
%}
%%
"&&"|"||" {return LOGICAL_OPERATOR;}
"(" {return OPENING_PARANTHESIS;}
")" {return CLOSING_PARANTHESIS;}
[a-zA-Z][a-zA-Z0-9]* {return ID;}
[0-9]+ {return NUM;}
[ \t] ; 
\n {return 0;}
. {return yytext[0];}
%%
int yywrap(){
return 1;
}
