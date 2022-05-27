%{
    #include <stdio.h>
    #include "y.tab.h"
%}

%%
[0-9]+ {
    yylval=atoi(yytext);
    return num;
}
"+"	  return *yytext;
"-"	  return *yytext;
[()]  return *yytext;
[\t]  ;
\n    {return 0;}
.     {return yytext[0];}
%%

yywrap(){
	return 1;
}