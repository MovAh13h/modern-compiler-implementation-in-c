/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     FUNCTION = 258,
     TYPE = 259,
     ID = 260,
     LBRACK = 261,
     OF = 262,
     DO = 263,
     THEN = 264,
     ELSE = 265,
     SEMICOLON = 266,
     ASSIGN = 267,
     OR = 268,
     AND = 269,
     GE = 270,
     GT = 271,
     LE = 272,
     LT = 273,
     NEQ = 274,
     EQ = 275,
     MINUS = 276,
     PLUS = 277,
     DIVIDE = 278,
     TIMES = 279,
     UMINUS = 280,
     STRING = 281,
     INT = 282,
     COMMA = 283,
     COLON = 284,
     LPAREN = 285,
     RPAREN = 286,
     RBRACK = 287,
     LBRACE = 288,
     RBRACE = 289,
     DOT = 290,
     ARRAY = 291,
     IF = 292,
     WHILE = 293,
     FOR = 294,
     TO = 295,
     LET = 296,
     IN = 297,
     END = 298,
     BREAK = 299,
     NIL = 300,
     VAR = 301
   };
#endif
/* Tokens.  */
#define FUNCTION 258
#define TYPE 259
#define ID 260
#define LBRACK 261
#define OF 262
#define DO 263
#define THEN 264
#define ELSE 265
#define SEMICOLON 266
#define ASSIGN 267
#define OR 268
#define AND 269
#define GE 270
#define GT 271
#define LE 272
#define LT 273
#define NEQ 274
#define EQ 275
#define MINUS 276
#define PLUS 277
#define DIVIDE 278
#define TIMES 279
#define UMINUS 280
#define STRING 281
#define INT 282
#define COMMA 283
#define COLON 284
#define LPAREN 285
#define RPAREN 286
#define RBRACK 287
#define LBRACE 288
#define RBRACE 289
#define DOT 290
#define ARRAY 291
#define IF 292
#define WHILE 293
#define FOR 294
#define TO 295
#define LET 296
#define IN 297
#define END 298
#define BREAK 299
#define NIL 300
#define VAR 301




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 15 "tiger.grm"
{
	int pos;
	int ival;
	string sval;
	}
/* Line 1529 of yacc.c.  */
#line 147 "y.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

