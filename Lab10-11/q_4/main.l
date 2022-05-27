%{
    #include "y.tab.h"
%}

%%
0 {
    yylval=0;
    return ZERO;
}
1 {
    yylval=1;
    return ONE;
}
[ \t] ;
\n {return 0;}
. {return yytext[0];}
%%

yywrap(){}