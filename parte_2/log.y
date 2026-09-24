%{
#include <stdio.h>
#include <stdlib.h>

// Declara��es obrigat�rias para o compilador C
int yylex(void);
void yyerror(const char *s);
extern FILE *yyin;
%}




%union {
    int iVal;
    float fVal;
    char *strVal;
}

%token <iVal> VALOR
%token NAO E OU SE SE_SOMENTE_SE ABRE FECHA
%token <strVal> SIMB
%token VERDADEIRO
%token FALSO
%type <iVal> form
%type <iVal> inicio

%start inicio

%%

inicio: form { 
    printf("\nResultado: %s\n", $1 ? "v" : "f");
}

form: VERDADEIRO{ $$ = 1; }
    | FALSO{ $$ = 0; }
    | ABRE NAO form FECHA { printf("regra 2: form ::= ( ~ form )\n"); $$ = !$3;}
    | ABRE form E form FECHA { printf("regra 3: form ::= ( form & form )\n"); $$ = $2 && $4; }
    | ABRE form OU form FECHA { printf("regra 4: form ::= ( form | form )\n"); $$ = $2 || $4;}
    | ABRE form SE form FECHA { printf("regra 5: form ::= ( form -> form )\n"); $$ = (!$2) || $4;}
    | ABRE form SE_SOMENTE_SE form FECHA { printf("regra 6: form ::= ( form <-> form )\n"); $$ = ($2 == $4); }
    ;


%%

void yyerror(const char *s) {
    extern char *yytext; 
    printf("\n %s %d %s %s \n", "token errado. \n Codigo: ", yychar, "\n texto: ", yytext); exit(1);
}

int main(int argc, char **argv) {
    if (argc > 1) { 
        FILE *file = fopen(argv[1], "r"); 
        if (!file) {
            perror("Erro ao abrir arquivo");
            return 1;
        }
        yyin = file;
    } else {
        yyin = stdin;
    }

    yyparse();
    return 0;
}

