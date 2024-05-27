%option noyywrap

%{
#include "prog1.tab.h"
%}

%%
"I" {printf("%s->Noun\n",yytext); return(NOUN);}
"Eat" {printf("%s->Verb\n",yytext);return(VERB);}
"Rice" {printf("%s->Object\n",yytext);return(OBJECT);}
%%
