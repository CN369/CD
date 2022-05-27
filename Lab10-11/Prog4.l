%{
    #include <stdio.h>
    #include "y.tab.h"
%}

%%
[ \t] ;
\n {return 0;}
. {return yytext[0];}
%%

yywrap(){
	return 1;
}