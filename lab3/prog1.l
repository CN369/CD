%{
#include<stdio.h>
#include <string.h> 
#include <math.h>
int totalOperators = 0, totalOperands = 0, valid = 1, top = -1, eval=0; 
char stack[100]; 
char operator;
int result=0;
%}

%%
"(" { 
    top++; 
    stack[top] = '('; 
}
")" { 
    if (stack[top] != '(') { 
        valid = 0;     
    } 
    else if(totalOperands>0 && (totalOperands-totalOperators)!=1){
        valid=0;
    }
    else{
        top--;
        totalOperands=1;
        totalOperators=0;
    } 
}
"{" {
    top++; 
    stack[top] = '{'; 
} 
"}" { 
    if (stack[top] != '{') { 
        valid = 0;     
    } 
    else if(totalOperands>0 && (totalOperands-totalOperators)!=1){
        valid=0;
    }
    else{
        top--;
        totalOperands=1;
        totalOperators=0;
    } 
}
"+"|"-"|"*"|"/" { 
    totalOperators++; 
    operator= yytext[0]; 
} 
[0-9]+|[a-zA-Z][a-zA-Z0-9_]* { 
    totalOperands++;
    int n= strlen(yytext);
    int num=0,mul=pow(10,n-1),k=0;
    for(k=0;k<n;k++){
        num+=(yytext[k]-48)*mul;
        mul/=10;
    }
    if(eval==0)
    {   result=num;
        eval=1;
    }else{
         
        if(operator=='+')
            result+=num;
        else if(operator=='-')
            result-=num;
        else if(operator=='*')
            result*=num;
        else if(operator=='/')
            result/=num; 
        
    }
}   
.|\n {return 0;}
%%

int main()
{
    printf("Prem Kumar\n191210037\n");
    printf("\nEnter the expression:");
    yylex();
    if(valid==1 && top==-1)
    {
            printf("\nExpression is Valid\n");
            printf("\nResult: %d",result);
    }
    else
            printf("\nExpression is Invalid\n");
    
    return 0;

}

yywrap(void)
{
return 0;
}