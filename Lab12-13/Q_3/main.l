%{
    #include <stdio.h>
    #include "y.tab.h"
%}

%%
[0-9] {return digit;}
[\t] ;
\n {return 0;}
. {return yytext[0];}
%%

int yywrap(){
    return 1;
}