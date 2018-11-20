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
     mc_Algo = 258,
     mc_Deb = 259,
     mc_If = 260,
     mc_Execut = 261,
     mc_while = 262,
     mc_CONST = 263,
     bibl_tab = 264,
     bibl_boucle = 265,
     bibl_calcul = 266,
     SEP = 267,
     mc_INT = 268,
     mc_REAL = 269,
     IDF = 270,
     OPREL = 271,
     AFF = 272,
     PLUS = 273,
     SUST = 274,
     MULT = 275,
     DIV = 276,
     CONST_ENT = 277,
     CONST_REAL = 278,
     String = 279
   };
#endif
/* Tokens.  */
#define mc_Algo 258
#define mc_Deb 259
#define mc_If 260
#define mc_Execut 261
#define mc_while 262
#define mc_CONST 263
#define bibl_tab 264
#define bibl_boucle 265
#define bibl_calcul 266
#define SEP 267
#define mc_INT 268
#define mc_REAL 269
#define IDF 270
#define OPREL 271
#define AFF 272
#define PLUS 273
#define SUST 274
#define MULT 275
#define DIV 276
#define CONST_ENT 277
#define CONST_REAL 278
#define String 279




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 42 "Syntaxe.y"
{
int entier;
float reel;
char* str;
char car;
   }
/* Line 1529 of yacc.c.  */
#line 104 "Syntaxe.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

