DIGIT    [0-9]
ID       [a-zA-Z][a-zA-Z0-9]*
%%
{DIGIT}+    {
            printf( "Integer: %s \n", yytext);
            }

{DIGIT}+"."{DIGIT}*        {
            printf( "Float: %s \n", yytext );
            }

main|int|char|if|else|for|while|break|continue|return        {
            printf( "Keyword: %s\n", yytext );
            }

{ID}        printf( "Identifier: %s\n", yytext );

"+"|"-"|"*"|"/"|">"|"<"|"="   printf( "Operator: %s\n", yytext );

 
","|";"|"("|")"|"["|"]"|"{"|"}"  printf( "Separator: %s\n", yytext );

"{"[^}\n]*"}"     /* eat up single line comments */

[ \t\n]+          /* eat up whitespace */

.           printf( "Unrecognized character: %s\n", yytext );

%%
main(){
yylex();
}
yywrap(void)
{
return 0;
}