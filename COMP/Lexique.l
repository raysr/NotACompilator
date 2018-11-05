%{
#include "Syntaxe.tab.h"
//#include "Syntaxe.tab.c"
#include<string.h>
#include <stdio.h>
#include <stdlib.h>
int nbrligne=1;
int nbrcolonne=1;
int entite = 0;
int qc=0;
	typedef struct {
		char nom[20];
		char code[20];
		char type[20];
		int  nbrl;
		int  nbrc;
		int  taille;
		int val;
		
	} type_TS;

	type_TS TS[100];

int	cpt = 0;

	int found(char nom[]);
	void insert(char nom[], char code[],int nbrl,int nbrc,int taille,int val, char type[]);
	void show();
	extern YYSTYPE yylval;

int found(char nom[]) {
	int i = 0;
	for (i = 0; i < cpt; i++)
		if (strcmp(TS[i].nom, nom) == 0) return i;
	return -1;
}

void insert(char nom[], char code[],int nbrl,int nbrc,int taille,int val, char type[]) {
	if (found(nom) != -1){
	   // printf("\n| %-14s |   Existe deja   | %10d | %10d | %10d | %10d | %10s |",yytext,nbrl,nbrc,0,0,"");
	   // printf("\n|----------------|-----------------|------------|------------|------------|------------|------------|");
		}
	 else {
		strcpy(TS[cpt].nom, nom);
		strcpy(TS[cpt].type, type);
		strcpy(TS[cpt].code, code);
		TS[cpt].nbrc= nbrc;
		TS[cpt].nbrl= nbrl;
		TS[cpt].taille= taille;
		TS[cpt].val=1000;
		cpt++;
	}
}



 void show() {
    printf("\n/**************************************Table des symboles*******************************************/\n");
	printf("\n|----------------|-----------------|------------|------------|------------|------------|------------|");
	printf("\n|   occurence    |       code      |    ligne   |  colonne   |   taille   |   valeur   |    type    |");
	printf("\n|----------------|-----------------|------------|------------|------------|------------|------------|");
	
	int i=0;
  while(i<cpt)
  {

    printf("\n| %-14s | %15s | %10d | %10d | %10d | %10d | %10s |",TS[i].nom,TS[i].code,TS[i].nbrl,TS[i].nbrc,TS[i].taille,TS[i].val,TS[i].type);
    printf("\n|----------------|-----------------|------------|------------|------------|------------|------------|");
    i++;
   }
}
//retourner la valeur d'une entité
 int retournerVal(char nom[])
     {
         int posEntite=found(nom);

           return TS[posEntite].val;
       }
int retournerTaille(char nom[])
     {
         int posEntite=found(nom);

           return TS[posEntite].taille;
       }
  char* retournerType(char nom[])
     {
         int posEntite=found(nom);

           return TS[posEntite].type;
       }
//insérer la valeur d'une entité dans la table de symbole
   void insereVal(char nom[], int val)
        {
            int posEntite=found(nom);
            if (posEntite!=-1) //si l’entité existe
             { 
                TS[posEntite].val=val;

             }
        }

	  

   void insereTaille(char nom[], int taille)
    {
      int posEntite=found(nom);
        if (posEntite!=-1) //si l’entité existe
        { 
           TS[posEntite].taille=taille;

        }
    }
	   void insereType(char nom[],char type[])
    {
      int posEntite=found(nom);
        if (posEntite!=-1) //si l’entité existe
        { 
           strcpy(TS[posEntite].type,type);

        }
    }
   int doubleDeclaration (char nom[])
   {
       int posEntite=found(nom);

          if (strcmp(TS[posEntite].type,"")==0) return 1;// donc elle est pas encore déclarée
           else return 0;            // le type de l'entité existe déjà dans la TS et donc c'est une double déclaration

    }
int yyerror(char *s) 
{
  printf("\n            Erreur Syntaxique !!!!   a la ligne: %d      |     colonne :%d  \n", nbrligne,nbrcolonne);
}



typedef struct qdr{

    char oper[100]; 
    char op1[100];   
    char op2[100];   
    char res[100];  
    
  }qdr;
  qdr quad[1000];





void quadr(char opr[],char op1[],char op2[],char res[])
{

	strcpy(quad[qc].oper,opr);
	strcpy(quad[qc].op1,op1);
	strcpy(quad[qc].op2,op2);
	strcpy(quad[qc].res,res);
	
	
qc++;

}

void ajour_quad(int num_quad, int colon_quad, char val [])
{
if (colon_quad==0) strcpy(quad[num_quad].oper,val);
else if (colon_quad==1) strcpy(quad[num_quad].op1,val);
         else if (colon_quad==2) strcpy(quad[num_quad].op2,val);
                   else if (colon_quad==3) strcpy(quad[num_quad].res,val);

}

void afficher_qdr()
{
printf("\n\n");
printf("\n*************************************Les Quadruplets***********************************\n");
printf("\n|--------------------------------------------------------------------------------------|");

int i;

for(i=0;i<qc;i++)
		{

 printf("\n %d - ( %s  ,  %s  ,  %s  ,  %s )",i,quad[i].oper,quad[i].op1,quad[i].op2,quad[i].res); 
 printf("\n---------------------------------------------------------------------------------------\n");
}
}


%}
IDF [a-zA-Z][a-zA-Z0-9_]*
Lettre  [A-Za-z]
Chiffre [1-9][0-9]*|0
Sep [_]
cst [1-9][0-9]*|0
CONST_ENT [+-]?{Chiffre}
CONST_REAL [+-]?{Chiffre}[.]{Chiffre}+
Taille [1-9][0-9]*
Symbole {.}*
Comment1 "//"
Comment2 "/*"
String ["][A-Za-z ]+["]
%x IN_COMMENT
%%


"/*"            {	BEGIN(IN_COMMENT);    	}

 <IN_COMMENT>{
				 "*/"      {BEGIN(INITIAL);}	// finish the comment
				 [^\n]+    					// eat comment
				 \n                         {nbrcolonne=1; nbrligne++;}
				 [^\n]+
				 \/       					// eat the lone /
}

{CONST_ENT}           {yylval.entier=atoi(yytext); entite++;return CONST_ENT;           }
{CONST_REAL}          {yylval.reel=atoi(yytext); entite++;return CONST_REAL;           }
":="                 {insert(yytext, "affectation" ,nbrligne,nbrcolonne,1,0,""); entite++;return AFF;             }
[\[\]();{}]          {insert(yytext, "separateur" ,nbrligne,nbrcolonne,1,0,""); entite++;return yytext[0];        }
"||"                   {insert(yytext, "separateur" ,nbrligne,nbrcolonne,1,0,""); entite++;return SEP;             }
[\n]                  {nbrligne++; nbrcolonne=1;                                                              }
[ ]+                  {nbrcolonne=nbrcolonne+yyleng;                                                          }
[\t]+                 {nbrcolonne=nbrcolonne+(yyleng*8);                                                      }
"<"                   {insert(yytext, "operateur" ,nbrligne,nbrcolonne,1,0,""); entite++;return OPREL;             }
">"                   {insert(yytext, "operateur" ,nbrligne,nbrcolonne,1,0,""); entite++;return OPREL;             }
"<="                  {insert(yytext, "operateur" ,nbrligne,nbrcolonne,1,0,""); entite++;return OPREL;             }
">="                  {insert(yytext, "operateur" ,nbrligne,nbrcolonne,1,0,""); entite++;return OPREL;             }
"!="                  {insert(yytext, "operateur" ,nbrligne,nbrcolonne,1,0,""); entite++;return OPREL;             }
"=="                  {insert(yytext, "operateur" ,nbrligne,nbrcolonne,1,0,""); entite++;return OPREL;             }
"+"                   {insert(yytext, "addition" ,nbrligne,nbrcolonne,1,0,""); entite++;return PLUS;               }
"-"                   {insert(yytext, "soustraction" ,nbrligne,nbrcolonne,1,0,""); entite++;return SUST;           }
"*"                   {insert(yytext, "multiplication" ,nbrligne,nbrcolonne,1,0,""); entite++;return MULT;         }
"/"                   {insert(yytext, "division" ,nbrligne,nbrcolonne,1,0,""); entite++;return DIV;                }

ALGORITHME            {insert(yytext, "Mot cle" ,nbrligne,nbrcolonne,1,0,""); entite++;return mc_Algo;            }
IF                    {insert(yytext, "Mot cle" ,nbrligne,nbrcolonne,1,0,""); entite++;return mc_If;               }
EXECUT                 {insert(yytext, "Mot cle" ,nbrligne,nbrcolonne,1,0,""); entite++;return mc_Execut;            }
While                  {insert(yytext, "Mot cle" ,nbrligne,nbrcolonne,1,0,""); entite++;return mc_while;             }

#TAB                    {yylval.str=strdup(yytext); insert(yytext, "Mot cle" ,nbrligne,nbrcolonne,1,0,""); entite++;return bibl_tab;}
#BOUCLE                 {yylval.str=strdup(yytext); insert(yytext, "Mot cle" ,nbrligne,nbrcolonne,1,0,""); entite++;return bibl_boucle;}
#Calcul                 {yylval.str=strdup(yytext); insert(yytext, "Mot cle" ,nbrligne,nbrcolonne,1,0,""); entite++;return bibl_calcul;}



DEBUT                 {insert(yytext, "Mot cle" ,nbrligne,nbrcolonne,1,0,""); entite++;return mc_Deb;              }
FIN                   {insert(yytext, "Mot cle" ,nbrligne,nbrcolonne,1,0,""); entite++;return mc_Fin;              }
SI                    {insert(yytext, "Mot cle" ,nbrligne,nbrcolonne,1,0,""); entite++;return mc_Si;               }
FAIRE                 {insert(yytext, "Mot cle" ,nbrligne,nbrcolonne,1,0,""); entite++;return mc_Faire;            }
FAIT                  {insert(yytext, "Mot cle" ,nbrligne,nbrcolonne,1,0,""); entite++;return mc_Fait;             }
POUR                  {insert(yytext, "Mot cle" ,nbrligne,nbrcolonne,1,0,""); entite++;return mc_Pour;             }
JUSQUE                {insert(yytext, "Mot cle" ,nbrligne,nbrcolonne,1,0,""); entite++;return mc_Jusque;           }
VAR                   {insert(yytext, "Mot cle" ,nbrligne,nbrcolonne,1,0,""); entite++;return mc_Var;              }
INT                   {yylval.str=strdup(yytext); insert(yytext, "Mot cle" ,nbrligne,nbrcolonne,1,0,""); entite++;return mc_INT;              }
REAL                  {yylval.str=strdup(yytext); insert(yytext, "Mot cle" ,nbrligne,nbrcolonne,1,0,""); entite++;return mc_REAL;             }
STRING                {yylval.str=strdup(yytext); insert(yytext, "Mot cle" ,nbrligne,nbrcolonne,1,0,""); entite++;return mc_STRING;           }
CHAR                  {yylval.str=strdup(yytext); insert(yytext, "Mot cle" ,nbrligne,nbrcolonne,1,0,""); entite++;return mc_CHAR;             }
{IDF} {if(yyleng<=12) {yylval.str=strdup(yytext);
                       insert(yytext, "Identificateur" ,nbrligne,nbrcolonne,0,1000,""); entite++; return IDF;}
	   else {printf("\n| %-14s | Erreur 'idf >12'| %10d | %10d | %10d |" ,yytext,nbrligne,nbrcolonne,0,0,"");
                     printf("\n|----------------|-----------------|------------|------------|------------|------------|------------|");}
	  };

. insert(yytext,"Erreur lexicale" ,nbrligne,nbrcolonne,1,0,"");
%%




/*
main ()
{
yylex();
show();
}
*/