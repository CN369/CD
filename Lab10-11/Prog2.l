%{
    #include "y.tab.h"
    extern yylval;

%}

%%
[a-zA-Z][a-zA-Z0-9]* {return ID;}
[0-9]+ {return NUM;}
"&"|"|"|"=="|"!=" {return BINARY_OP;}
"!" {return UNARY_OP;}
[\t] ;
\n {return 0;}
. {return yytext[0];}
%%
int yywrap()
{
return(1);
}