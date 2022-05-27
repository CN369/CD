%{ 
#include "y.tab.h" 
#include<stdio.h> 
int yylval; 
%} 
%% 
"int"[ ]+ {return KEYWORD;} 
"float"[ ]+ {return KEYWORD;} 
"char"[ ]+ {return KEYWORD;} 
[a-zA-Z][a-zA-Z0-9]* {return ID;} 
[0-9]+ {return NUMBER;} 
[ \t] ; 
[,] {return COMMA;} 
[;] {return SEMICOLON;} 
\n {return 0;} 
. {return yytext[0];} 
%% 
int yywrap() 
{ 
return 1; 
}
