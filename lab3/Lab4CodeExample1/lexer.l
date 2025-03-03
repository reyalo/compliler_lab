%option noyywrap

%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include "parser.tab.h"
	
	int lineno = 1; // initialize to 1
	void yyerror();
%}

alpha     [a-zA-Z]
digit     [0-9]
alnum     {alpha}|{digit}
print     [ -~]

ID        {alpha}{alnum}*
ICONST    [0-9]{digit}*
FCONST    {digit}*"."{digit}+
CCONST    (\'{print}\')
%%

"//".*        { } 

"int"       {printf("%s -> INT\n",yytext); return INT; }
"dim"       {printf("%s -> DIM\n",yytext); return DIM; }
"integer"       {printf("%s -> INTEGER\n",yytext); return INTEGER; }
"as"       {printf("%s -> AS\n",yytext); return AS; }
"double"    { return DOUBLE; }
"char"		{ return CHAR; }

"if"		{return IF;}
"else"		{return ELSE;}

"for"		{printf("%s -> FOR\n",yytext); return FOR;}
"to"		{printf("%s -> TO\n",yytext); return TO;}
"next"		{printf("%s -> NEXT\n",yytext); return NEXT;}

"+"       {printf("%s -> ADDOP\n",yytext); return ADDOP; }
"-"       { return SUBOP; }
"*"       {printf("%s -> MULOP\n",yytext);  return MULOP; }
"/"       { return DIVOP; }
"=="      { return EQUOP; }
">"       { return GT; }
"<"       { return LT; }

"("       { return LPAREN; }
")"       { return RPAREN; }
"{"       { return LBRACE; }
"}"       { return RBRACE; }
";"       {printf("%s -> SEMI\n",yytext); return SEMI; }
"="       {printf("%s -> ASSIGN\n",yytext);  return ASSIGN; }

{ID}        {printf("%s -> ID\n",yytext);return ID;}
{ICONST}    {yylval=atoi(yytext);return ICONST;}
{FCONST}    {return FCONST;}
{CCONST}    {return CCONST;}

"\n"        { lineno += 1; }
[ \t\r\f]+  

.       { yyerror("Unrecognized character"); }
