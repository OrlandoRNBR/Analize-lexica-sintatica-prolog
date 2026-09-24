#ifndef _yy_defines_h_
#define _yy_defines_h_

#define VALOR 257
#define NAO 258
#define E 259
#define OU 260
#define SE 261
#define SE_SOMENTE_SE 262
#define ABRE 263
#define FECHA 264
#define SIMB 265
#define VERDADEIRO 266
#define FALSO 267
#ifdef YYSTYPE
#undef  YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
#endif
#ifndef YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
typedef union YYSTYPE {
    int iVal;
    float fVal;
    char *strVal;
} YYSTYPE;
#endif /* !YYSTYPE_IS_DECLARED */
extern YYSTYPE yylval;

#endif /* _yy_defines_h_ */
