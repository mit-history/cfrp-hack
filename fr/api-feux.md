---
layout: default
lang: en
nav_order: 1
title: API
parent: Les Registres des Feux
grand_parent: Version Française
permalink: /fr/feux/api.html
---

<details open markdown="block">
  <summary>
    Table of contents
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>

## Survol

L’API JSON est le moyen privilégié d’accéder aux données des registres des feux en raison du fait qu’il se sert de la version la plus récente de la base de données.

Cette api complète celle des recettes et donc, bien qu’il soit impossible d’éviter une certaine duplication, elle se concentre sur les données propres aux feux. Par conséquent, elle n’offre pas un moyen d’accéder aux donnés qui portent sur les ventes de billets ou la recette journalière; pour obtenir ces informations-là, voir [l’API des recettes](“/fr/recettes/api.html”)

## Points de terminaison

Il existe huit points de terminaison disponibles à partir de [api-feux.cfregisters.org]("api-feux.cfregisters.org").

Chaque point de terminaison permet de chercher la liste intégrale d’objets ou de trouver un seul en se servant du paramètre URL facultatif « id ». Des paramètres supplémentaires inclus dans le corps de la requête permettent de faire des recherches plus complexes. Tous filtres sont conjonctifs (ET)

### Comédiens

Ce point de terminaison permet de chercher la liste intégrale de comédiens actifs lors de la période des feux (1765-1793).

Pour des détails relatifs aux attributs individuels, voir [ici](“/fr/feux/base-de-donnees.html#acteurs).

<br>
**Chercher tous**

*Requête*
```
GET https://api-feux.cfregisters.org/actors

```

*Exemple de réponse*


```
[
    {
        "id": 652,
        "pseudonym": "Adeline",
        "pseudonym_number": 0,
        "honorific": "Mademoiselle",
        "first_name": null,
        "last_name": null,
        "alias": null,
        "status": null,
        "entree": null,
        "societariat": null,
        "depart": null,
        "debut": null,
        "notes": "de la Comédie italienne"
    },
    {
        "id": 637,
        "pseudonym": "Allard",
        "pseudonym_number": 0,
        "honorific": "Mademoiselle",
        "first_name": null,
        "last_name": null,
        "alias": null,
        "status": "O",
        "entree": null,
        "societariat": null,
        "depart": null,
        "debut": [
            1783
        ],
        "notes": null
    },
    ...
]
```
<br>
**Chercher un**

Pour chercher les informations portant sur un seul comédien, il suffit d’ajouter leur identifiant numérique à la fin de l’URL.

*Exemple de requête*

```
GET https://api-feux.cfregisters.org/actors/357

```

*Exemple de réponse*

```
[
    {
        "id": 357,
        "pseudonym": "Molé",
        "pseudonym_number": 0,
        "honorific": "Monsieur",
        "first_name": "François-René",
        "last_name": "Molé",
        "alias": "Molet",
        "status": "S",
        "entree": 1754,
        "societariat": 1761,
        "depart": 1802,
        "debut": null,
        "notes": "Frère cadet de Dalainville"
    }
]

```

### Pièces

Ce point de terminaison donne accès à la liste des pièces représentées lors de la période des feux (1765-1793). Il est important de noter que, bien qu’une partie des mêmes données soit disponible à partir de l’API des recettes, les représentations dans des lieux extraordinaires ainsi que quelques désaccords au niveau des sources primaires font que les deux listes sont légèrement différentes.

Pour des détails relatifs aux attributs individuels, voir [ici](“/fr/feux/base-de-donnees.html#plays).

<br>
**Chercher tous**

*Requête*

```
GET https://api-feux.cfregisters.org/plays

```

*Exemple de réponse*

```
[
    {
        "id": 4832,
        "title": "Abdir",
        "authors": [
            30
        ],
        "genre": "drame",
        "acts": 4,
        "prologue": false,
        "divertissement": false,
        "prose_vers": "vers",
        "premiere": "1785-01-26T08:12:28.000Z"
    },
    {
        "id": 4833,
        "title": "Abdolonime ou le Roi berger",
        "authors": [
            3
        ],
        "genre": "comédie héroïque",
        "acts": 3,
        "prologue": false,
        "divertissement": false,
        "prose_vers": "vers",
        "premiere": "1776-03-06T08:12:28.000Z"
    },
    ...
  ]
```

<br>
**Chercher un**

To fetch a single play record, append its unique numerical id to the basic URL.

*Exemple de requête*

```
GET https://api-feux.cfregisters.org/plays/5396

```

*Example de réponse*

```
[
    {
        "id": 5396,
        "title": "Phèdre et Hippolyte ou Phèdre",
        "authors": [
            15
        ],
        "genre": "tragédie",
        "acts": 5,
        "prologue": false,
        "divertissement": false,
        "prose_vers": "vers",
        "premiere": null
    }
]

```

<br>
**Paramètres facultatifs**

Il existe deux paramètres facultatifs qu’il est possible d'ajouter au corps de la requête:

- author_id
  - *type*: integer
  - *valeur par défaut*: null
  - cherche les pièces d'un seul auteur
- full
  - *type*: boolean
  - *valeur par défaut*: false
  - remplace les identifiants par les objets complets

Exemple de configuration et de la réponse corespondante:

```
{
"author_id": 214 ,
"full": true
}
```

<br>

```
[
    {
        "id": 5314,
        "title": "Esclavage de nègres ou l'Heureux naufrage (L')",
        "authors": [
            {
                "id": 214,
                "name": "Gouges, Olympe de",
                "birthyear": 1748,
                "deathyear": 1793,
                "notes": "Auteur de comédies et femme politique. - Pseudonyme de : Marie-Olympe Gouze, épouse Aubry, Louis"
            }
        ],
        "genre": "drame",
        "acts": 3,
        "prologue": false,
        "divertissement": false,
        "prose_vers": "prose",
        "premiere": "1789-12-28T08:12:28.000Z"
    }
]
```

### Auteurs

### Rôles

### Lieux

### Séances

### Représentations

### Interprétations
