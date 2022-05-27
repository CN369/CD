%{
  #include<stdio.h>
  #include<stdlib.h>
  void yyerror(char *s);
  int power(int a, int b);
%}

%token ZERO ONE
  
%%
S   :   L '.' L     { $$.val = $1.val + $2.val/power(2, $2.pos); }
    |   L           { $$.val = $1.val; }
    ;
L   :   L B         { $$.val = $1.val*2+$2.val; $$.pos = $1.pos + $2.pos; }
    |   B           { $$.val = $1.val; $$.pos = $1.pos; }
    ;
B   :   ZERO        { $$.val = 0; $$.pos = 1; }
    |   ONE         { $$.val = 1; $$.pos = 1; }
    ;
%%
  
main(){
    printf("Enter the input expression: ");
    yyparse();
    printf("\nValid expression");
}

int power(int a, int b){
    if(a==0)return 0;
    if(b==0)return 1;
    int y;
    if(b%2==0){
        y=power(a, b/2);
        y=y*y;
    }
    else{
        y=a;
        
    }
}

yyerror(char *s){ 
    printf("\nInvalid expression: %s", s);
    exit(0);
}