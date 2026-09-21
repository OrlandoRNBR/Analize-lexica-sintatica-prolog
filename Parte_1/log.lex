%{
#include <string.h>
#include "y.tab.h"

// Declara��o para o Flex saber que a fun��o existe no Yacc
void yyerror(const char *s);
%}

%option noyywrap

%%

"~"     { return NAO; }
"&"     { return E; }
"|"     { return OU; }
"->"    { return SE; }
"<->"   { return SE_SOMENTE_SE; }
"("     { return ABRE; }
")"     { return FECHA; }

[a][0-9]* { 
    yylval.strVal = strdup(yytext); 
    return SIMB; 
}

[ \t\n]+ ; /* Ignora espa�os, tabula��es e quebras de linha */

. { yyerror("Caractere inv�lido"); }

%%


