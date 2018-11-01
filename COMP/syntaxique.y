%{
    int nb_ligne=1;
%}


%union {
int entier;
float reel;
char* chaine;}
%token mc_programme mc_const mc_entier mc_reel const_entier const_reel mc_while mc_execut mc_if pvg virgule parenthese_gauche parenthese_droite crochet_gauche crochet_droit accolade_gauche accolade_droite op_affectation idf mc_bilbiotheque op_comp
%%
S:mc_programme | mc_const | mc_entier | mc_reel | const_entier | const_reel | mc_while | mc_execut | mc_if | pvg | virgule | parenthese_gauche | parenthese_droite | crochet_gauche | crochet_droit | accolade_gauche | accolade_droite | op_affectation | idf | mc_bilbiotheque | op_comp {printf("Programme correct. \n");}
;

%%
main()
{yyparse();}
    yywrap(){}
    int yyerror(char*msg)
    {printf("Erreur syntaxique ligne %d .\n",nb_ligne);}
