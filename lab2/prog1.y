%{
#include<stdio.h>
int yylex();
void yyerror(char *s);
%}

%token NOUN VERB OBJECT
%start S

%%
S: NOUN VERB OBJECT
%%


int main(){
  yyparse();
  printf("Parsing Finished");
  return 0;
}

void yyerror(char *s){
  fprintf(stderr,"error: %s\n",s);
}