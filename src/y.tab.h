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
     NAND_OP = 258,
     XOR_OP = 259,
     XNOR_OP = 260,
     OR_OP = 261,
     NOR_OP = 262,
     NOT_OP = 263,
     EQUALITY_CHECK_OP = 264,
     NOT_EQUAL_OP = 265,
     IF_AND_ONLY_IF_OP = 266,
     IF_THEN_OP = 267,
     BOLD_ARROW_OP = 268,
     WHILE_STMT = 269,
     AND_OP = 270,
     ASSIGN_OP = 271,
     MUL_OP = 272,
     DIV_OP = 273,
     REMAINDER_OP = 274,
     GTE_OP = 275,
     LTE_OP = 276,
     GT_OP = 277,
     LT_OP = 278,
     ADD_OP = 279,
     SUB_OP = 280,
     STDIN_OP = 281,
     STDOUT_OP = 282,
     TRUTH_TYPE = 283,
     INTEGER_TYPE = 284,
     STRING_TYPE = 285,
     FLOAT_TYPE = 286,
     RELATION_TYPE = 287,
     IF_CLAUSE = 288,
     ELSE_CLAUSE = 289,
     CONST_IDENTIFIER = 290,
     BOOLEAN = 291,
     STRING = 292,
     TRUTH_VAL = 293,
     FLOAT = 294,
     INTEGER = 295,
     IDENTIFIER = 296,
     COMMENT = 297,
     PROG_END = 298,
     PROG_INIT = 299,
     PRED = 300,
     FUNCTION = 301
   };
#endif
/* Tokens.  */
#define NAND_OP 258
#define XOR_OP 259
#define XNOR_OP 260
#define OR_OP 261
#define NOR_OP 262
#define NOT_OP 263
#define EQUALITY_CHECK_OP 264
#define NOT_EQUAL_OP 265
#define IF_AND_ONLY_IF_OP 266
#define IF_THEN_OP 267
#define BOLD_ARROW_OP 268
#define WHILE_STMT 269
#define AND_OP 270
#define ASSIGN_OP 271
#define MUL_OP 272
#define DIV_OP 273
#define REMAINDER_OP 274
#define GTE_OP 275
#define LTE_OP 276
#define GT_OP 277
#define LT_OP 278
#define ADD_OP 279
#define SUB_OP 280
#define STDIN_OP 281
#define STDOUT_OP 282
#define TRUTH_TYPE 283
#define INTEGER_TYPE 284
#define STRING_TYPE 285
#define FLOAT_TYPE 286
#define RELATION_TYPE 287
#define IF_CLAUSE 288
#define ELSE_CLAUSE 289
#define CONST_IDENTIFIER 290
#define BOOLEAN 291
#define STRING 292
#define TRUTH_VAL 293
#define FLOAT 294
#define INTEGER 295
#define IDENTIFIER 296
#define COMMENT 297
#define PROG_END 298
#define PROG_INIT 299
#define PRED 300
#define FUNCTION 301




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

