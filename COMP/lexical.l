%{
int nb_ligne=1,nb_colonne=1;
int taille=0;
#include "syntaxique.tab.h"
#include <stdio.h> 
#include<string.h>
extern YYSTYPE yylval;
%}
lettre [a-zA-Z]
chiffre [0-9]

constReel {chiffre}+"."{chiffre}+
constEntier [0-9]*
idf [a-z][a-zA-Z0-9]*
bilb BOUCLE|Calcul|TAB
%%
"//"(.)*"//"

Programme|PROGRAMME|programme {taille=yyleng;nb_colonne+=yyleng;return mc_programme;}
CONST {taille=yyleng;nb_colonne+=yyleng;return mc_const;}
Integer {yylval.chaine=strdup(yytext);taille=yyleng;nb_colonne+=yyleng; return mc_entier;}
Real {yylval.chaine=strdup(yytext);taille=yyleng;nb_colonne+=yyleng; return mc_reel; }
{constEntier} {if(atoi(yytext)>(-32768) || atoi(yytext)<32767){printf("Dépassement de valeur maximale ,doit etre entre 32767 et -32768.\n ");} else taille=yyleng;yylval.entier=atoi(yytext); nb_colonne+=yyleng; return const_entier;}
{constReel} {taille=yyleng;yylval.reel=atof(yytext); nb_colonne+=yyleng; return const_reel;}

While {taille=yyleng;nb_colonne+=yyleng;return mc_while;}
EXECUT {taille=yyleng;nb_colonne+=yyleng;return mc_execut;}
IF {taille=yyleng;nb_colonne+=yyleng;return mc_if;}

; {taille=yyleng;nb_colonne+=yyleng;return pvg;}
, {taille=yyleng;nb_colonne+=yyleng;return virgule;}
"(" {taille=yyleng;nb_colonne+=yyleng; return parenthese_gauche;}
")" {taille=yyleng;nb_colonne+=yyleng; return parenthese_droite;}
"[" {taille=yyleng;nb_colonne+=yyleng; return crochet_gauche;}
"]" {taille=yyleng;nb_colonne+=yyleng; return crochet_droit;}
"{" {taille=yyleng;nb_colonne+=yyleng; return accolade_gauche;}
"}" {taille=yyleng;nb_colonne+=yyleng; return accolade_droite;}
":=" {taille=yyleng;nb_colonne+=yyleng;return op_affectation; }


{idf} {if(yyleng >12) printf ("Erreur , il faut moins de 12 caractères") ;
        else {taille=yyleng;yylval.chaine=strdup(yytext);	nb_colonne+=yyleng; return idf;}}

#{bilb}\n {taille=yyleng;nb_colonne+=yyleng;return mc_bilbiotheque;}

[\t] {taille=yyleng;nb_colonne+=yyleng;}
\n nb_ligne++;

[;,+*/-] {return yytext[0];}
!=|=|<|>|<=|>= {taille=yyleng;yylval.chaine=strdup(yytext);nb_colonne+=yyleng; return op_comp;}

. printf("Erreur lexicale à la ligne %d.\n",nb_ligne);

%%
int yywrap()
{ return 1;}
