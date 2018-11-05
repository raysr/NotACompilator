
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

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
     mc_If = 259,
     mc_Execut = 260,
     mc_while = 261,
     bibl_tab = 262,
     bibl_boucle = 263,
     bibl_calcul = 264,
     SEP = 265,
     mc_Deb = 266,
     mc_Fin = 267,
     mc_Si = 268,
     mc_Faire = 269,
     mc_Fait = 270,
     mc_Pour = 271,
     mc_Jusque = 272,
     mc_Var = 273,
     mc_INT = 274,
     mc_REAL = 275,
     mc_STRING = 276,
     mc_CHAR = 277,
     IDF = 278,
     OPREL = 279,
     AFF = 280,
     PLUS = 281,
     SUST = 282,
     MULT = 283,
     DIV = 284,
     CONST_ENT = 285,
     CONST_REAL = 286,
     String = 287
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 19 "Syntaxe.y"

int entier;
float reel;
char* str;
char car;
   


/* Line 1676 of yacc.c  */
#line 93 "Syntaxe.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


