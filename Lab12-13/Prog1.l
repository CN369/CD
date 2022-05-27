%{
    #include <stdio.h>
    #include "y.tab.h"
%}

%%
"a" {return letter;}
"(" {return opening_bracket;}
")" {return closing_bracket;}
[\t] {;}
\n {return 0;}
. {return yytext[0];}
%%

int yywrap(){
	return 1;
}