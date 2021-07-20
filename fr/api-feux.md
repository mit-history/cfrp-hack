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

L’API REST est le moyen privilégié d’accéder aux données des registres des feux en raison du fait qu’il se sert de la version la plus récente de la base de données.

Cette api complète celle des recettes et donc, bien qu’il soit impossible d’éviter une certaine duplication, elle se concentre sur les données propres aux feux. Par conséquent, elle n’offre pas un moyen d’accéder aux donnés qui portent sur les ventes de billets ou la recette journalière; pour obtenir ces informations-là, voir [l’API des recettes](“/fr/recettes/api.html”)

## Points de terminaison

Il existe huit points de terminaison disponibles à partir de [api-feux.cfregisters.org]("api-feux.cfregisters.org").

Chaque point de terminaison permet de chercher la liste intégrale d’objets ou de trouver un seul en se servant du paramètre URL facultatif « id ». Des paramètres supplémentaires inclus dans le corps de la requête permettent de faire des recherches plus complexes. Tous filtres sont conjonctifs (ET) et peuvent s'utiliser avec les URL simples ou paramètrisés.

### Comédiens

Ce point de terminaison permet de chercher la liste intégrale de comédiens actifs lors de la période des feux (1765-1793).

Pour des détails relatifs aux attributs individuels, voir [ici](“/fr/feux/base-de-donnees.html#acteurs).

<br>
**Chercher tous**

*Requête*
```
GET https://api-feux.cfregisters.org/actors

```

*Réponse*


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

### Auteurs

Ce point de terminaison permet d'accéder à la liste d’auteurs de pièces ayant été jouées entre 1765 et 1793. Tout comme pour les pièces, cette liste compte plusieurs auteurs en amont de ceux de la liste donnée par l’API des recettes. Il faut aussi noter que l’attribut « id » donné ici correspond au « ext_id » dans l’autre liste.

Pour des détails relatifs aux attributs individuels, voir [ici]("/fr/feux/base-de-donnees.html#people")

**Chercher tous**

*Requête*

```
GET https://api-feux.cfregisters.org/authors

```

*Réponse*

```
[
    {
        "id": 144,
        "name": "Aigueberre, Jean Dumas d'",
        "birthyear": 1692,
        "deathyear": 1755,
        "notes": "Auteur dramatique. - Conseiller au Parlement de Toulouse"
    },
    {
        "id": 190,
        "name": "Allainval, Léonor-Jean-Christine Soulas d'",
        "birthyear": 1700,
        "deathyear": 1753,
        "notes": "Auteur dramatique. - Semble n'avoir eu d'abbé que le titre"
    },
  ...
]
```

<br>
**Chercher un**

Pour chercher les informations portant sur un seul auteur, il suffit d’ajouter leur identifiant numérique à la fin de l’URL.

*Exemple de requête*

```
GET https://api-feux.cfregisters.org/authors/115

```

*Exemple de réponse*

```
[
    {
        "id": 115,
        "name": "Legrand, Marc-Antoine",
        "birthyear": 1673,
        "deathyear": 1728,
        "notes": "Auteur dramatique. - Comédien"
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

*Réponse*

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

Pour chercher les informations portant sur une seule pièce, il suffit d’ajouter son identifiant numérique à la fin de l’URL.

*Exemple de requête*

```
GET https://api-feux.cfregisters.org/plays/5396

```

*Exemple de réponse*

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
  - cherche les pièces d'un seul auteur
- full
  - *type*: boolean
  - *valeur par défaut*: false
  - remplace les identifiants par des objets complets

<br>
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

### Rôles

This endpoint gives access to all the roles performed during the relevant period (1765-1793).

Pour des détails relatifs aux attributs individuels, voir [ici]("/fr/feux/bases-de-donnees.html#personnages")

<br>
**Chercher tous**

*Requête*

```
GET https://api-feux.cfregisters.org/roles
```

*Réponse*

```
[
    {
        "id": 692,
        "name": "Agénor",
        "play_id": 18,
        "gender": "Mrs."
    },
    {
        "id": 690,
        "name": "Démocrite",
        "play_id": 18,
        "gender": "Mrs."
    },
  ...
]
```

<br>
**Chercher un**

Pour chercher les informations portant sur un seul rôle, il suffit d’ajouter son identifiant numérique à la fin de l’URL.

*Exemple de requête*

```
GET https://api-feux.cfregisters.org/roles/65

```

*Exemple de réponse*

```
[
    {
        "id": 65,
        "name": "Sganarelle",
        "play_id": 5155,
        "gender": "Mrs."
    }
]

```


<br>
**Paramètres facultatifs**

Il existe deux paramètres facultatifs qu’il est possible d'ajouter au corps de la requête:

- play_id
  - *type*: integer
  - cherche les rôles propres à une seule pièce
- full
  - *type*: boolean
  - *valeur par défaut*: false
  -  remplace les identifiants par des objets complets

<br>
Exemple de configuration et de la réponse corespondante:

```
{
    "play_id":5155,
}
```

```
[
    {
        "id": 65,
        "name": "Sganarelle",
        "gender": "Mrs.",
        "play": {
            "id": 5155,
            "title": "Médecin malgré lui (Le) / Le Médecin forcé (titre alt.)",
            "authors": [
                {
                    "id": 2,
                    "name": "Molière, Jean-Baptiste Poquelin, dit",
                    "birthyear": 1622,
                    "deathyear": 1673,
                    "notes": null
                }
            ],
            "genre": "comédie",
            "acts": 3,
            "prologue": false,
            "divertissement": true,
            "prose_vers": "prose",
            "premiere": null
        }
    },
    {
        "id": 66,
        "name": "Robert",
        "gender": "Mrs.",
        "play": {
            "id": 5155,
            "title": "Médecin malgré lui (Le) / Le Médecin forcé (titre alt.)",
            "authors": [
                {
                    "id": 2,
                    "name": "Molière, Jean-Baptiste Poquelin, dit",
                    "birthyear": 1622,
                    "deathyear": 1673,
                    "notes": null
                }
            ],
            "genre": "comédie",
            "acts": 3,
            "prologue": false,
            "divertissement": true,
            "prose_vers": "prose",
            "premiere": null
        }
    },
    {
        "id": 67,
        "name": "Valère",
        "gender": "Mrs.",
        "play": {
            "id": 5155,
            "title": "Médecin malgré lui (Le) / Le Médecin forcé (titre alt.)",
            "authors": [
                {
                    "id": 2,
                    "name": "Molière, Jean-Baptiste Poquelin, dit",
                    "birthyear": 1622,
                    "deathyear": 1673,
                    "notes": null
                }
            ],
            "genre": "comédie",
            "acts": 3,
            "prologue": false,
            "divertissement": true,
            "prose_vers": "prose",
            "premiere": null
        }
    },
    ...
]
```

### Lieux


Ce point de terminaison donne accès à la liste de lieux de représentation hors des salles de la CF. Les entrées similaires n’ont pas été fusionnées afin de préserver le niveau de détail présent dans les registres.


Pour des détails relatifs aux attributs individuels, voir [ici]("/fr/feux/bases-de-donnees.html#lieux")

**Chercher tous**

*Requête*

```
GET https://api-feux.cfregisters.org/locations

```

*Réponse*

```
[
    {
        "id": 15,
        "name": "A Chilly, chez Me la Duchesse de Mazarin"
    },
    {
        "id": 38,
        "name": "Brunoi"
    },
    ...
]

```

<br>
**Chercher un**

Pour chercher les informations portant sur un seul lieu, il suffit d’ajouter son identifiant numérique à la fin de l’URL.

*Exemple de requête*

```
GET https://api-feux.cfregisters.org/locations/3

```

*Exemple de réponse*

```
[
    {
        "id": 3,
        "name": "Fontainebleau"
    }
]
```


### Séances

Les entrées auxquelles on peut accéder par ce point de terminaison correspondent chacune à une page dans les registres, donnant les détails sur une date unique. L'attribut « register_id » fait référence aux registres des recettes, et crée donc un lieu entre la distribution et la recette journalière.

Pour des détails relatifs aux attributs individuels, voir [ici]("/fr/feux/bases-de-donnees.html#feux")


<br>
**Chercher tous**

*Requête*

```
GET https://api-feux.cfregisters.org/sessions

```

*Réponse*

```
[
    {
        "id": 13,
        "register_id": 22993,
        "date": "1765-09-09T08:12:28.000Z",
        "annotations": "Adélaïde du Guesclin, Tragédie de M. de Voltaire, remise au Théâtre. 1ère Représentation."
    },
    {
        "id": 14,
        "register_id": 22994,
        "date": "1765-09-11T08:12:28.000Z",
        "annotations": null
    },
    ...
]
```

<br>
**Chercher un**

*Exemple de requête*

```
GET https://api-feux.cfregisters.org/sessions/3218

```

*Exemple de réponse*

```
[
    {
        "id": 3218,
        "register_id": 212,
        "date": "1778-02-08T08:12:28.000Z",
        "annotations": "M. le Kain est mort aujourd'hui, à 8 hes. après midi d'une fièvre inflammatoire et d'un ulcere dans les reins.\nLe Public a demandé de ses nouvelles à M. Dauberval qui annoncait, il a répondu qu'il était mort, plusieurs personnes ont répondu Tant-pis. Un silence morne a suivi."
    }
]
```
<br>
**Paramètres facultatifs**

Il existe trois paramètres facultatifs qu’il est possible d'ajouter au corps de la requête:

- start_date
  - *type*: date (mais un « string » fonctionne également)
  - une date invalide donnera une réponse à code 400
- end_date
  - *type*: date (mais un « string » fonctionne également)
  - une date invalide donnera une réponse à code 400
- full
  - *type*: boolean
  - *valeur par défaut*: false
  - donne une réponse qui inclut les pièces jouées et leurs distributions

<br>
Exemples de configurations et des réponses corespondantes:

```
{
    "start_date": "1781-05-12",
    "end_date": "1781-05-19"
}
```

```
[
    {
        "id": 3458,
        "register_id": 9870,
        "date": "1781-05-12T08:12:28.000Z",
        "annotations": null
    },
    {
        "id": 3459,
        "register_id": 9871,
        "date": "1781-05-13T08:12:28.000Z",
        "annotations": null
    },
    {
        "id": 3460,
        "register_id": 9872,
        "date": "1781-05-14T08:12:28.000Z",
        "annotations": null
    },
    {
        "id": 3461,
        "register_id": 9873,
        "date": "1781-05-15T08:12:28.000Z",
        "annotations": null
    },
    {
        "id": 3462,
        "register_id": 9874,
        "date": "1781-05-16T08:12:28.000Z",
        "annotations": "[À Marly] Le Bal bourgeois, Opéra-comique en un acte, de M. Favart. \nLe Ballet de la Comédie a dansé dans la Pièce. Le tout a été terminé par un Ballet de l'Opéra.\nMrs. Rosiere, Michu et Mes. Adeline, Gontier - de la Comédie Italienne"
    },
    {
        "id": 3463,
        "register_id": 9875,
        "date": "1781-05-17T08:12:28.000Z",
        "annotations": null
    },
    {
        "id": 3464,
        "register_id": 9876,
        "date": "1781-05-18T08:12:28.000Z",
        "annotations": null
    },
    {
        "id": 3465,
        "register_id": 9877,
        "date": "1781-05-19T08:12:28.000Z",
        "annotations": "M. Necker a obtenu aujourd'hui sa démission de Directeur général des finances."
    }
]
```

La gamme des valeurs est inclusive des extrémités, de sorte qu'en spécifiant le début et la fin comme étant la même date, on peut récupérer les données relatives à une seule soirée.

```
{
    "start_date": "1769-01-10",
    "end_date": "1769-01-10",
    "full": true
}
```

```
[
    {
        "id": 260,
        "register_id": 23997,
        "date": "1769-01-10T08:12:28.000Z",
        "annotations": "Mr. Molé a épousé Mlle. Dépinai ce matin à six heures à St. Sulpice.",
        "performances": [
            {
                "id": 483,
                "session_id": 260,
                "play": {
                    "id": 5234,
                    "title": "Épreuve réciproque (L')",
                    "authors": [
                        {
                            "id": 115,
                            "name": "Legrand, Marc-Antoine",
                            "birthyear": 1673,
                            "deathyear": 1728,
                            "notes": "Auteur dramatique. - Comédien"
                        }
                    ],
                    "genre": "comédie",
                    "acts": 1,
                    "prologue": false,
                    "divertissement": false,
                    "prose_vers": "prose",
                    "premiere": "1711-10-06T08:12:28.000Z",
                    "cast": [
                        {
                            "role": {
                                "id": 421,
                                "name": "Valère",
                                "play_id": 5234,
                                "gender": "Mrs."
                            },
                            "actor": {
                                "id": 81,
                                "pseudonym": "Chevalier aîné ",
                                "pseudonym_number": 0,
                                "honorific": "Monsieur",
                                "first_name": "Joseph Bonaventure",
                                "last_name": "Chevalier, dit",
                                "alias": null,
                                "status": "P",
                                "entree": 1767,
                                "societariat": null,
                                "depart": 1770,
                                "debut": [
                                    1757
                                ],
                                "notes": null
                            }
                        },
                        {
                            "role": {
                                "id": 422,
                                "name": "Frontin",
                                "play_id": 5234,
                                "gender": "Mrs."
                            },
                            "actor": {
                                "id": 10,
                                "pseudonym": "Augé",
                                "pseudonym_number": 0,
                                "honorific": "Monsieur",
                                "first_name": "François",
                                "last_name": "Augé",
                                "alias": "Auger",
                                "status": "S",
                                "entree": 1763,
                                "societariat": 1763,
                                "depart": 1782,
                                "debut": null,
                                "notes": null
                            }
                        },
                        {
                            "role": {
                                "id": 424,
                                "name": "Mme. de Folignac",
                                "play_id": 5234,
                                "gender": "Mes."
                            },
                            "actor": {
                                "id": 200,
                                "pseudonym": "Durand",
                                "pseudonym_number": 1,
                                "honorific": "Mademoiselle",
                                "first_name": "Marie-Anne",
                                "last_name": "Durand",
                                "alias": null,
                                "status": "P",
                                "entree": 1767,
                                "societariat": null,
                                "depart": 1769,
                                "debut": [
                                    1767
                                ],
                                "notes": null
                            }
                        },
                        {
                            "role": {
                                "id": 425,
                                "name": "Philaminte",
                                "play_id": 5234,
                                "gender": "Mes."
                            },
                            "actor": {
                                "id": 396,
                                "pseudonym": "Préville",
                                "pseudonym_number": 0,
                                "honorific": "Madame",
                                "first_name": "Madeleine-Angélique-Michelle",
                                "last_name": "Drouin, épouse du Bus, dite",
                                "alias": "Mademoiselle Drouin",
                                "status": "S",
                                "entree": 1753,
                                "societariat": 1757,
                                "depart": 1786,
                                "debut": null,
                                "notes": "Le registre du 26 novembre 1791 indique une \"rentrée\" de Monsieur et Madame Préville, qui jouent régulièrement jusqu'à la fin de la saison."
                            }
                        },
                        {
                            "role": {
                                "id": 426,
                                "name": "Lisette",
                                "play_id": 5234,
                                "gender": "Mes."
                            },
                            "actor": {
                                "id": 212,
                                "pseudonym": "Fanier",
                                "pseudonym_number": 0,
                                "honorific": "Mademoiselle",
                                "first_name": "Alexandrine-Louise",
                                "last_name": "Fanier",
                                "alias": "Faniez / Fannier",
                                "status": "S",
                                "entree": 1764,
                                "societariat": 1766,
                                "depart": 1786,
                                "debut": null,
                                "notes": null
                            }
                        },
                        {
                            "role": {
                                "id": 2238,
                                "name": "Criquet",
                                "play_id": 5234,
                                "gender": "Mes."
                            },
                            "actor": {
                                "id": 599,
                                "pseudonym": "Guiardelle",
                                "pseudonym_number": 0,
                                "honorific": "Mademoiselle",
                                "first_name": null,
                                "last_name": null,
                                "alias": null,
                                "status": "O",
                                "entree": 1760,
                                "societariat": null,
                                "depart": null,
                                "debut": null,
                                "notes": "une petite fille"
                            }
                        }
                    ]
                }
            },
            {
                "id": 484,
                "session_id": 260,
                "play": {
                    "id": 5234,
                    "title": "Épreuve réciproque (L')",
                    "authors": [
                        {
                            "id": 115,
                            "name": "Legrand, Marc-Antoine",
                            "birthyear": 1673,
                            "deathyear": 1728,
                            "notes": "Auteur dramatique. - Comédien"
                        }
                    ],
                    "genre": "comédie",
                    "acts": 1,
                    "prologue": false,
                    "divertissement": false,
                    "prose_vers": "prose",
                    "premiere": "1711-10-06T08:12:28.000Z",
                    "cast": [
                        {
                            "role": {
                                "id": 421,
                                "name": "Valère",
                                "play_id": 5234,
                                "gender": "Mrs."
                            },
                            "actor": {
                                "id": 81,
                                "pseudonym": "Chevalier aîné ",
                                "pseudonym_number": 0,
                                "honorific": "Monsieur",
                                "first_name": "Joseph Bonaventure",
                                "last_name": "Chevalier, dit",
                                "alias": null,
                                "status": "P",
                                "entree": 1767,
                                "societariat": null,
                                "depart": 1770,
                                "debut": [
                                    1757
                                ],
                                "notes": null
                            }
                        },
                        {
                            "role": {
                                "id": 422,
                                "name": "Frontin",
                                "play_id": 5234,
                                "gender": "Mrs."
                            },
                            "actor": {
                                "id": 10,
                                "pseudonym": "Augé",
                                "pseudonym_number": 0,
                                "honorific": "Monsieur",
                                "first_name": "François",
                                "last_name": "Augé",
                                "alias": "Auger",
                                "status": "S",
                                "entree": 1763,
                                "societariat": 1763,
                                "depart": 1782,
                                "debut": null,
                                "notes": null
                            }
                        },
                        {
                            "role": {
                                "id": 424,
                                "name": "Mme. de Folignac",
                                "play_id": 5234,
                                "gender": "Mes."
                            },
                            "actor": {
                                "id": 200,
                                "pseudonym": "Durand",
                                "pseudonym_number": 1,
                                "honorific": "Mademoiselle",
                                "first_name": "Marie-Anne",
                                "last_name": "Durand",
                                "alias": null,
                                "status": "P",
                                "entree": 1767,
                                "societariat": null,
                                "depart": 1769,
                                "debut": [
                                    1767
                                ],
                                "notes": null
                            }
                        },
                        {
                            "role": {
                                "id": 425,
                                "name": "Philaminte",
                                "play_id": 5234,
                                "gender": "Mes."
                            },
                            "actor": {
                                "id": 396,
                                "pseudonym": "Préville",
                                "pseudonym_number": 0,
                                "honorific": "Madame",
                                "first_name": "Madeleine-Angélique-Michelle",
                                "last_name": "Drouin, épouse du Bus, dite",
                                "alias": "Mademoiselle Drouin",
                                "status": "S",
                                "entree": 1753,
                                "societariat": 1757,
                                "depart": 1786,
                                "debut": null,
                                "notes": "Le registre du 26 novembre 1791 indique une \"rentrée\" de Monsieur et Madame Préville, qui jouent régulièrement jusqu'à la fin de la saison."
                            }
                        },
                        {
                            "role": {
                                "id": 426,
                                "name": "Lisette",
                                "play_id": 5234,
                                "gender": "Mes."
                            },
                            "actor": {
                                "id": 212,
                                "pseudonym": "Fanier",
                                "pseudonym_number": 0,
                                "honorific": "Mademoiselle",
                                "first_name": "Alexandrine-Louise",
                                "last_name": "Fanier",
                                "alias": "Faniez / Fannier",
                                "status": "S",
                                "entree": 1764,
                                "societariat": 1766,
                                "depart": 1786,
                                "debut": null,
                                "notes": null
                            }
                        },
                        {
                            "role": {
                                "id": 2238,
                                "name": "Criquet",
                                "play_id": 5234,
                                "gender": "Mes."
                            },
                            "actor": {
                                "id": 599,
                                "pseudonym": "Guiardelle",
                                "pseudonym_number": 0,
                                "honorific": "Mademoiselle",
                                "first_name": null,
                                "last_name": null,
                                "alias": null,
                                "status": "O",
                                "entree": 1760,
                                "societariat": null,
                                "depart": null,
                                "debut": null,
                                "notes": "une petite fille"
                            }
                        }
                    ]
                }
            }
        ]
    }
]
```

En raison du volume de données, il n'est pas conseillé de faire la requête avec l'option « full » sans ajouter d'autres filtres.

### Représentations

Les entrées accessibles par ce point de terminaison correspondent chacune à une pièce spécifique jouée lors d'une séance particulière. Ces données doublent, de quelque sorte, les « register_plays » de l'API recettes, mais, comme indiqué précédemment, il existe toujours des différences entre les deux listes vu les représentations dans des lieux extraordinaires et quelques désaccords au niveau des registres mêmes.

Pour des détails relatifs aux attributs individuels, voir [ici]("/fr/feux/bases-de-donnees.html#feux_plays")

<br>
**Chercher un**

*Requête*

```
GET https://api-feux.cfregisters.org/performances

```

*Réponse*

```

[
    {
        "id": 16480,
        "session_id": 2368,
        "play_id": 5066,
        "location_id": null
    },
    {
        "id": 5234,
        "session_id": 2604,
        "play_id": 5206,
        "location_id": null
    },
    {
        "id": 5407,
        "session_id": 2681,
        "play_id": 5402,
        "location_id": null
    },
    {
        "id": 5409,
        "session_id": 2681,
        "play_id": 5127,
        "location_id": 1
    },
    ...
]

```

<br>
**Chercher un**

*Exemple de requête*

```
GET https://api-feux.cfregisters.org/performances/5291

```

*Exemple de réponse*

```
[
    {
        "id": 5291,
        "session_id": 2633,
        "play_id": 5354,
        "location_id": 1
    }
]

```

<br>
**Paramètres facultatifs**

Il existe trois paramètres facultatifs qu’il est possible d'ajouter au corps de la requête:

- session_id
  - *type*: integer
  - cherche toutes les représentations propres à une seule séance
- play_id
  - *type*: integer
  - cherche toutes les représentations d'une pièce particulière
- full
  - *type*: boolean
  - *valeur par défaut*: false
  - fait que la réponse inclut les distributions de chaque pièce et que tous les identifiants soient remplacés par des objets complets

<br>
Exemple de configuration et de la réponse corespondante:

```
{
   "play_id":5196,
   "full":true
}
```

```
[
    {
        "id": 5995,
        "session_id": 2969,
        "location_id": null,
        "play": {
            "id": 5196,
            "title": "Siège de Calais (Le)",
            "authors": [
                {
                    "id": 92,
                    "name": "Belloy, Pierre Laurent de",
                    "birthyear": 1727,
                    "deathyear": 1775,
                    "notes": "Comédien et auteur dramatique, surtout connu pour ses tragédies patriotiques. - Membre de l'Académie française (élu en 1771). - Dormont de Belloy est le pseudonyme de Pierre-Laurent Buirette"
                }
            ],
            "genre": "tragédie",
            "acts": 5,
            "prologue": false,
            "divertissement": false,
            "prose_vers": "vers",
            "premiere": "1765-02-13T08:12:28.000Z",
            "cast": [
                {
                    "role": {
                        "id": 1511,
                        "name": "Amblétuse",
                        "play_id": 5196,
                        "gender": "Mrs."
                    },
                    "actor": {
                        "id": 370,
                        "pseudonym": "Naudet",
                        "pseudonym_number": 0,
                        "honorific": "Monsieur",
                        "first_name": "Jean-Baptiste Julien-Marcel",
                        "last_name": "Naudet",
                        "alias": null,
                        "status": "S",
                        "entree": 1784,
                        "societariat": 1785,
                        "depart": 1806,
                        "debut": null,
                        "notes": null
                    }
                },
                {
                    "role": {
                        "id": 1510,
                        "name": "Aurèle",
                        "play_id": 5196,
                        "gender": "Mrs."
                    },
                    "actor": {
                        "id": 449,
                        "pseudonym": "Talma",
                        "pseudonym_number": 0,
                        "honorific": "Monsieur",
                        "first_name": "François-Joseph",
                        "last_name": "Talma",
                        "alias": null,
                        "status": "S",
                        "entree": 1787,
                        "societariat": 1789,
                        "depart": 1826,
                        "debut": null,
                        "notes": null
                    }
                },
                ...


            ]
        }
    },
    {
        "id": 1167,
        "session_id": 554,
        "location_id": null,
        "play": {
            ...
            "cast": [
                {
                    "role": {
                        "id": 1511,
                        "name": "Amblétuse",
                        "play_id": 5196,
                        "gender": "Mrs."
                    },
                    "actor": {
                        "id": 370,
                        "pseudonym": "Naudet",
                        "pseudonym_number": 0,
                        "honorific": "Monsieur",
                        "first_name": "Jean-Baptiste Julien-Marcel",
                        "last_name": "Naudet",
                        "alias": null,
                        "status": "S",
                        "entree": 1784,
                        "societariat": 1785,
                        "depart": 1806,
                        "debut": null,
                        "notes": null
                    }
                },
                {
                    "role": {
                        "id": 1510,
                        "name": "Aurèle",
                        "play_id": 5196,
                        "gender": "Mrs."
                    },
                    "actor": {
                        "id": 449,
                        "pseudonym": "Talma",
                        "pseudonym_number": 0,
                        "honorific": "Monsieur",
                        "first_name": "François-Joseph",
                        "last_name": "Talma",
                        "alias": null,
                        "status": "S",
                        "entree": 1787,
                        "societariat": 1789,
                        "depart": 1826,
                        "debut": null,
                        "notes": null
                    }
                },
                ...
            ]
        }
    },
    ...
]
```

En raison du volume de données, il n'est pas conseillé de faire la requête avec l'option « full » sans ajouter d'autres filtres.


### Interprétations

Ce point de terminaison sert à chercher tous les triples comédien-représentation-rôle ainsi que quelques précisions relatives à l’interprétation.

Pour des détails relatifs aux attributs individuels, voir [ici]("/fr/feux/bases-de-donnees.html#casting_records")


<br>
**Chercher un**

*Requête*

```
GET https://api-feux.cfregisters.org/interpretations

```

*Réponse*

```
[
  {
    "id":169398,
    "performance_id":12801,
    "role_id":null,
    "actor_id":211,
    "debut":false,
    "reprisal":false,
    "in_middle":false},
  {  
    "id":169399,
    "performance_id":12801,
    "role_id":null,
    "actor_id":225,
    "debut":false,
    "reprisal":false,
    "in_middle":false
  },
  ...
]
```

<br>
**Fetch one**

*Exemple de requête*

```
GET https://api-feux.cfregisters.org/interpretations

```

*Exemple de réponse*

```
[
    {
        "id": 106164,
        "performance_id": 11938,
        "role_id": 1007,
        "actor_id": 61,
        "debut": false,
        "reprisal": true,
        "in_middle": false
    }
]

```

<br>
**Paramètres facultatifs**

Il existe quatre paramètres facultatifs qu’il est possible d'ajouter au corps de la requête:

- performance_id
  - *type*: integer
  - cherche la distribution d'une représentation précise
- actor_id
  - *type*: integer
  - cherche toutes les interprétations données par un seul comédien
- role_id
  - *type*: integer
  - cherche toutes les interprétations d'un rôle
- full
  - *type*: boolean
  - *default*: false
  - remplace les identifiants par des objets complets


<br>
Exemples de configurations et des réponses corespondantes:

```
{
    "role_id":4,
    "actor_id": 191
}
```

```
[
    {
        "id": 549,
        "performance_id": 97,
        "role_id": 4,
        "actor_id": 191,
        "debut": false,
        "reprisal": false,
        "in_middle": false
    },
    {
        "id": 5923,
        "performance_id": 874,
        "role_id": 4,
        "actor_id": 191,
        "debut": false,
        "reprisal": false,
        "in_middle": false
    },
    ...
]

```

<br>

```
{
    "performance_id":12484,
    "actor_id": 37,
    "full":true
}
```

```
[
    {
        "role": {
            "id": 991,
            "name": "D. Alonse",
            "gender": "Mrs.",
            "play": {
                "id": 4849,
                "title": "Alzire ou les Américains",
                "authors": [
                    {
                        "id": 5,
                        "name": "Voltaire, François-Marie Arouet, dit",
                        "birthyear": 1694,
                        "deathyear": 1778,
                        "notes": "Écrivain et philosophe. - Membre de l'Académie française (1746)"
                    }
                ],
                "genre": "tragédie",
                "acts": 5,
                "prologue": false,
                "divertissement": false,
                "prose_vers": "vers",
                "premiere": "1736-01-27T08:12:28.000Z"
            }
        },
        "actor": {
            "id": 37,
            "pseudonym": "Bellemont",
            "pseudonym_number": 0,
            "honorific": "Monsieur",
            "first_name": "Jean-Baptiste",
            "last_name": "Colbert de Beaulieu,dit",
            "alias": "Belmont",
            "status": "S",
            "entree": 1765,
            "societariat": 1778,
            "depart": 1801,
            "debut": null,
            "notes": null
        },
        "performance": {
            "id": 12484,
            "session_id": 6214
        }
    }
]
```

En raison du volume de données, il n'est pas conseillé de faire la requête avec l'option « full » sans ajouter d'autres filtres.
