#ifndef MENU_H
#define MENU_H

// Structure représentant un fruit
typedef struct {
    char nom[50];
    float prix;
} Fruit;

// Structure représentant un article dans un achat
typedef struct {
    Fruit fruit;
    float quantite;
    float sous_total;
} ArticleAchat;
void afficher_menu();
#endif // MENU_H