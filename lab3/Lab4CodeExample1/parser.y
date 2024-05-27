%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	void yyerror();
	extern int lineno;
	extern int yylex();
%}

%token INT IF ELSE WHILE CONTINUE BREAK PRINT DOUBLE CHAR
%token ADDOP SUBOP MULOP DIVOP EQUOP LT GT
%token LPAREN RPAREN LBRACE RBRACE SEMI ASSIGN
%token ID
%token INTEGER DIM AS
%token FOR TO NEXT
%token ICONST
%token FCONST
%token CCONST

%left LT GT /*LT GT has lowest precedence*/
%left ADDOP 
%left MULOP /*MULOP has highest precedence*/


%start code

%%
// code:ICONST ADDOP code|ICONST;
// code:term ADDOP code|term;
// term:ICONST MULOP term|ICONST;
code:exp{printf("%d\n",$1);};
exp:exp ADDOP exp{$$=$1+$3;printf("%d + %d\n",$1,$3);}
	|exp MULOP exp{$$=$1*$3;printf("%d * %d\n",$1,$3);}
	|ICONST{$$=$1;printf("%d\n",$1);};
%%

void yyerror ()
{
	printf("Syntax error at line %d\n", lineno);
	exit(1);
}

int main (int argc, char *argv[])
{
	yyparse();
	printf("Parsing finished!\n");	
	return 0;
}
