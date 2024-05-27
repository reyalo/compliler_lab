%option noyywrap


%%
%%
"Class"([0-9]){printf("%s->Class\n",yytext);}
([0-9])([0-9])([0-9])([0-9]) {printf("%s->Year\n",yytext);}
%%
%%
