%{
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
void yyerror(char const *s);
int yylex();
int max(int a, int b);
int min(int a, int b);
int idx=-1, v[4]={0, 1, INT_MIN, INT_MAX};
%}  

%token DIGIT MAX MIN ADD MUL

%%
SS  : S T
    ;
S   :   ADD  {idx=0;}
    |   MUL  {idx=1;}
    |   MAX  {idx=2;}
    |   MIN  {idx=3;}
    ;
T   :   DIGIT {
        if(idx==0)v[idx]+=$1;
        else if(idx==1)v[idx]*=$1;
        else if(idx==2)v[idx]=max(v[idx], $1);
        else if(idx==3)v[idx]=min(v[idx], $1);
    }
    |   T DIGIT {
        if(idx==0)v[idx]+=$2;
        else if(idx==1)v[idx]*=$2;
        else if(idx==2)v[idx]=max(v[idx], $2);
        else if(idx==3)v[idx]=min(v[idx], $2);
    }
    |   
    ;
%%

int main(){
    printf("Enter the input expression: ");
    yyparse();
    printf("Valid expression\n");
    printf("Result: %d\n", v[idx]);
}

void yyerror(char const *s){
    printf("\nInvalid expression\n");
    printf("Something went wrong:  %s\n",s);
    exit(0);
}

int min(int a, int b){
    return a<b ? a : b;
}

int max(int a, int b){
    return a>b ? a : b;
}