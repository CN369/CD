%{ 
#include<stdio.h>
int yylex();
int yyerror(char* s);
int flag=0; 
%} 
%token ID KEYWORD SEMICOLON COMMA NUMBER 

%% 

stmt: KEYWORD list SEMICOLON {printf("\nDeclaration statement is valid");}  ; 
list: ID COMMA list | ID ; 

%% 
int main() 
{ 
printf("Enter valid declaration statement\n"); 
yyparse(); 
} 
int yyerror(char* s) 
{ 
printf("Invalid declaration statement\n"); 
}
