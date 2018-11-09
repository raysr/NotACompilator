/*
#include<stdio.h>
#include<string.h>
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

typedef struct Pile Pile;

struct Pile

{

    Element *premier;

};



Pile pileQuads;

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



void afficherQuadruplets(Pile *pile)

{

    if (pile == NULL)

    {

        exit(0);

    }

    Element *actuel = pile->premier;

printf("*********************Les Quadruplets***********************\n");

    while (actuel != NULL)

    {

        afficherQuad(actuel->quad);

        actuel = actuel->suivant;

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

      while(p!=NULL)
      {
        q=depiler(&p);
          empiler(&pileQuads,q);


      }

}





int afficherQuad(qdr Q)

{

 printf("\n - ( %s  ,  %s  ,  %s  ,  %s )",Q.oper,Q.op1,Q.op2,Q.res);

 printf("\n--------------------------------------------------------\n");
 return 0;

}

/*
int main()
{
    qdr q;

    quadr("ANZ","A1","B1","A1");
    quadr("BNZ","A2","B2","A2");
    quadr("CNZ","A3","B3","A3");
    quadr("DNZ","A4","B4","A4");
    quadr("ENZ","A5","B5","A5");
    ajour_quad(2,2,"TEST");
    afficherQuadruplets(&pileQuads);

    return 0;
}

*/

