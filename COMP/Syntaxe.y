%{
#include<string.h>
#include <stdio.h>
#include <stdlib.h>
FILE* yyin;
typedef int bool;
enum { false, true };

char sauvOper[20] ;
char sauvType[20];
bool sauvCond;
int sauvExp,sauvProd;
int i=0;
int j;
int nbrligne;
int nbrcolonne;
%}

%union {
int entier;
float reel;
char* str;
char car;
   } 
%token mc_Algo AFF mc_If mc_Execut  mc_while bibl_tab bibl_boucle bibl_calcul SEP mc_Deb mc_Fin mc_Si mc_Faire mc_Fait mc_Pour mc_Jusque mc_Var <str>mc_INT <str>mc_REAL <str>mc_STRING <str>mc_CHAR <str>IDF OPREL  PLUS SUST MULT DIV '(' ')' '{' '}' ',' ';' '[' ']'  '+' '-' <entier>CONST_ENT <reel>CONST_REAL 

%%

Programme:BIBL mc_Algo IDF '{' DEC INST_Plus '}' {printf("\n*****************************Programme syntaxiquement correct***************************\n");YYACCEPT;}
;
BIBL:                       bibl_tab BIBL
                           |bibl_boucle BIBL
                           |bibl_calcul BIBL
	                       |
;
IDF_Plus: IDF SEP IDF_Plus 
          |  

;
DEC_Simp:IDF   TYPE ';' 
           {  if ( doubleDeclaration($1)==1){insereType($1,sauvType);insereTaille($1,1);}
                          else {printf("\nErreur Sémantique: double declation de %s, a la ligne %d\n", $1, nbrligne);}}
      | IDF SEP IDF   TYPE ';'
	  {  if ( doubleDeclaration($1)==1){insereType($1,sauvType);insereTaille($1,1);}
                          else {printf("\nErreur Sémantique: double declation de %s, a la ligne %d\n", $1, nbrligne);}
		if ( doubleDeclaration($3)==1){insereType($3,sauvType);insereTaille($3,1);}
                          else {printf("\nErreur Sémantique: double declation de %s, a la ligne %d\n", $3, nbrligne);}}
	  | IDF SEP IDF SEP IDF   TYPE ';'
	  {  if ( doubleDeclaration($1)==1){insereType($1,sauvType);insereTaille($1,1);}
                          else {printf("\nErreur Sémantique: double declation de %s, a la ligne %d\n", $1, nbrligne);}
		if ( doubleDeclaration($3)==1){insereType($3,sauvType);insereTaille($3,1);}
                          else {printf("\nErreur Sémantique: double declation de %s, a la ligne %d\n", $3, nbrligne);}
		if ( doubleDeclaration($5)==1){insereType($5,sauvType);insereTaille($5,1);}
                          else {printf("\nErreur Sémantique: double declation de %s, a la ligne %d\n", $5, nbrligne);}}
	  |IDF SEP IDF SEP IDF SEP IDF   TYPE ';'
	  	  {  if ( doubleDeclaration($1)==1){insereType($1,sauvType);insereTaille($1,1);}
                          else {printf("\nErreur Sémantique: double declation de %s, a la ligne %d\n", $1, nbrligne);}
		if ( doubleDeclaration($3)==1){insereType($3,sauvType);insereTaille($3,1);}
                          else {printf("\nErreur Sémantique: double declation de %s, a la ligne %d\n", $3, nbrligne);}
		if ( doubleDeclaration($5)==1){insereType($5,sauvType);insereTaille($5,1);}
                          else {printf("\nErreur Sémantique: double declation de %s, a la ligne %d\n", $5, nbrligne);}
		if ( doubleDeclaration($7)==1){insereType($7,sauvType);insereTaille($7,1);}
                          else {printf("\nErreur Sémantique: double declation de %s, a la ligne %d\n", $7, nbrligne);}}
	  
	  
;
DEC_Tab:
       IDF '[' CONST_ENT ']'   TYPE ';'
	  {
			     if($3 <=0){printf("\nErreur Semantique: taille de %s est negative ou nulle , a la ligne %d\n", $1, nbrligne);}
				 else{ insereTaille($1,$3);}
			    if ( doubleDeclaration($1)==1){insereType($1,sauvType);
                         } else {printf("\nErreur Semantique: double declation de %s, a la ligne %d\n", $1, nbrligne);}
						 }
	  | IDF '[' CONST_ENT ']' SEP IDF '[' CONST_ENT ']'   TYPE ';'
	   {
			     if($3 <=0){printf("\nErreur Semantique: taille de %s est negative ou nulle , a la ligne %d\n", $1, nbrligne);}
				 else{ insereTaille($1,$3);}
			    if ( doubleDeclaration($1)==1){insereType($1,sauvType);
                         } else {printf("\nErreur Semantique: double declation de %s, a la ligne %d\n", $1, nbrligne);}
						 
			    if($8 <=0){printf("\nErreur Semantique: taille de %s est negative ou nulle , a la ligne %d\n", $6, nbrligne);}
				 else{ insereTaille($6,$8);}
			    if ( doubleDeclaration($6)==1){insereType($6,sauvType);
                         } else {printf("\nErreur Semantique: double declation de %s, a la ligne %d\n", $6, nbrligne);}
						 }
	  |IDF '[' CONST_ENT ']' SEP IDF '[' CONST_ENT ']' SEP IDF '[' CONST_ENT ']'   TYPE ';'
	  	   {
			     if($3 <=0){printf("\nErreur Semantique: taille de %s est negative ou nulle , a la ligne %d\n", $1, nbrligne);}
				 else{ insereTaille($1,$3);}
			    if ( doubleDeclaration($1)==1){insereType($1,sauvType);
                         } else {printf("\nErreur Semantique: double declation de %s, a la ligne %d\n", $1, nbrligne);}
						 
			    if($8 <=0){printf("\nErreur Semantique: taille de %s est negative ou nulle , a la ligne %d\n", $6, nbrligne);}
				 else{ insereTaille($6,$8);}
			    if ( doubleDeclaration($6)==1){insereType($6,sauvType);
                         } else {printf("\nErreur Semantique: double declation de %s, a la ligne %d\n", $6, nbrligne);}
				if($13 <=0){printf("\nErreur Semantique: taille de %s est negative ou nulle , a la ligne %d\n", $6, nbrligne);}
				 else{ insereTaille($11,$13);}
			    if ( doubleDeclaration($11)==1){insereType($11,sauvType);
                         } else {printf("\nErreur Semantique: double declation de %s, a la ligne %d\n", $11, nbrligne);}
						 }
	  |IDF '[' CONST_ENT ']' SEP IDF '[' CONST_ENT ']' SEP IDF '[' CONST_ENT ']' SEP IDF '[' CONST_ENT ']'   TYPE ';'
	  	  	   {
			     if($3 <=0){printf("\nErreur Semantique: taille de %s est negative ou nulle , a la ligne %d\n", $1, nbrligne);}
				 else{ insereTaille($1,$3);}
			    if ( doubleDeclaration($1)==1){insereType($1,sauvType);
                         } else {printf("\nErreur Semantique: double declation de %s, a la ligne %d\n", $1, nbrligne);}
						 
			    if($8 <=0){printf("\nErreur Semantique: taille de %s est negative ou nulle , a la ligne %d\n", $6, nbrligne);}
				 else{ insereTaille($6,$8);}
			    if ( doubleDeclaration($6)==1){insereType($6,sauvType);
                         } else {printf("\nErreur Semantique: double declation de %s, a la ligne %d\n", $6, nbrligne);}
				if($13 <=0){printf("\nErreur Semantique: taille de %s est negative ou nulle , a la ligne %d\n", $11, nbrligne);}
				 else{ insereTaille($11,$13);}
			    if ( doubleDeclaration($11)==1){insereType($11,sauvType);
                         } else {printf("\nErreur Semantique: double declation de %s, a la ligne %d\n", $11, nbrligne);}
			    if($18 <=0){printf("\nErreur Semantique: taille de %s est negative ou nulle , a la ligne %d\n", $16, nbrligne);}
				 else{ insereTaille($16,$18);}
			    if ( doubleDeclaration($16)==1){insereType($16,sauvType);
                         } else {printf("\nErreur Semantique: double declation de %s, a la ligne %d\n", $16, nbrligne);}
						 }
;
IDF_Plus_Tab:IDF '[' CONST_ENT ']' SEP IDF_Plus_Tab 
          | 
;
DEC: DEC_Simp DEC
     | DEC_Tab DEC
	 |
;
INST_Boucle: mc_while '(' COND ')' 
             '{' 
             INST_Plus 
             '}'
;
INST_Cond: mc_Execut
           INST_Plus 
		   mc_If '(' COND ')' 
		   
;
COND: IDF OPREL IDF   
      | IDF OPREL CONST_ENT 
	  | IDF OPREL CONST_REAL 
;
INST: INST_Aff 
     | INST_Cond
	 | INST_Boucle 
;
INST_Plus: INST INST_Plus 
          |INST
;
INST_Aff:
		 |IDF AFF CONST_ENT ';'
		 {
		
		 if(doubleDeclaration($1)==1){printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{insereVal($1,$3);}
		 if(strcmp(retournerType($1),"INT")!=0){printf("\nErreur semantique: Incompatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{insereVal($1,$3);}
		 }
		 |IDF AFF CONST_REAL ';'
		 {
		
		 if(doubleDeclaration($1)==1){printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{insereVal($1,$3);}
		 if(strcmp(retournerType($1),"REAL")!=0){printf("\nErreur semantique: Incompatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{insereVal($1,$3);}
		 }
		 | IDF '[' CONST_ENT ']' AFF CONST_ENT ';'
		 {
		
		 if(doubleDeclaration($1)==1){printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}
		 if($3>retournerTaille($1)){printf("\nErreur semantique: depasement %d, colonne %d\n",nbrligne,nbrcolonne);}
		 if(strcmp(retournerType($1),"INT")!=0){printf("\nErreur semantique: Incompatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
		 }
		 | IDF '[' IDF ']' AFF CONST_ENT ';'
		 {
		
		 if(doubleDeclaration($1)==1){printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		 if(retournerVal($3)>retournerTaille($1)){printf("\nErreur semantique: depasement %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		 if(strcmp(retournerType($1),"INT")!=0){printf("\nErreur semantique: Incompatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}}}
		 }
		| IDF '[' IDF ']' AFF CONST_REAL ';'
		 {
		
		 if(doubleDeclaration($1)==1){printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}
		 if(retournerVal($3)>retournerTaille($1)){printf("\nErreur semantique: depasement %d, colonne %d\n",nbrligne,nbrcolonne);}
		 if(strcmp(retournerType($1),"REAL")!=0){printf("\nErreur semantique: Incompatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
		 }
		 
		 |IDF AFF IDF PLUS IDF ';'
		 {
		     if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,retournerVal($3)+retournerVal($5));
				  }
		      }
		    }
		 }
		 |IDF AFF IDF SUST IDF ';'
		 {
		     if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,retournerVal($3)-retournerVal($5));
				  }
		      }
		    }
		 }
		 |IDF AFF IDF MULT IDF ';'
		 {
		     if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,retournerVal($3)*retournerVal($5));
				  }
		      }
		    }
		 }
		|IDF AFF IDF DIV IDF ';'
		 {
		     if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				    if(retournerVal($5)==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				        insereVal($1,retournerVal($3)/retournerVal($5));
						}
				  }
		      }
		    }
		 }
		 |IDF AFF IDF PLUS CONST_ENT ';'
		 {
		     if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($3),"INT")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,retournerVal($3)+$5);
				  }
		      }
		    }
		 }
		 |IDF AFF IDF SUST CONST_ENT ';'
		 {
		     if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($3),"INT")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,retournerVal($3)-$5);
				  }
		      }
		    }
		 }
		 |IDF AFF IDF MULT CONST_ENT ';'
		 {
		     if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($3),"INT")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,retournerVal($3)*$5);
				  }
		      }
		    }
		 }
		|IDF AFF IDF DIV CONST_ENT ';'
		 {
		     if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($3),"INT")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				    if($5==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				        insereVal($1,retournerVal($3)/$5);
						}
				  }
		      }
		    }
		 }
		 |IDF AFF IDF PLUS CONST_REAL ';'
		 {
		     if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($3),"REAL")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,retournerVal($3)+$5);
				  }
		      }
		    }
		 }
		 |IDF AFF IDF SUST CONST_REAL ';'
		 {
		     if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($3),"REAL")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,retournerVal($3)-$5);
				  }
		      }
		    }
		 }
		 |IDF AFF IDF MULT CONST_REAL ';'
		 {
		     if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($3),"REAL")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,retournerVal($3)*$5);
				  }
		      }
		    }
		 }
		|IDF AFF IDF DIV CONST_REAL ';'
		 {
		     if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($3),"REAL")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				    if($5==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				        insereVal($1,retournerVal($3)/$5);
						}
				  }
		      }
		    }
		 }
		 |IDF AFF CONST_ENT PLUS CONST_ENT ';'
		 {
		     if(doubleDeclaration($1)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),"INT")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
			    insereVal($1,$3+$5);
				  
		      }
		    }
		 }
		 |IDF AFF CONST_ENT SUST CONST_ENT ';'
		 {
		     if(doubleDeclaration($1)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),"INT")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
			    insereVal($1,$3-$5);
				  
		      }
		    }
		 }
		 |IDF AFF CONST_ENT MULT CONST_ENT ';'
		 {
		     if(doubleDeclaration($1)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),"INT")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
			    insereVal($1,$3*$5);
				  
		      }
		    }
		 }
		|IDF AFF CONST_ENT DIV CONST_ENT ';'
		 {
		     if(doubleDeclaration($1)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),"INT")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{ 
				    if($5==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				        insereVal($1,$3/$5);
						}
				  
		      }
		    }
		 }
		 |IDF AFF CONST_ENT PLUS CONST_REAL ';'
		 {
		     printf("\nErreur semantique: Imcopatibilite de type %d, colonne %d\n",nbrligne,nbrcolonne);
		 }
		 |IDF AFF CONST_ENT SUST CONST_REAL ';'
		 {
		     printf("\nErreur semantique: Imcopatibilite de type %d, colonne %d\n",nbrligne,nbrcolonne);
		 }
		 |IDF AFF CONST_ENT MULT CONST_REAL ';'
		 {
		     printf("\nErreur semantique: Imcopatibilite de type %d, colonne %d\n",nbrligne,nbrcolonne);
		 }
		|IDF AFF CONST_ENT DIV CONST_REAL ';'
		 {
		    printf("\nErreur semantique: Imcopatibilite de type %d, colonne %d\n",nbrligne,nbrcolonne);
		 }
		 |IDF AFF CONST_REAL PLUS CONST_ENT ';'
		 {
		     printf("\nErreur semantique: Imcopatibilite de type %d, colonne %d\n",nbrligne,nbrcolonne);
		 }
		 |IDF AFF CONST_REAL SUST CONST_ENT ';'
		 {
		     printf("\nErreur semantique: Imcopatibilite de type %d, colonne %d\n",nbrligne,nbrcolonne);
		 }
		 |IDF AFF CONST_REAL MULT CONST_ENT ';'
		 {
		     printf("\nErreur semantique: Imcopatibilite de type %d, colonne %d\n",nbrligne,nbrcolonne);
		 }
		|IDF AFF CONST_REAL DIV CONST_ENT ';'
		 {
		    printf("\nErreur semantique: Imcopatibilite de type %d, colonne %d\n",nbrligne,nbrcolonne);
		 }
		 |IDF AFF CONST_REAL PLUS CONST_REAL ';'
		 {
		     if(doubleDeclaration($1)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),"REAL")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
			    insereVal($1,$3+$5);
				  
		      }
		    }
		 }
		 |IDF AFF CONST_REAL SUST CONST_REAL ';'
		 {
		     if(doubleDeclaration($1)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),"REAL")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
			    insereVal($1,$3-$5);
				  
		      }
		    }
		 }
		 |IDF AFF CONST_REAL MULT CONST_REAL ';'
		 {
		     if(doubleDeclaration($1)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),"REAL")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
			    insereVal($1,$3*$5);
				  
		      }
		    }
		 }
		|IDF AFF CONST_REAL DIV CONST_REAL ';'
		 {
		     if(doubleDeclaration($1)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),"REAL")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{ 
				    if($5==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				        insereVal($1,$3/$5);
						}
		      }
		    }
		 }
		 		 |IDF AFF CONST_ENT PLUS IDF ';'
		 {
		     if(doubleDeclaration($1)==1 || doubleDeclaration($5)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($5))!=0 || strcmp(retournerType($5),"INT")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($5)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,retournerVal($5)+$3);
				  }
		      }
		    }
		 }
		 |IDF AFF CONST_ENT SUST IDF ';'
		 {
		     if(doubleDeclaration($1)==1 || doubleDeclaration($5)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($5))!=0 || strcmp(retournerType($5),"INT")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($5)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,retournerVal($5)*$3);
				  }
		      }
		    }
		 }
		 |IDF AFF CONST_ENT MULT IDF ';'
		 {
		     if(doubleDeclaration($1)==1 || doubleDeclaration($5)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($5))!=0 || strcmp(retournerType($5),"INT")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($5)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,retournerVal($5)*$3);
				  }
		      }
		    }
		 }
		|IDF AFF CONST_ENT DIV IDF ';'
		 {
		     if(doubleDeclaration($1)==1 || doubleDeclaration($5)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($5))!=0 || strcmp(retournerType($5),"INT")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($5)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				    if(retournerVal($5)==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				        insereVal($1,$3/retournerVal($5));
						}
				  }
		      }
		    }
		 }
		 |IDF AFF CONST_REAL PLUS IDF ';'
		 {
		     if(doubleDeclaration($1)==1 || doubleDeclaration($5)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($5))!=0 || strcmp(retournerType($5),"REAL")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($5)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,retournerVal($5)+$3);
				  }
		      }
		    }
		 }
		 |IDF AFF CONST_REAL SUST IDF ';'
		 {
		     if(doubleDeclaration($1)==1 || doubleDeclaration($5)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($5))!=0 || strcmp(retournerType($5),"REAL")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($5)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,retournerVal($5)*$3);
				  }
		      }
		    }
		 }
		 |IDF AFF CONST_REAL MULT IDF ';'
		 {
		     if(doubleDeclaration($1)==1 || doubleDeclaration($5)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($5))!=0 || strcmp(retournerType($5),"REAL")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($5)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,retournerVal($5)*$3);
				  }
		      }
		    }
		 }
		|IDF AFF CONST_REAL DIV IDF ';'
		 {
		     if(doubleDeclaration($1)==1 || doubleDeclaration($5)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($5))!=0 || strcmp(retournerType($5),"REAL")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($5)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				    if(retournerVal($5)==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				        insereVal($1,$3/retournerVal($5));
						}
				  }
		      }
		    }
		 }
 |IDF '[' CONST_ENT ']' AFF IDF PLUS IDF ';'
		 {
		     if($3>retournerTaille($1)){printf("\nErreur semantique: depasement %d, colonne %d\n",nbrligne,nbrcolonne);}
		     if(doubleDeclaration($1)==1 || doubleDeclaration($6)==1 || doubleDeclaration($8)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($6))!=0 || strcmp(retournerType($8),retournerType($6))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($6)==1000 || retournerVal($8)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }
		      }
		    }
		 }
		 |IDF '[' CONST_ENT ']' AFF IDF SUST IDF ';'
		 {
		    if($3>retournerTaille($1)){printf("\nErreur semantique: depasement %d, colonne %d\n",nbrligne,nbrcolonne);}
		     if(doubleDeclaration($1)==1 || doubleDeclaration($6)==1 || doubleDeclaration($8)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($6))!=0 || strcmp(retournerType($8),retournerType($6))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($6)==1000 || retournerVal($8)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }
		      }
		    }
		 }
		 |IDF '[' CONST_ENT ']' AFF IDF MULT IDF ';'
		 {
		 if($3>retournerTaille($1)){printf("\nErreur semantique: depasement %d, colonne %d\n",nbrligne,nbrcolonne);}
		     if(doubleDeclaration($1)==1 || doubleDeclaration($6)==1 || doubleDeclaration($8)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($6))!=0 || strcmp(retournerType($8),retournerType($6))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($6)==1000 || retournerVal($8)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }
		      }
		    }
		 }
		|IDF '[' CONST_ENT ']' AFF IDF DIV IDF ';'
		 {
		 if($3>retournerTaille($1)){printf("\nErreur semantique: depasement %d, colonne %d\n",nbrligne,nbrcolonne);}
		     if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($6))!=0 || strcmp(retournerType($8),retournerType($6))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($6)==1000 || retournerVal($8)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				    if(retournerVal($8)==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					
				  }
		      }
		    }
		 }
		 |IDF '[' CONST_ENT ']' AFF IDF PLUS CONST_ENT ';'
		 {
		 if($3>retournerTaille($1)){printf("\nErreur semantique: depasement %d, colonne %d\n",nbrligne,nbrcolonne);}
		     if(doubleDeclaration($1)==1 || doubleDeclaration($6)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($6))!=0 || strcmp(retournerType($6),"INT")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($6)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }
		      }
		    }
		 }
		 |IDF '[' CONST_ENT ']' AFF IDF SUST CONST_ENT ';'
		 {
		   if($3>retournerTaille($1)){printf("\nErreur semantique: depasement %d, colonne %d\n",nbrligne,nbrcolonne);}
		     if(doubleDeclaration($1)==1 || doubleDeclaration($6)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($6))!=0 || strcmp(retournerType($6),"INT")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($6)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }
		      }
		    }
		 }
		 |IDF '[' CONST_ENT ']' AFF IDF MULT CONST_ENT ';'
		 {
		 if($3>retournerTaille($1)){printf("\nErreur semantique: depasement %d, colonne %d\n",nbrligne,nbrcolonne);}
		     if(doubleDeclaration($1)==1 || doubleDeclaration($6)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($6))!=0 || strcmp(retournerType($6),"INT")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($6)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }
		      }
		    }
		 }
		|IDF '[' CONST_ENT ']' AFF IDF DIV CONST_ENT ';'
		 {
		 if($3>retournerTaille($1)){printf("\nErreur semantique: depasement %d, colonne %d\n",nbrligne,nbrcolonne);}
		     if(doubleDeclaration($1)==1 || doubleDeclaration($6)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($6))!=0 || strcmp(retournerType($6),"INT")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($6)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				    if($8==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					
				  }
		      }
		    }
		 }
		 |IDF '[' CONST_ENT ']' AFF IDF PLUS CONST_REAL ';'
		 {
		 if($3>retournerTaille($1)){printf("\nErreur semantique: depasement %d, colonne %d\n",nbrligne,nbrcolonne);}
		     if(doubleDeclaration($1)==1 || doubleDeclaration($6)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($6))!=0 || strcmp(retournerType($6),"REAL")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($6)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }
		      }
		    }
		 }
		 |IDF '[' CONST_ENT ']' AFF IDF SUST CONST_REAL ';'
		 {
		 if($3>retournerTaille($1)){printf("\nErreur semantique: depasement %d, colonne %d\n",nbrligne,nbrcolonne);}
		     if(doubleDeclaration($1)==1 || doubleDeclaration($6)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($6))!=0 || strcmp(retournerType($6),"REAL")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($6)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }
		      }
		    }
		 }
		 |IDF '[' CONST_ENT ']' AFF IDF MULT CONST_REAL ';'
		 {
		 if($3>retournerTaille($1)){printf("\nErreur semantique: depasement %d, colonne %d\n",nbrligne,nbrcolonne);}
		     if(doubleDeclaration($1)==1 || doubleDeclaration($6)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($6))!=0 || strcmp(retournerType($6),"REAL")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($6)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }
		      }
		    }
		 }
		|IDF '[' CONST_ENT ']' AFF IDF DIV CONST_REAL ';'
		 {
		 if($3>retournerTaille($1)){printf("\nErreur semantique: depasement %d, colonne %d\n",nbrligne,nbrcolonne);}
		     if(doubleDeclaration($1)==1 || doubleDeclaration($6)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($6))!=0 || strcmp(retournerType($6),"REAL")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($6)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				    if($8==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					
				  }
		      }
		    }
		 }
		 |IDF '[' CONST_ENT ']' AFF CONST_ENT PLUS CONST_ENT ';'
		 {
		 if($3>retournerTaille($1)){printf("\nErreur semantique: depasement %d, colonne %d\n",nbrligne,nbrcolonne);}
		     if(doubleDeclaration($1)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),"INT")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
		    }
		 }
		 |IDF '[' CONST_ENT ']' AFF CONST_ENT SUST CONST_ENT ';'
		 {
		 if($3>retournerTaille($1)){printf("\nErreur semantique: depasement %d, colonne %d\n",nbrligne,nbrcolonne);}
		     if(doubleDeclaration($1)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),"INT")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
		    }
		 }
		 |IDF '[' CONST_ENT ']' AFF CONST_ENT MULT CONST_ENT ';'
		 {
		 if($3>retournerTaille($1)){printf("\nErreur semantique: depasement %d, colonne %d\n",nbrligne,nbrcolonne);}
		     if(doubleDeclaration($1)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),"INT")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
		    }
		 }
		|IDF '[' CONST_ENT ']' AFF CONST_ENT DIV CONST_ENT ';'
		 {
		 if($3>retournerTaille($1)){printf("\nErreur semantique: depasement %d, colonne %d\n",nbrligne,nbrcolonne);}
		     if(doubleDeclaration($1)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),"INT")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
			  if($8==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
			
		    }
		 }
		 |IDF '[' CONST_ENT ']' AFF CONST_ENT PLUS CONST_REAL ';'
		 {
		 		 if($3>retournerTaille($1)){printf("\nErreur semantique: depasement %d, colonne %d\n",nbrligne,nbrcolonne);}
		     printf("\nErreur semantique: Imcopatibilite de type %d, colonne %d\n",nbrligne,nbrcolonne);
		 }
		 {
		 		 if($3>retournerTaille($1)){printf("\nErreur semantique: depasement %d, colonne %d\n",nbrligne,nbrcolonne);}
		     printf("\nErreur semantique: Imcopatibilite de type %d, colonne %d\n",nbrligne,nbrcolonne);
		 }
		 |IDF '[' CONST_ENT ']' AFF CONST_ENT MULT CONST_REAL ';'
		 {
		 		 if($3>retournerTaille($1)){printf("\nErreur semantique: depasement %d, colonne %d\n",nbrligne,nbrcolonne);}
		     printf("\nErreur semantique: Imcopatibilite de type %d, colonne %d\n",nbrligne,nbrcolonne);
		 }
		|IDF '[' CONST_ENT ']' AFF CONST_ENT DIV CONST_REAL ';'
		 {
		 		 if($3>retournerTaille($1)){printf("\nErreur semantique: depasement %d, colonne %d\n",nbrligne,nbrcolonne);}
		     printf("\nErreur semantique: Imcopatibilite de type %d, colonne %d\n",nbrligne,nbrcolonne);
		 }
		 |IDF '[' CONST_ENT ']' AFF CONST_REAL PLUS CONST_ENT ';'
		 {
		 		 if($3>retournerTaille($1)){printf("\nErreur semantique: depasement %d, colonne %d\n",nbrligne,nbrcolonne);}
		     printf("\nErreur semantique: Imcopatibilite de type %d, colonne %d\n",nbrligne,nbrcolonne);
		 }
		 |IDF '[' CONST_ENT ']' AFF CONST_REAL SUST CONST_ENT ';'
		 {
		 		 if($3>retournerTaille($1)){printf("\nErreur semantique: depasement %d, colonne %d\n",nbrligne,nbrcolonne);}
		     printf("\nErreur semantique: Imcopatibilite de type %d, colonne %d\n",nbrligne,nbrcolonne);
		 }
		 |IDF '[' CONST_ENT ']' AFF CONST_REAL MULT CONST_ENT ';'
		 {
		 		 if($3>retournerTaille($1)){printf("\nErreur semantique: depasement %d, colonne %d\n",nbrligne,nbrcolonne);}
		     printf("\nErreur semantique: Imcopatibilite de type %d, colonne %d\n",nbrligne,nbrcolonne);
		 }
		|IDF '[' CONST_ENT ']' AFF CONST_REAL DIV CONST_ENT ';'
		 {
		 		 if($3>retournerTaille($1)){printf("\nErreur semantique: depasement %d, colonne %d\n",nbrligne,nbrcolonne);}
		     printf("\nErreur semantique: Imcopatibilite de type %d, colonne %d\n",nbrligne,nbrcolonne);
		 }
		 |IDF '[' CONST_ENT ']' AFF CONST_REAL PLUS CONST_REAL ';'
		 {
		 if($3>retournerTaille($1)){printf("\nErreur semantique: depasement %d, colonne %d\n",nbrligne,nbrcolonne);}
		     if(doubleDeclaration($1)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),"REAL")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
		    }
		 }
		 |IDF '[' CONST_ENT ']' AFF CONST_REAL SUST CONST_REAL ';'
		 {
		 if($3>retournerTaille($1)){printf("\nErreur semantique: depasement %d, colonne %d\n",nbrligne,nbrcolonne);}
		     if(doubleDeclaration($1)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),"REAL")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
		    }
		 }
		 |IDF '[' CONST_ENT ']' AFF CONST_REAL MULT CONST_REAL ';'
		 {
		 if($3>retournerTaille($1)){printf("\nErreur semantique: depasement %d, colonne %d\n",nbrligne,nbrcolonne);}
		     if(doubleDeclaration($1)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),"REAL")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
		    }
		 }
		|IDF '[' CONST_ENT ']' AFF CONST_REAL DIV CONST_REAL ';'
		 {
		  if($3>retournerTaille($1)){printf("\nErreur semantique: depasement %d, colonne %d\n",nbrligne,nbrcolonne);}
		     if(doubleDeclaration($1)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),"REAL")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{ 
				    if($8==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					
		      }
		    }
		 }
		 |IDF '[' CONST_ENT ']' AFF CONST_ENT PLUS IDF ';'
		 {
		 if($3>retournerTaille($1)){printf("\nErreur semantique: depasement %d, colonne %d\n",nbrligne,nbrcolonne);}
		     if(doubleDeclaration($1)==1 || doubleDeclaration($8)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($8))!=0 || strcmp(retournerType($8),"INT")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($8)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }
		      }
		    }
		 }
		 |IDF '[' CONST_ENT ']' AFF CONST_ENT SUST IDF ';'
		 {
		 if($3>retournerTaille($1)){printf("\nErreur semantique: depasement %d, colonne %d\n",nbrligne,nbrcolonne);}
		     if(doubleDeclaration($1)==1 || doubleDeclaration($8)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($8))!=0 || strcmp(retournerType($8),"INT")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($8)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }
		      }
		    }
		 }
		 |IDF '[' CONST_ENT ']' AFF CONST_ENT MULT IDF ';'
		 {
		 if($3>retournerTaille($1)){printf("\nErreur semantique: depasement %d, colonne %d\n",nbrligne,nbrcolonne);}
		     if(doubleDeclaration($1)==1 || doubleDeclaration($8)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($8))!=0 || strcmp(retournerType($8),"INT")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($8)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }
		      }
		    }
		 }
		|IDF '[' CONST_ENT ']' AFF CONST_ENT DIV IDF ';'
		 {
		 if($3>retournerTaille($1)){printf("\nErreur semantique: depasement %d, colonne %d\n",nbrligne,nbrcolonne);}
		     if(doubleDeclaration($1)==1 || doubleDeclaration($8)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($8))!=0 || strcmp(retournerType($8),"INT")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($8)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				    if(retournerVal($8)==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					
				  }
		      }
		    }
		 }
		 |IDF '[' CONST_ENT ']' AFF CONST_REAL PLUS IDF ';'
		 {
		 if($3>retournerTaille($1)){printf("\nErreur semantique: depasement %d, colonne %d\n",nbrligne,nbrcolonne);}
		     if(doubleDeclaration($1)==1 || doubleDeclaration($8)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($8))!=0 || strcmp(retournerType($8),"REAL")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($8)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }
		      }
		    }
		 }
		 |IDF '[' CONST_ENT ']' AFF CONST_REAL SUST IDF ';'
		 {
		 if($3>retournerTaille($1)){printf("\nErreur semantique: depasement %d, colonne %d\n",nbrligne,nbrcolonne);}
		     if(doubleDeclaration($1)==1 || doubleDeclaration($8)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($8))!=0 || strcmp(retournerType($8),"REAL")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($8)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }
		      }
		    }
		 }
		 |IDF '[' CONST_ENT ']' AFF CONST_REAL MULT IDF ';'
		 {
		 if($3>retournerTaille($1)){printf("\nErreur semantique: depasement %d, colonne %d\n",nbrligne,nbrcolonne);}
		     if(doubleDeclaration($1)==1 || doubleDeclaration($8)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($8))!=0 || strcmp(retournerType($8),"REAL")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($8)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }
		      }
		    }
		 }
		|IDF '[' CONST_ENT ']' AFF CONST_REAL DIV IDF ';'
		 {
		 if($3>retournerTaille($1)){printf("\nErreur semantique: depasement %d, colonne %d\n",nbrligne,nbrcolonne);}
		     if(doubleDeclaration($1)==1 || doubleDeclaration($8)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($8))!=0 || strcmp(retournerType($8),"REAL")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($8)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				    if(retournerVal($8)==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					
				  }
		      }
		    }
		 }
		 | IDF AFF IDF PLUS IDF PLUS IDF ';'
		 {
		
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 || doubleDeclaration($7)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp(retournerType($7),retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000 || retournerVal($7)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,(retournerVal($3)+retournerVal($5)+retournerVal($7)));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF PLUS IDF SUST IDF ';'
		 {
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 || doubleDeclaration($7)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp(retournerType($7),retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000  || retournerVal($7)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,(retournerVal($3)+retournerVal($5)-retournerVal($7)));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF PLUS IDF MULT IDF ';'
		 {
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 || doubleDeclaration($7)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp(retournerType($7),retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000  || retournerVal($7)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,((retournerVal($3)+retournerVal($5))*retournerVal($7)));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF PLUS IDF DIV IDF ';'
		 {
		     if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 || doubleDeclaration($7)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp(retournerType($7),retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000 || retournerVal($7)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				    if(retournerVal($7)==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				        insereVal($1,((retournerVal($3)+retournerVal($5))/retournerVal($7)));
						}
				  }
		      }
		    }
		 }
		 | IDF AFF IDF SUST IDF PLUS IDF ';'
		 {
		
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 || doubleDeclaration($7)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp(retournerType($7),retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000 || retournerVal($7)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,(retournerVal($3)-retournerVal($5)+retournerVal($7)));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF SUST IDF SUST IDF ';'
		 {
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 || doubleDeclaration($7)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp(retournerType($7),retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000  || retournerVal($7)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,(retournerVal($3)-retournerVal($5)-retournerVal($7)));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF SUST IDF MULT IDF ';'
		 {
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 || doubleDeclaration($7)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp(retournerType($7),retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000  || retournerVal($7)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,((retournerVal($3)-retournerVal($5))*retournerVal($7)));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF SUST IDF DIV IDF ';'
		 {
		     if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 || doubleDeclaration($7)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp(retournerType($7),retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000 || retournerVal($7)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				    if(retournerVal($7)==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				        insereVal($1,((retournerVal($3)-retournerVal($5))/retournerVal($7)));
						}
				  }
		      }
		    }
		 }
		 | IDF AFF IDF MULT IDF PLUS IDF ';'
		 {
		
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 || doubleDeclaration($7)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp(retournerType($7),retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000 || retournerVal($7)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,(retournerVal($3)*(retournerVal($5)+retournerVal($7))));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF MULT IDF SUST IDF ';'
		 {
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 || doubleDeclaration($7)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp(retournerType($7),retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000  || retournerVal($7)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,(retournerVal($3)*(retournerVal($5)-retournerVal($7))));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF MULT IDF MULT IDF ';'
		 {
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 || doubleDeclaration($7)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp(retournerType($7),retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000  || retournerVal($7)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,((retournerVal($3)*retournerVal($5))*retournerVal($7)));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF MULT IDF DIV IDF ';'
		 {
		     if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 || doubleDeclaration($7)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp(retournerType($7),retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000 || retournerVal($7)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				    if(retournerVal($7)==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				        insereVal($1,((retournerVal($3)*retournerVal($5))/retournerVal($7)));
						}
				  }
		      }
		    }
		 }
		 | IDF AFF IDF DIV IDF PLUS IDF ';'
		 {
		
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 || doubleDeclaration($7)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp(retournerType($7),retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000 || retournerVal($7)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  if((retournerVal($5)+retournerVal($7))==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				  insereVal($1,(retournerVal($3)/(retournerVal($5)+retournerVal($7))));
				  }}
		      }
		    }
		 }
		 | IDF AFF IDF DIV IDF SUST IDF ';'
		 {
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 || doubleDeclaration($7)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp(retournerType($7),retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000  || retournerVal($7)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  if((retournerVal($5)-retournerVal($7))==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				  insereVal($1,(retournerVal($3)/(retournerVal($5)-retournerVal($7))));
				  }}
		      }
		    }
		 }
		 | IDF AFF IDF DIV IDF MULT IDF ';'
		 {
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 || doubleDeclaration($7)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp(retournerType($7),retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000  || retournerVal($7)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  if(retournerVal($5)==0 ){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				  insereVal($1,((retournerVal($3)/retournerVal($5))*retournerVal($7)));
				  }}
		      }
		    }
		 }
		 | IDF AFF IDF DIV IDF DIV IDF ';'
		 {
		     if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 || doubleDeclaration($7)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp(retournerType($7),retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000 || retournerVal($7)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				    if(retournerVal($7)==0 || retournerVal($5)==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				        insereVal($1,((retournerVal($3)/retournerVal($5))/retournerVal($7)));
						}
				  }
		      }
		    }
		 }
		 | IDF AFF IDF PLUS IDF PLUS CONST_ENT ';'
		 {
		
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp(retournerType($3),"INT")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000 ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,(retournerVal($3)+retournerVal($5)+$7));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF PLUS IDF SUST CONST_ENT ';'
		 {
		
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp(retournerType($3),"INT")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000 ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,(retournerVal($3)+retournerVal($5)-$7));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF PLUS IDF MULT CONST_ENT ';'
		 {
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp("INT",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000  ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,((retournerVal($3)+retournerVal($5))*$7));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF PLUS IDF DIV CONST_ENT ';'
		 {
		     if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp("INT",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				    if($7==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				        insereVal($1,((retournerVal($3)+retournerVal($5))/$7));
						}
				  }
		      }
		    }
		 }
		 | IDF AFF IDF SUST IDF PLUS CONST_ENT ';'
		 {
		
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp("INT",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000 ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,(retournerVal($3)-retournerVal($5)+$7));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF SUST IDF SUST CONST_ENT ';'
		 {
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp("INT",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000 ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,(retournerVal($3)-retournerVal($5)-$7));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF SUST IDF MULT CONST_ENT ';'
		 {
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp("INT",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000 ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,((retournerVal($3)-retournerVal($5))*$7));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF SUST IDF DIV CONST_ENT ';'
		 {
		     if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp("INT",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				    if($7==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				        insereVal($1,((retournerVal($3)-retournerVal($5))/$7));
						}
				  }
		      }
		    }
		 }
		 | IDF AFF IDF MULT IDF PLUS CONST_ENT ';'
		 {
		
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp("INT",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000 ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,(retournerVal($3)*(retournerVal($5)+$7)));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF MULT IDF SUST CONST_ENT ';'
		 {
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp("INT",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000  ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,(retournerVal($3)*(retournerVal($5)-$7)));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF MULT IDF MULT CONST_ENT ';'
		 {
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp("INT",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000  ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,((retournerVal($3)*retournerVal($5))*$7));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF MULT IDF DIV CONST_ENT ';'
		 {
		     if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp("INT",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000 ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				    if($7==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				        insereVal($1,((retournerVal($3)*retournerVal($5))/$7));
						}
				  }
		      }
		    }
		 }
		 | IDF AFF IDF DIV IDF PLUS CONST_ENT ';'
		 {
		
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp("INT",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000 ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  if((retournerVal($5)+$7)==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				  insereVal($1,(retournerVal($3)/(retournerVal($5)+$7)));
				  }}
		      }
		    }
		 }
		 | IDF AFF IDF DIV IDF SUST CONST_ENT ';'
		 {
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp("INT",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000 ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  if((retournerVal($5)-$7)==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				  insereVal($1,(retournerVal($3)/(retournerVal($5)-$7)));
				  }}
		      }
		    }
		 }
		 | IDF AFF IDF DIV IDF MULT CONST_ENT ';'
		 {
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp("INT",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000 ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  if(retournerVal($5)==0 ){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				  insereVal($1,((retournerVal($3)/retournerVal($5))*$7));
				  }}
		      }
		    }
		 }
		 | IDF AFF IDF DIV IDF DIV CONST_ENT';'
		 {
		     if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp("INT",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000 ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				    if($7==0 || retournerVal($5)==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				        insereVal($1,((retournerVal($3)/retournerVal($5))/$7));
						}
				  }
		      }
		    }
		 }
		 | IDF AFF IDF PLUS IDF PLUS CONST_REAL ';'
		 {
		
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp(retournerType($3),"REAL")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000 ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,(retournerVal($3)+retournerVal($5)+$7));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF PLUS IDF SUST CONST_REAL ';'
		 {
		
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp(retournerType($3),"REAL")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000 ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,(retournerVal($3)+retournerVal($5)-$7));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF PLUS IDF MULT CONST_REAL ';'
		 {
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp("REAL",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000  ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,((retournerVal($3)+retournerVal($5))*$7));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF PLUS IDF DIV CONST_REAL ';'
		 {
		     if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp("REAL",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				    if($7==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				        insereVal($1,((retournerVal($3)+retournerVal($5))/$7));
						}
				  }
		      }
		    }
		 }
		 | IDF AFF IDF SUST IDF PLUS CONST_REAL ';'
		 {
		
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp("REAL",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000 ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,(retournerVal($3)-retournerVal($5)+$7));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF SUST IDF SUST CONST_REAL ';'
		 {
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp("REAL",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000 ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,(retournerVal($3)-retournerVal($5)-$7));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF SUST IDF MULT CONST_REAL ';'
		 {
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp("REAL",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000 ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,((retournerVal($3)-retournerVal($5))*$7));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF SUST IDF DIV CONST_REAL ';'
		 {
		     if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp("REAL",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				    if($7==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				        insereVal($1,((retournerVal($3)-retournerVal($5))/$7));
						}
				  }
		      }
		    }
		 }
		 | IDF AFF IDF MULT IDF PLUS CONST_REAL ';'
		 {
		
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp("REAL",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000 ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,(retournerVal($3)*(retournerVal($5)+$7)));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF MULT IDF SUST CONST_REAL ';'
		 {
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp("REAL",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000  ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,(retournerVal($3)*(retournerVal($5)-$7)));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF MULT IDF MULT CONST_REAL ';'
		 {
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp("REAL",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000  ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,((retournerVal($3)*retournerVal($5))*$7));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF MULT IDF DIV CONST_REAL ';'
		 {
		     if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp("REAL",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000 ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				    if($7==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				        insereVal($1,((retournerVal($3)*retournerVal($5))/$7));
						}
				  }
		      }
		    }
		 }
		 | IDF AFF IDF DIV IDF PLUS CONST_REAL ';'
		 {
		
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp("REAL",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000 ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  if((retournerVal($5)+$7)==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				  insereVal($1,(retournerVal($3)/(retournerVal($5)+$7)));
				  }}
		      }
		    }
		 }
		 | IDF AFF IDF DIV IDF SUST CONST_REAL ';'
		 {
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp("REAL",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000 ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  if((retournerVal($5)-$7)==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				  insereVal($1,(retournerVal($3)/(retournerVal($5)-$7)));
				  }}
		      }
		    }
		 }
		 | IDF AFF IDF DIV IDF MULT CONST_REAL ';'
		 {
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp("REAL",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000 ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  if(retournerVal($5)==0 ){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				  insereVal($1,((retournerVal($3)/retournerVal($5))*$7));
				  }}
		      }
		    }
		 }
		 | IDF AFF IDF DIV IDF DIV CONST_REAL';'
		 {
		     if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 || doubleDeclaration($5)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($5),retournerType($3))!=0 || strcmp("REAL",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 || retournerVal($5)==1000 ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				    if($7==0 || retournerVal($5)==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				        insereVal($1,((retournerVal($3)/retournerVal($5))/$7));
						}
				  }
		      }
		    }
		 }
		 | IDF AFF IDF PLUS CONST_REAL PLUS CONST_REAL ';'
		 {
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($3),"REAL")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  
				  insereVal($1,(retournerVal($3)+$5+$7));
				  }
		      }
		    }
		 }
        | IDF AFF IDF PLUS CONST_REAL SUST CONST_REAL ';'
		 {
		
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($3),"REAL")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000  ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,(retournerVal($3)+$5-$7));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF PLUS CONST_REAL MULT CONST_REAL ';'
		 {
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp("REAL",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000  ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,((retournerVal($3)+$5)*$7));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF PLUS CONST_REAL DIV CONST_REAL ';'
		 {
		     if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp("REAL",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				    if($7==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				        insereVal($1,((retournerVal($3)+$5)/$7));
						}
				  }
		      }
		    }
		 }
		 | IDF AFF IDF SUST CONST_REAL PLUS CONST_REAL ';'
		 {
		
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1  ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 ||  strcmp("REAL",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,(retournerVal($3)-$5+$7));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF SUST CONST_REAL SUST CONST_REAL ';'
		 {
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp("REAL",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000  ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,(retournerVal($3)-$5-$7));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF SUST CONST_REAL MULT CONST_REAL ';'
		 {
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp("REAL",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000  ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,((retournerVal($3)-$5)*$7));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF SUST CONST_REAL DIV CONST_REAL ';'
		 {
		     if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1  ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0  || strcmp("REAL",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				    if($7==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				        insereVal($1,((retournerVal($3)-$5)/$7));
						}
				  }
		      }
		    }
		 }
		 | IDF AFF IDF MULT CONST_REAL PLUS CONST_REAL ';'
		 {
		
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1  ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0  || strcmp("REAL",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,(retournerVal($3)*($5+$7)));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF MULT CONST_REAL SUST CONST_REAL ';'
		 {
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1  ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0  || strcmp("REAL",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000   ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,(retournerVal($3)*($5-$7)));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF MULT CONST_REAL MULT CONST_REAL ';'
		 {
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0  || strcmp("REAL",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000   ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,((retournerVal($3)*$5)*$7));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF MULT CONST_REAL DIV CONST_REAL ';'
		 {
		     if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1  ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp("REAL",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000  ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				    if($7==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				        insereVal($1,((retournerVal($3)*$5)/$7));
						}
				  }
		      }
		    }
		 }
		 | IDF AFF IDF DIV CONST_REAL PLUS CONST_REAL ';'
		 {
		
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp("REAL",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000  ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  if(($5+$7)==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				  insereVal($1,(retournerVal($3)/($5+$7)));
				  }}
		      }
		    }
		 }
		 | IDF AFF IDF DIV CONST_REAL SUST CONST_REAL ';'
		 {
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0  || strcmp("REAL",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000  ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  if(($5-$7)==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				  insereVal($1,(retournerVal($3)/($5-$7)));
				  }}
		      }
		    }
		 }
		 | IDF AFF IDF DIV CONST_REAL MULT CONST_REAL ';'
		 {
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1  ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp("REAL",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000  ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  if($5==0 ){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				  insereVal($1,((retournerVal($3)/$5)*$7));
				  }}
		      }
		    }
		 }
		 | IDF AFF IDF DIV CONST_REAL DIV CONST_REAL';'
		 {
		     if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 ||  strcmp("REAL",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000  ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				    if($7==0 || $5==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				        insereVal($1,((retournerVal($3)/$5)/$7));
						}
				  }
		      }
		    }
		 }
 | IDF AFF IDF PLUS CONST_ENT PLUS CONST_ENT ';' 
		 {
		 
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($3),"INT")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  
				  insereVal($1,(retournerVal($3)+$5+$7));
				  }
		      }
		    }
		 }
        | IDF AFF IDF PLUS CONST_ENT SUST CONST_ENT ';'
		 {
		
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp(retournerType($3),"INT")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000  ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,(retournerVal($3)+$5-$7));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF PLUS CONST_ENT MULT CONST_ENT ';'
		 {
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp("INT",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000  ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,((retournerVal($3)+$5)*$7));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF PLUS CONST_ENT DIV CONST_ENT ';'
		 {
		     if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp("INT",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				    if($7==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				        insereVal($1,((retournerVal($3)+$5)/$7));
						}
				  }
		      }
		    }
		 }
		 | IDF AFF IDF SUST CONST_ENT PLUS CONST_ENT ';'
		 {
		
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1  ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 ||  strcmp("INT",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,(retournerVal($3)-$5+$7));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF SUST CONST_ENT SUST CONST_ENT ';'
		 {
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp("INT",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000  ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,(retournerVal($3)-$5-$7));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF SUST CONST_ENT MULT CONST_ENT ';'
		 {
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp("INT",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000  ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,((retournerVal($3)-$5)*$7));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF SUST CONST_ENT DIV CONST_ENT ';'
		 {
		     if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1  ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0  || strcmp("INT",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				    if($7==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				        insereVal($1,((retournerVal($3)-$5)/$7));
						}
				  }
		      }
		    }
		 }
		 | IDF AFF IDF MULT CONST_ENT PLUS CONST_ENT ';'
		 {
		
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1  ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0  || strcmp("INT",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000 ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,(retournerVal($3)*($5+$7)));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF MULT CONST_ENT SUST CONST_ENT ';'
		 {
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1  ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0  || strcmp("INT",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000   ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,(retournerVal($3)*($5-$7)));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF MULT CONST_ENT MULT CONST_ENT ';'
		 {
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0  || strcmp("INT",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000   ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  insereVal($1,((retournerVal($3)*$5)*$7));
				  }
		      }
		    }
		 }
		 | IDF AFF IDF MULT CONST_ENT DIV CONST_ENT ';'
		 {
		     if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1  ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp("INT",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000  ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				    if($7==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				        insereVal($1,((retournerVal($3)*$5)/$7));
						}
				  }
		      }
		    }
		 }
		 | IDF AFF IDF DIV CONST_ENT PLUS CONST_ENT ';'
		 {
		
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp("INT",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000  ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  if(($5+$7)==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				  insereVal($1,(retournerVal($3)/($5+$7)));
				  }}
		      }
		    }
		 }
		 | IDF AFF IDF DIV CONST_ENT SUST CONST_ENT ';'
		 {
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0  || strcmp("INT",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000  ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  if(($5-$7)==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				  insereVal($1,(retournerVal($3)/($5-$7)));
				  }}
		      }
		    }
		 }
		 | IDF AFF IDF DIV CONST_ENT MULT CONST_ENT ';'
		 {
		 	if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1  ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 || strcmp("INT",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000  ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				  if($5==0 ){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				  insereVal($1,((retournerVal($3)/$5)*$7));
				  }}
		      }
		    }
		 }
		 | IDF AFF IDF DIV CONST_ENT DIV CONST_ENT';'
		 {
		     if(doubleDeclaration($1)==1 || doubleDeclaration($3)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),retournerType($3))!=0 ||  strcmp("INT",retournerType($3))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          if(retournerVal($3)==1000  ){
				  printf("\nErreur semantique:variable non initialisee a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);
				  }else{
				    if($7==0 || $5==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				        insereVal($1,((retournerVal($3)/$5)/$7));
						}
				  }
		      }
		    }
		 }
		 | IDF AFF CONST_ENT PLUS CONST_ENT PLUS CONST_ENT ';'
		 {
		 	if(doubleDeclaration($1)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),"INT")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{

				  insereVal($1,($3+$5+$7));
				  
		      }
		    }
		 }
        | IDF AFF CONST_ENT PLUS CONST_ENT SUST CONST_ENT ';'
		 {
		 	if(doubleDeclaration($1)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),"INT")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{

				  insereVal($1,($3+$5-$7));
				  
		      }
		    }
		 }
		 | IDF AFF CONST_ENT PLUS CONST_ENT MULT CONST_ENT ';'
		 {
		 	if(doubleDeclaration($1)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),"INT")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{

				  insereVal($1,(($3+$5)*$7));
				  
		      }
		    }
		 }
		 | IDF AFF CONST_ENT SUST CONST_ENT PLUS CONST_ENT ';'
		 {
		
		 	if(doubleDeclaration($1)==1  ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp("INT",retournerType($1))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          
				  insereVal($1,($3-$5+$7));
				  
		      }
		    }
		 }
		 | IDF AFF CONST_ENT SUST CONST_ENT SUST CONST_ENT ';'
		 {
		 	if(doubleDeclaration($1)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp("INT",retournerType($1))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          
				  insereVal($1,($3-$5-$7));
				  
		      }
		    }
		 }
		 | IDF AFF CONST_ENT SUST CONST_ENT MULT CONST_ENT ';'
		 {
		 	if(doubleDeclaration($1)==1  ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if( strcmp("INT",retournerType($1))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          
				  insereVal($1,(($3-$5)*$7));
				  
		      }
		    }
		 }
		 | IDF AFF CONST_ENT SUST CONST_ENT DIV CONST_ENT ';'
		 {
		     if(doubleDeclaration($1)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp("INT",retournerType($1))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          
				    if($7==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				        insereVal($1,(($3-$5)/$7));
						}
				  
		      }
		    }
		 }
		 | IDF AFF CONST_ENT MULT CONST_ENT PLUS CONST_ENT ';'
		 {
		
		 	if(doubleDeclaration($1)==1  ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp("INT",retournerType($1))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          
				  insereVal($1,($3*($5+$7)));
				  
		      }
		    }
		 }
		 | IDF AFF CONST_ENT MULT CONST_ENT SUST CONST_ENT ';'
		 {
		 	if(doubleDeclaration($1)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp("INT",retournerType($1))!=0 )
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		         
				  insereVal($1,($3*($5-$7)));
				  
		      }
		    }
		 }
		 | IDF AFF CONST_ENT MULT CONST_ENT MULT CONST_ENT ';'
		 {
		 	if(doubleDeclaration($1)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if( strcmp("INT",retournerType($1))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          
				  insereVal($1,(($3*$5)*$7));
				  
		      }
		    }
		 }
		 | IDF AFF CONST_ENT MULT CONST_ENT DIV CONST_ENT ';'
		 {
		     if(doubleDeclaration($1)==1   ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp("INT",retournerType($1))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          
				    if($7==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				        insereVal($1,(($3*$5)/$7));
						}
				  
		      }
		    }
		 }
		 | IDF AFF CONST_ENT DIV CONST_ENT PLUS CONST_ENT ';'
		 {
		
		 	if(doubleDeclaration($1)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp("INT",retournerType($1))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          
				  if(($5+$7)==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				  insereVal($1,($3/($5+$7)));
				  }
		      }
		    }
		 }
		 | IDF AFF CONST_ENT DIV CONST_ENT SUST CONST_ENT ';'
		 {
		 	if(doubleDeclaration($1)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp("INT",retournerType($1))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          
				  if(($5-$7)==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				  insereVal($1,($3/($5-$7)));
				  }
		      }
		    }
		 }
		 | IDF AFF CONST_ENT DIV CONST_ENT MULT CONST_ENT ';'
		 {
		 	if(doubleDeclaration($1)==1  ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp("INT",retournerType($1))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          
				  if($5==0 ){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				  insereVal($1,($3/$5)*$7);
				  }
		      }
		    }
		 }
		 | IDF AFF CONST_ENT DIV CONST_ENT DIV CONST_ENT';'
		 {
		     if(doubleDeclaration($1)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if( strcmp("INT",retournerType($1))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          
				    if(($7==0) || ($5==0)){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				        insereVal($1,(($3/$5)/$7));
						}
				  
		      }
		    }
		 }
		 | IDF AFF CONST_REAL PLUS CONST_REAL PLUS CONST_REAL ';'
		 {
		 	if(doubleDeclaration($1)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),"REAL")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{

				  insereVal($1,($3+$5+$7));
				  
		      }
		    }
		 }
        | IDF AFF CONST_REAL PLUS CONST_REAL SUST CONST_REAL ';'
		 {
		 	if(doubleDeclaration($1)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),"REAL")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{

				  insereVal($1,($3+$5-$7));
				  
		      }
		    }
		 }
		 | IDF AFF CONST_REAL PLUS CONST_REAL MULT CONST_REAL ';'
		 {
		 	if(doubleDeclaration($1)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp(retournerType($1),"REAL")!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{

				  insereVal($1,(($3+$5)*$7));
				  
		      }
		    }
		 }
		 | IDF AFF CONST_REAL SUST CONST_REAL PLUS CONST_REAL ';'
		 {
		
		 	if(doubleDeclaration($1)==1  ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp("REAL",retournerType($1))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          
				  insereVal($1,($3-$5+$7));
				  
		      }
		    }
		 }
		 | IDF AFF CONST_REAL SUST CONST_REAL SUST CONST_REAL ';'
		 {
		 	if(doubleDeclaration($1)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp("REAL",retournerType($1))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          
				  insereVal($1,($3-$5-$7));
				  
		      }
		    }
		 }
		 | IDF AFF CONST_REAL SUST CONST_REAL MULT CONST_REAL ';'
		 {
		 	if(doubleDeclaration($1)==1  ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if( strcmp("REAL",retournerType($1))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          
				  insereVal($1,(($3-$5)*$7));
				  
		      }
		    }
		 }
		 | IDF AFF CONST_REAL SUST CONST_REAL DIV CONST_REAL ';'
		 {
		     if(doubleDeclaration($1)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp("REAL",retournerType($1))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          
				    if($7==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				        insereVal($1,(($3-$5)/$7));
						}
				  
		      }
		    }
		 }
		 | IDF AFF CONST_REAL MULT CONST_REAL PLUS CONST_REAL ';'
		 {
		
		 	if(doubleDeclaration($1)==1  ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp("REAL",retournerType($1))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          
				  insereVal($1,($3*($5+$7)));
				  
		      }
		    }
		 }
		 | IDF AFF CONST_REAL MULT CONST_REAL SUST CONST_REAL ';'
		 {
		 	if(doubleDeclaration($1)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp("REAL",retournerType($1))!=0 )
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		         
				  insereVal($1,($3*($5-$7)));
				  
		      }
		    }
		 }
		 | IDF AFF CONST_REAL MULT CONST_REAL MULT CONST_REAL ';'
		 {
		 	if(doubleDeclaration($1)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if( strcmp("REAL",retournerType($1))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          
				  insereVal($1,(($3*$5)*$7));
				  
		      }
		    }
		 }
		 | IDF AFF CONST_REAL MULT CONST_REAL DIV CONST_REAL ';'
		 {
		     if(doubleDeclaration($1)==1   ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp("REAL",retournerType($1))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          
				    if($7==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				        insereVal($1,(($3*$5)/$7));
						}
				  
		      }
		    }
		 }
		 | IDF AFF CONST_REAL DIV CONST_REAL PLUS CONST_REAL ';'
		 {
		
		 	if(doubleDeclaration($1)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp("REAL",retournerType($1))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          
				  if(($5+$7)==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				  insereVal($1,($3/($5+$7)));
				  }
		      }
		    }
		 }
		 | IDF AFF CONST_REAL DIV CONST_REAL SUST CONST_REAL ';'
		 {
		 	if(doubleDeclaration($1)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp("REAL",retournerType($1))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          
				  if(($5-$7)==0){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				  insereVal($1,($3/($5-$7)));
				  }
		      }
		    }
		 }
		 | IDF AFF CONST_REAL DIV CONST_REAL MULT CONST_REAL ';'
		 {
		 	if(doubleDeclaration($1)==1  ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if(strcmp("INT",retournerType($1))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          
				  if($5==0 ){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				  insereVal($1,($3/$5)*$7);
				  }
		      }
		    }
		 }
		 | IDF AFF CONST_REAL DIV CONST_REAL DIV CONST_REAL';'
		 {
		     if(doubleDeclaration($1)==1 ){
		     printf("\nErreur semantique: Variable non declaree %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		      if( strcmp("INT",retournerType($1))!=0)
		      {printf("\nErreur semantique: Imcopatibilite de type a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}else{
		          
				    if(($7==0) || ($5==0)){printf("\nErreur semantique: Division par zero a la ligne %d, colonne %d\n",nbrligne,nbrcolonne);}
					else{
				        insereVal($1,(($3/$5)/$7));
						}
				  
		      }
		    }
		 }

;
expres: CONST_ENT PLUS prod 
        | CONST_ENT SUST prod
		| prod
;
prod: CONST_ENT MULT expres 
     | CONST_ENT DIV expres
	 | expres
;
operateur:PLUS {strcpy(sauvOper,$1);}
         |SUST {strcpy(sauvOper,$1);}
         |MULT {strcpy(sauvOper,$1);}
         |DIV  {strcpy(sauvOper,$1);}
;		 
TYPE:mc_INT     {strcpy(sauvType,$1);}  
    |mc_REAL    {strcpy(sauvType,$1);}   
;

%%


main()
{
 yyin = fopen("entree.txt", "r");
 yyparse();
 show();
  afficher_qdr();
}

yywrap()
{}





