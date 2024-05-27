//1803116
//assume XX : INTEGER;
//if (XX < 3.0) XX++;
//%option noyywrap

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

"<- type INT"       {printf("%s -> INT\n",yytext); return INT; }

"MAIN"       {printf("%s -> TYPE\n",yytext); return TYPE; }
"dhori"       {printf("%s -> DECLR\n",yytext); return DECLR; }
"double"    { return DOUBLE; }
"char"		{ return CHAR; }

"if"		{return IF;}
"else"		{return ELSE;}
"<-"       {printf("%s -> ASSIGN\n",yytext); return ASSIGN; }

"for"		{printf("%s -> FOR\n",yytext); return FOR;}
"to"		{printf("%s -> TO\n",yytext); return TO;}
"next"		{printf("%s -> NEXT\n",yytext); return NEXT;}

"++"       {printf("%s -> INC\n",yytext); return INC; }
"jog"       {printf("%s -> ADDOP\n",yytext); return ADDOP; }
"-"       { return SUBOP; }
"*"       {printf("%s -> MULOP\n",yytext);  return MULOP; }
"/"       { return DIVOP; }
"=="      { return EQUOP; }
">"       { return GT; }
"<"       { printf("%s -> LT\n",yytext);return LT; }

"("       { printf("%s -> LPAREN\n",yytext);return LPAREN; }
")"       { printf("%s -> RPAREN\n",yytext);return RPAREN; }
"suru"       { printf("%s -> LBRACE\n",yytext);return LBRACE; }
"sesh"       { printf("%s -> RBRACE\n",yytext);return RBRACE; }
"{"       { return LBRACE; }
"}"       { return RBRACE; }
";"       {printf("%s -> SEMI\n",yytext); return SEMI; }
// ":"       {printf("%s -> ASSIGN\n",yytext);  return ASSIGN; }

{ID}        {printf("%s -> ID\n",yytext);return ID;}
{ICONST}    {yylval=atoi(yytext);return ICONST;}
{FCONST}    {yylval=atoi(yytext);return FCONST;}
{CCONST}    {return CCONST;}

"\n"        { lineno += 1; }
[ \t\r\f]+  

.       { yyerror("Unrecognized character"); }
