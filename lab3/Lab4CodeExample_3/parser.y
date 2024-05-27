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
%token TYPE DIM ASSUME
%token FOR TO NEXT
%token ICONST
%token FCONST
%token CCONST

%left LT GT INC /*LT GT has lowest precedence*/
%left ADDOP 
%left MULOP /*MULOP has highest precedence*/


%start code




%%
code:stmt code|;
stmt:TYPE ID LPAREN RPAREN;
stmt:LBRACE;
stmt:RBRACE;
stmt:ASSUME ID INT;
stmt:ID ASSIGN ICONST;
stmt:ID ASSIGN ICONST ADDOP ID;
stmt:ID LPAREN ID RPAREN;

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
