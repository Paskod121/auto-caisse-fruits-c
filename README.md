# 🍎 Caisse Automatique - Magasin de Fruits

## Description du Projet

Bienvenue dans votre premier projet collaboratif en langage C ! Vous allez créer une **caisse automatique** pour un magasin de fruits. Ce projet vous permettra de mettre en pratique les bases du langage C tout en apprenant à collaborer avec Git et GitHub.

L'application sera une **interface console** où l'utilisateur pourra :
- Choisir des fruits dans un menu
- Indiquer les quantités désirées
- Payer ses achats
- Recevoir un reçu détaillé

##  Objectifs Pédagogiques

- Maîtriser les **fonctions** en C
- Utiliser des **structures** simples
- Manipuler les **fichiers** (bonus)
- Pratiquer **Git** et **GitHub** en équipe
- Développer un projet complet de A à Z

##  Fonctionnalités à Implémenter

### Fonctionnalités de Base
- ✅ Affichage d'un menu avec 4-5 fruits et leurs prix
- ✅ Sélection de produits avec quantités
- ✅ Calcul automatique du total
- ✅ Gestion du paiement et du rendu de monnaie
- ✅ Affichage d'un reçu détaillé
- ✅ Gestion des erreurs (montant insuffisant, saisie incorrecte)

### Fonctionnalités Bonus (si le temps le permet)
-  Sauvegarde des achats dans un fichier
-  Statistiques des ventes
-  Interface plus jolie avec des couleurs

##  Structure du Projet

```
caisse-automatique/
├── src/
│   ├── main.c          # Programme principal
│   ├── menu.c          # Gestion de l'affichage des produits
│   ├── menu.h          # En-têtes pour menu.c
│   ├── caisse.c        # Logique des achats et paiements
│   ├── caisse.h        # En-têtes pour caisse.c
│   ├── utils.c         # Fonctions utilitaires
│   └── utils.h         # En-têtes pour utils.c
├── data/
│   └── recu.txt        # Fichier de sortie (bonus)
├── Makefile            # Pour compiler facilement
└── README.md           # Ce fichier
```

##  Compilation et Exécution

### Compilation manuelle
```bash
gcc -o caisse src/main.c src/menu.c src/caisse.c src/utils.c
```

### Avec Makefile (bonus)
```bash
make
```

### Exécution
```bash
./caisse
```

##  Exemple d'Utilisation

``` 
    CAISSE AUTOMATIQUE - MAGASIN DE FRUITS

    🍎 MENU DES FRUITS 🍎
    1. Pommes       - 250f/kg
    2. Bananes      - 180f/kg
    3. Oranges      - 320f/kg
    4. Fraises      - 450f/kg
    5. Raisins      - 500f/kg
    0. Terminer les achats

Votre choix (0-5) : 1
Quantité de Pommes (kg) : 2

Produit ajouté : 2.00 kg de Pommes = 500f

Votre choix (0-5) : 3
Quantité d'Oranges (kg) : 1.5

Produit ajouté : 1.50 kg d'Oranges = 480f

Votre choix (0-5) : 0

=== RÉCAPITULATIF ===
Pommes    : 2.00 kg × 250f = 500f
Oranges   : 1.50 kg × 320f = 480f
                    TOTAL : 980f

Montant versé : 1000f
Rendu de monnaie : 20f

Merci pour votre achat ! 🛒
```

##  Planning de Développement (3 jours)

### Jour 1 - Mise en place et Menu
- [ ] Création du dépôt GitHub
- [ ] Clone du projet par tous les membres
- [ ] Création de la structure de fichiers
- [ ] Implémentation de l'affichage du menu
- [ ] Premier commit et push

**Objectifs du jour** : Avoir un menu qui s'affiche correctement

### Jour 2 - Logique Métier
- [ ] Implémentation de la sélection de produits
- [ ] Calcul des totaux
- [ ] Gestion du paiement
- [ ] Tests des fonctionnalités

**Objectifs du jour** : Application fonctionnelle pour un achat simple

### Jour 3 - Finition et Tests
- [ ] Affichage du reçu détaillé
- [ ] Gestion des erreurs
- [ ] Tests complets
- [ ] Documentation du code
- [ ] Pull Request finale

**Objectifs du jour** : Projet prêt à être présenté

## Concepts C à Utiliser

### Structures Recommandées
```c
typedef struct {
    char nom[50];
    float prix;
} Fruit;

typedef struct {
    Fruit fruit;
    float quantite;
    float sous_total;
} ArticleAchat;
```

### Fonctions Importantes
- `afficher_menu()` : Affiche la liste des fruits
- `ajouter_article()` : Ajoute un article au panier
- `calculer_total()` : Calcule le prix total
- `traiter_paiement()` : Gère le paiement et le rendu
- `generer_recu()` : Affiche ou sauvegarde le reçu

## Guide Git pour Débutants

### Configuration Initiale (à faire une fois)
```bash
# Configuration de votre identité
git config --global user.name "Votre Nom"
git config --global user.email "votre.email@example.com"
```

### Workflow de Base

#### 1. Cloner le Projet
```bash
git clone https://github.com/Paskod121/auto-caisse-fruits-c.git
cd auto-caisse-fruits-c
```

#### 2. Créer une Branche pour votre Fonctionnalité
```bash
# Créer et basculer sur une nouvelle branche
git checkout -b feature/nomDeLaBranch-fonctionnalite

# Exemples :
git checkout -b feature/affichage-menu
git checkout -b feature/calcul-total
```

#### 3. Développer et Commiter
```bash
# Voir les fichiers modifiés
git status

# Ajouter vos modifications
git add .
# ou ajouter un fichier spécifique
git add src/menu.c

# Créer un commit avec un message clair
git commit -m "Ajout de l'affichage du menu des fruits"
```

#### 4. Synchroniser avec l'Équipe
```bash
# Récupérer les dernières modifications
git pull origin main

# Envoyer vos modifications
git push origin feature/nomDeVotrebranche
```

#### 5. Créer une Pull Request
1. Allez sur GitHub
2. Cliquez sur "New Pull Request"
3. Sélectionnez votre branche
4. Ajoutez une description claire
5. Demandez une review à votre équipe

### Messages de Commit Recommandés
- `feat: ajout de l'affichage du menu`
- `fix: correction du calcul de la monnaie`
- `docs: mise à jour du README`
- `refactor: amélioration de la fonction de paiement`

##  Tests à Effectuer

### Tests Fonctionnels
- [ ] Le menu s'affiche correctement
- [ ] Les calculs sont justes
- [ ] La gestion des erreurs fonctionne
- [ ] Le reçu est complet et lisible

### Tests Utilisateur
- [ ] Interface intuitive
- [ ] Messages d'erreur clairs
- [ ] Navigation fluide

### Tests Techniques
- [ ] Compilation sans erreurs ni warnings
- [ ] Pas de fuites mémoire
- [ ] Code propre et commenté

## Critères d'Évaluation

| Critère | Points | Description |
|---------|--------|-------------|
| **Fonctionnalités** | /8 | Toutes les fonctionnalités de base implémentées |
| **Code Qualité** | /4 | Code propre, commenté, bien structuré |
| **Git/GitHub** | /4 | Utilisation correcte des branches, commits, PR |
| **Collaboration** | /2 | Travail d'équipe efficace |
| **Documentation** | /2 | README complet, code documenté |

## Conseils pour Réussir

###  Collaboration
- **Communiquez** régulièrement avec votre équipe
- **Répartissez** les tâches équitablement
- **Testez** le code des autres avant de merger
- **Documentez** vos fonctions

###  Programmation
- Commencez par les fonctionnalités de base
- Testez chaque fonction individuellement
- Gérez les cas d'erreur (saisies incorrectes)
- Utilisez des noms de variables explicites

###  Git
- Faites des commits **petits et fréquents**
- Écrivez des messages de commit **descriptifs**
- Testez votre code avant de commiter
- **Ne jamais commiter** directement sur `main` P A R D O N 🚶‍♀️

##  Besoin d'Aide ?

### Ressources Utiles
- [Documentation C](https://en.cppreference.com/w/c)
- [Git Cheat Sheet](https://education.github.com/git-cheat-sheet-education.pdf)
- [Guide Markdown](https://guides.github.com/features/mastering-markdown/)

### Questions Fréquentes
**Q: Comment résoudre un conflit Git ?**
R: Éditez le fichier en conflit, supprimez les marqueurs `<<<<<<<`, `=======`, `>>>>>>>`, puis `git add` et `git commit`.

**Q: Mon programme ne compile pas, que faire ?**
R: Vérifiez les erreurs affichées par le compilateur, assurez-vous que tous les fichiers `.h` sont inclus.

**Q: Comment bien répartir le travail ?**
R: Une personne par fichier/fonctionnalité peut être un bon début, mais n'hésitez pas à vous entraider !

---

**Bonne chance pour votre projet ! **

N'oubliez pas : l'important n'est pas d'avoir un code parfait, mais d'apprendre en pratiquant et en collaborant. Faites de votre mieux et n'hésitez pas à expérimenter !