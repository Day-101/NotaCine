# NotaCine

Site web qui aide en un coup d'œil , ses utilisateurs à mieux choisir de manière visuelle et intuitive des films à regarder.


# 1. Présentation


## Fini de *scroller* à l'infini sur Netflix !

**NotaCine** souhaite _révolutionner_ le système obsolète de notation à nombre d'étoiles ou de note sur 10 sans aucune mise en contexte. Ce projet veut offrir à ses utilisateurs une **notation de films à échelle relative** à l’aide de quelques curseurs **visuels et intuitifs**. Un guide rapide, simple et sans *spoiler* qui simplifie la prise de décision.

Les utilisateurs les plus passionnés pourront également publier leurs propres notations à échelle relative et consulter celles des autres.

## 2. Parcours utilisateur

Un utilisateur peut consulter les notations de films suggérés par la rédaction de NotaCine en **page d'accueil** et en consulter d'autres via les **catégories** ou plus directement grâce à la **barre de recherche**.

Chaque film possède sa page dédiée affichant sa catégorie et sous-catégorie de genre ainsi que ses fameuses 6 petites barres avec **curseurs indicatifs** basés sur 6 critères généraux (Scénario, Image, Montage, Direction d'acteur, Son, Maquillage-Coiffure).

Il peut également **partager** ses propres notations sur son **profil**, consulter les **moyennes générales** des autres utilisateurs et tenir une **check-list** de films déjà vu ou à regarder prochainement.

## 3. Concrètement et techniquement

### 3.1. Base de données

Elle est prévu en **PostgreSQL** et comportera au minimum :

1. Un model ***User***

2. Un model ***Movie***

3. Un model ***Rating***

Nous devrons faire en sorte qu'un film puisse posséder plusieurs notations de plusieurs utilisateurs et qu'il puisse faire partie de leurs *check-lists*. Des méthodes permettront de faire les moyennes des notations des utilisateurs et ainsi juger de la pertinence de celles de la rédaction NotaCine.

### 3.2. Front

Nous prévoyons de partir sur une base CSS avec **Bootstrap** avec une **surcouche** maison mais sans doute avec un système de **grid-css et flexbox** en manuel.

L'affichage et les **animations** seront soignées avec du **JavaScript** et le système de barre avec curseur est encore à l'étude.

### 3.3. Backend

Le site sera réalisé en **Ruby** avec son framework **Ruby On Rails**, le tout arboré de quelques **gem**'s indispensables pour être dans les temps comme **Devise** entre autres.

Nous pensions initialement travailler avec l'**API** de IMDB mais **TMDB** pourrait sembler plus prometteuse.

### 3.4. Mes besoins techniques

Infographiste de métier, plus à l'aise en front qu'en **back**. Notre équipe est actuellement assez équilibré en compétence mais nous cherchons éventuellement un profil capable de d'implémenter une **partie admin** avec une certaine aisance en **JavaScript**.

## 4. MVP

Notre produit est notre fonctionnalité principale, la notation. Nous prévoyons donc de miser nos efforts sur la création d'une base de données propre, solide et sécurisée, l'accès à l'inscription des utilisateurs et la notation viable et sans accroc. Le design sera sans doute plus fonctionnel qu'esthétique en fin de première semaine.

Durant la première semaine, nous prévoyons de rendre opérationnels :

- la base de données

- la création de comptes administrateurs et utilisateurs

- la notation avec des curseurs (sliders)

- l'accès aux pages dédiées des films en base et à leurs notations

- un web-design fonctionnel

- et plus, si le temps nous le permet...


## 5. La version présentée aux jury

Nous souhaitons présenter aux jury un site avec la meilleure ***User Experience*** possible en ajoutant des fonctionnalités spécifiquement destinées aux utilisateurs.

Pour le rendu final, nous espérons proposer :

- une base de données de films enrichie grâçe à une API

- l'envoi d'emails automatisé

- une barre de recherche opérationnelle

- l'accès aux catégories de films

- l'accès à la notation moyenne des utilisateurs par critère et par film

- des pages profils utilisateurs avec leurs notations et critiques associées

- un système de check-list de films à voir, déjà vu et en recommandation

- la rédaction facultative d'une critique sous une notation

- une section commentaire et sous-commentaire sous chaque notation

- une système de badges honorifiques et disctintifs pour les utilisateurs, relatifs à leurs nombres de notation ou à leurs notoriétés dans le milieu de la critique ciné

Nous espérons également pouvoir développer à temps un **moteur de recherche** de film via le système des curseurs afin de faciliter les choix de films à regarder.

## 6. Le mentor

Nous sommes actuellement en recherche mais espérons en convaincre un qui saura nous accompagner dans ce défi qui pour l'instant, nous dépasse mais pour lequel nous allons nous surpasser.