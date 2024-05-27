/*1803116
/*assume XX : INTEGER;
/*if (XX < 3.0) XX++;
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
%token ID SEMI
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
code:stmt stmt2 code|;
stmt:ASSUME ID ASSIGN TYPE SEMI|;
stmt2:IF LPAREN ID LT FCONST RPAREN ID INC SEMI|;
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
