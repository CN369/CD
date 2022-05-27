%{
#include <stdio.h>
#include <stdlib.h>
int count=0,t=0;
void yyerror(char const *s);
int yylex();
%}
%token ID NUM SELECT DISTINCT FROM WHERE LE GE EQ NE OR AND LIKE GROUP HAVING ORDER ASC DESC
%right '='
%left AND OR
%left '<' '>' LE GE EQ NE

%%

    S         : ST1';' {
                    printf("\nINPUT ACCEPTED\n");
                    printf("\nNumber of attributes selected : %d",count);
                    printf("\nNumber of conditional statement : %d", t );exit(0);
                };
    ST1     : SELECT attributeList FROM tableList ST2
               | SELECT DISTINCT attributeList FROM tableList ST2
               ;
    ST2     : WHERE COND ST3 
               | ST3
               ;
    ST3     : GROUP attrList ST4 
               | ST4
               ;
    ST4     : HAVING COND ST5 
               | ST5
               ;
    ST5     : ORDER attrList ST6 
               |
               ;
    ST6     : DESC
               | ASC
               |
               ;
  attributeList :     ID','attributeList {count++;}
               | '*'
               | ID {count++;}
               ;
  attrList :     ID','attrList 
               | '*'
               | ID 
               ;
 tableList    : ID',' tableList
               | ID
               ;
    COND    : COND OR COND {t++;}
               | COND AND COND {t++;}
               | E
               ;
    E         : F '=' F {t++;}
               | F '<' F {t++;}
               | F '>' F {t++;}
               | F LE F {t++;}
               | F GE F {t++;}
               | F EQ F {t++;}
               | F NE F {t++;}
               | F OR F {t++;}
               | F AND F {t++;}
               | F LIKE F {t++;}
               ;
    F         : ID
               | NUM 
               ;
%%

int main()
{
    printf("Enter the SQL query \n");
    yyparse();
}   
void yyerror(char const *s){
    printf("Invalid Expresion!!!!\n"); exit(0);
}