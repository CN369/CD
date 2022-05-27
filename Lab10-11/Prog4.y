%{
  #include<stdio.h>
  #include<stdlib.h>
  void yyerror(char *s);
%}

%union
{
    struct node
    {
        float val;
        int pos;
    }bit;
}
%type <bit> S L B
  
%%
S   :   L '.' L     { float base=1; for(int i=0;i<$3.pos;i++)base*=2;
                      printf("Value = %f", $1.val + $3.val/base);}
    |   L           { printf("Value = %f", $$.val);};
L   :   L B         { $$.val = $1.val*2+$2.val; $$.pos = $1.pos + $2.pos; }
    |   B           { $$.val = $1.val; $$.pos = $1.pos; };
B   :   '0'        { $$.val = 0; $$.pos = 1; }
    |   '1'         { $$.val = 1; $$.pos = 1; }
    ;
%%
  
main(){
    printf("Enter the input expression: ");
    yyparse();
    printf("\nValid expression");
}

yyerror(char *s){ 
    printf("\nInvalid expression: %s", s);
    exit(0);
}