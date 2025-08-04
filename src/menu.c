#include <stdio.h>
#include <stdlib.h>
#include "menu.h"
 

void afficher_menu()
    {
        printf ("🍎 MENU DES FRUITS 🍎\n");
        printf ("1. Pommes       - 250f/kg\n");
        printf ("2. Bananes      - 180f/kg\n");
        printf ("3. Oranges      - 320f/kg\n");
        printf ("4. Fraises      - 450f/kg\n");
        printf ("5. Raisins      - 500f/kg\n");
        printf ("0. Terminer les achats\n");
    }
int main(){
    printf ("CAISSE AUTOMATIQUE - MAGASIN DE FRUITS\n");
    printf ("\n");
    afficher_menu();
    return 0;
}