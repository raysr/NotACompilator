/*
#ifndef NULL

   #ifdef __cplusplus

      #define NULL 0

   #else

      #define NULL ((void *)0)

   #endif

#endif
*/
typedef struct qdr{
    char oper[100];
    char op1[100];
    char op2[100];
    char res[100];
  }qdr;

typedef struct Element Element;
struct Element
{
    qdr quad;
    Element *suivant;
};
int t=0;
typedef struct Pile Pile;
struct Pile
{
    Element *premier;
};
	Pile pileQuads;


Pile *initialiser()
{
    Pile *pile = malloc(sizeof(*pile));
    pile->premier = NULL;
}

int taille=0;

void empiler(Pile *pile, qdr nvQdr)
{
        Element *nouveau = malloc(sizeof(*nouveau));
    if (pile == NULL || nouveau == NULL)
    {
        exit(0);
    }
    nouveau->quad = nvQdr;
    nouveau->suivant = pile->premier;
    pile->premier = nouveau;
}


qdr depiler(Pile *pile)
{
    if (pile == NULL)
    {
        exit(0);
    }
    qdr quadro;
    Element *elementDepile = pile->premier;
    if (pile != NULL && pile->premier != NULL)
    {
        quadro = elementDepile->quad;
        pile->premier = elementDepile->suivant;
        free(elementDepile);
    }
    return quadro;
}


int afficherQuad(qdr Q)
{
 printf(" ( %s  ,  %s  ,  %s  ,  %s )",Q.oper,Q.op1,Q.op2,Q.res);
 printf("\n--------------------------------------------------------\n");
 return 0;
}

void afficherQuadruplets(Pile *pile)
{
    if (pile == NULL)
    {
        exit(0);
    }
    Element *actuel = pile->premier;
    int i=0;
    printf("\n*********************Les Quadruplets***********************\n");

    while (actuel != NULL)
    {
        printf("%d - ",taille-i);
        afficherQuad(actuel->quad);
        actuel = actuel->suivant;
        i=i+1;
    }
    printf("\n");
}

void quadr(char opr[],char op1[],char op2[],char res[])
{
   qdr q;
	strcpy(q.oper,opr);
	strcpy(q.op1,op1);
	strcpy(q.op2,op2);
	strcpy(q.res,res);
    empiler(&pileQuads,q);
    taille=taille+1;
}

void epic_quadr(int num,char opr[],char op1[],char op2[],char res[])
{
    if(num==taille+1){quadr(opr,op1,op2,res);return;}
    
       qdr q1;
	strcpy(q1.oper,opr);
	strcpy(q1.op1,op1);
	strcpy(q1.op2,op2);
	strcpy(q1.res,res);


      int i=0;
  Pile *p;
  Element *e;
    qdr q;
      char t[20],t2[20];
  while(i!=(taille-num+1))
  {
    q=depiler(&pileQuads);
    
    strcpy(t,q1.op2);strcpy(q1.op2,q.op1);strcpy(q.op1,t);strcpy(t,q.res);strcpy(q.res,q1.res);strcpy(q1.res,t);
    empiler(&p,q);
    i=i+1;
  }

  
  /* if (colon_quad==1) strcpy(q.oper,val);
    else if (colon_quad==2) strcpy(q.op1,val);
    else if (colon_quad==3) strcpy(q.op2,val);
    else if (colon_quad==4) strcpy(q.res,val);
    */


    empiler(&pileQuads,q1);

    qdr tmp=q1;
    taille=taille+1;
    i=0;
    while(i!=(taille-num))
      {
    q=depiler(&p);
/*            strcpy(t,tmp.op2);
    strcpy(tmp.op2,q.op1);
        strcpy(q.op1,t);
        strcpy(t,tmp.res);
    strcpy(tmp.res,q.res);
        strcpy(tmp.res,t);*/
    empiler(&pileQuads,q);
    i++;
      }
}



void ajour_quad(int num_quad, int colon_quad, char val [])
{
  int i=0;
  Pile *p;
  Element *e;
    qdr q;
  while(i!=(taille-num_quad))
  {
    q=depiler(&pileQuads);
    empiler(&p,q);
    i=i+1;
  }
   q=depiler(&pileQuads);
    if (colon_quad==1) strcpy(q.oper,val);
    else if (colon_quad==2) strcpy(q.op1,val);
    else if (colon_quad==3) strcpy(q.op2,val);
    else if (colon_quad==4) strcpy(q.res,val);
    empiler(&p,q);
    i=0;
    while(i<(taille-num_quad+1))
      {
    q=depiler(&p);
    empiler(&pileQuads,q);
    i++;
      }
}