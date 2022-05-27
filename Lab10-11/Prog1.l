%{
    #include "y.tab.h"
    extern yylval;

%}

%%
[0-9] {return digit;}
[\t] ;
\n {return 0;}
. {return yytext[0];}
%%

int yywrap()
{
return(1);
}