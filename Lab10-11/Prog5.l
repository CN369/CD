%{
    #include "y.tab.h"
%}

%%
[a-z] {
    yylval=yytext[0];
    return character;
}
[\t] ;
\n {return 0;}
. {return yytext[0];}
%%

int yywrap()
{
return(1);
}