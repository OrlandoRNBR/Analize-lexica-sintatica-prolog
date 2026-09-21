#ifndef _yy_defines_h_
#define _yy_defines_h_

#define NAO 257
#define E 258
#define OU 259
#define SE 260
#define SE_SOMENTE_SE 261
#define ABRE 262
#define FECHA 263
#define SIMB 264
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
