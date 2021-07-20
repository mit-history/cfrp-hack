---
layout: default
lang: en
nav_order: 1
title: API
parent: Casting Registers
grand_parent: English Version
permalink: /en/casting/api.html
---

<details open markdown="block">
  <summary>
    Table of contents
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>

## Overview

The JSON API is the preferred method of working accessing the casting registers data as it is always pulling from the most up to date copy of the database.

This API is designed to supplement that of the receipt registers. To that end, while there is a certain amount of unavoidable duplication, the following endpoints focus on the casting-specific data and do not provide access to ticket sale and revenue information; that can be obtained using the [receipts API]("/en/receipts/api.html").

## Endpoints

There are eight endpoints available at [api-feux.cfregisters.org]("api-feux.cfregisters.org").

<<<<<<< HEAD
Each allows the user to fetch the complete list of entities or to fetch a single instance via an optional id URL parameter. Various additional parameters included in the body of the request, as described below, allow for more detailed filtering. All filters are conjunctive (AND) and can be used in conjunction with basic or parameterized URLs.
=======
Each allows the user to fetch the complete list of entities or to fetch a single instance via an optional id URL parameter. Various additional parameters included in the body of the request, as described below, allow for more detailed filtering. All filters are conjunctive (AND).
>>>>>>> f1d7d63... feux api inital

### Actors

This endpoint allows the user to fetch the list of all the actors who were active during the period covered by the casting registers (1765-1793).

For details on individual fields, see [here]("/en/casting/database.html#acteurs")

<br>
**Fetch all**

*Request*
```
GET https://api-feux.cfregisters.org/actors

```

<<<<<<< HEAD
*Response*
=======
*Example Response*
>>>>>>> f1d7d63... feux api inital


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
**Fetch One**

To fetch a single actor record, append their unique numerical id to the basic URL.

*Example Request*

```
GET https://api-feux.cfregisters.org/actors/357

```

*Example Response*

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

<<<<<<< HEAD
### Authors

This endpoint allows access to the list of authors of the plays performed between 1765 and 1793. As with plays, there are people above an beyond the list available through the receipts API. It should also be noted that the "id" field given here corresponds to the "ext_id" returned by the receipts API.

For details on individual fields, see [here]("/en/casting/database.html#people")

**Fetch All**

*Request*

```
GET https://api-feux.cfregisters.org/authors

```

*Response*

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
**Fetch One**

To fetch a single author record, append its unique numerical id to the basic URL.

*Example Request*

```
GET https://api-feux.cfregisters.org/authors/115

```

*Example Response*

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

=======
>>>>>>> f1d7d63... feux api inital

### Plays

This endpoint gives access to all of the plays performed during the relevant period (1765-1793). It should be noted that, while some of this data duplicates what is available via the receipts API, outside performances and discrepancies in the source data mean that the two lists do differ slightly.

For details on individual fields, see [here]("/en/casting/database.html#plays")

<br>
**Fetch All**

*Request*

```
GET https://api-feux.cfregisters.org/plays

```

<<<<<<< HEAD
*Response*
=======
*Example Response*
>>>>>>> f1d7d63... feux api inital

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
**Fetch One**

To fetch a single play record, append its unique numerical id to the basic URL.

*Example Request*

```
GET https://api-feux.cfregisters.org/plays/5396

```

*Example Response*

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
**Optional Body Parameters**

There are two possible body parameters:

- author_id
  - *type*: integer
<<<<<<< HEAD
=======
  - *default*: null
>>>>>>> f1d7d63... feux api inital
  - filters to return only plays by a specific author
- full
  - *type*: boolean
  - *default*: false
  - if enabled, returns a response with full details in place of identifiers

<<<<<<< HEAD

<br>
=======
>>>>>>> f1d7d63... feux api inital
Example configuration and corresponding response:

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

<<<<<<< HEAD
### Roles

This endpoint gives access to all the roles performed during the relevant period (1765-1793).

For details on individual fields, see [here]("/en/casting/database.html#personnages")

<br>
**Fetch All**

*Request*

```
GET https://api-feux.cfregisters.org/roles
```

*Response*

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
**Fetch One**

To fetch a single play record, append its unique numerical id to the basic URL.

*Example Request*

```
GET https://api-feux.cfregisters.org/roles/65

```

*Example Response*

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
**Optional Body Parameters**

There are two possible body parameters:

- play_id
  - *type*: integer
  - filters to return only the roles belonging to a single play
- full
  - *type*: boolean
  - *default*: false
  - if enabled, returns a response with full details in place of identifiers

<br>
Example configuration and corresponding response:

```
{
    "play_id":5155,
    "full": true
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

### Locations

This endpoint grants access to the list of outside locations. Similar entries were not fused, so as to maintain the level of detail present in the original registers.

For details on individual fields, see [here]("/en/casting/database.html#lieux")

**Fetch All**

*Request*

```
GET https://api-feux.cfregisters.org/locations

```

*Response*

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
**Fetch One**

To fetch a single location record, append its unique numerical id to the basic URL.

*Example Request*

```
GET https://api-feux.cfregisters.org/locations/3

```

*Example Response*

```
[
    {
        "id": 3,
        "name": "Fontainebleau"
    }
]
```



### Sessions

The records available via this endpoint each map to a page in the original registers, giving details relative to a specific date. The "register_id" refers to the receipts registers, therefore linking the casting information to the sales data.

For details on individual fields, see [here]("/en/casting/database.html#feux")

<br>
**Fetch All**

*Request*

```
GET https://api-feux.cfregisters.org/sessions

```

*Response*

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
**Fetch one**

*Example Request*

```
GET https://api-feux.cfregisters.org/sessions/3218

```

*Example Response*

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
**Optional Body Parameters**

There are three possible body parameters:

- start_date
  - *type*: date (but string can be used)
  - an invalid date will return a 400 error
- end_date
  - *type*: date (but string can be used)
  - an invalid date will return a 400 error
- full
  - *type*: boolean
  - *default*: false
  - if enabled, returns a response which includes the full details of the plays performed during each given session

<br>
Example configurations and corresponding responses:

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

The range is inclusive, so specifying the start and end as the same date can fetch the data pertaining to a single evening.

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

Due to the volume of data, running the basic (unfiltered) request with 'full' enabled is not recommended.

### Performances

The entries accessible via this endpoint each correspond to a  performance of a play in the course of a specific evening. This data somewhat doubles the "register_plays" of the receipts API but, as previously mentioned, differs slightly due to outside performances and occasional disagreement between the registers themselves.

For details on individual fields, see [here]("/en/casting/database.html#feux_plays")

<br>
**Fetch All**

*Request*

```
GET https://api-feux.cfregisters.org/performances

```

*Response*

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
**Fetch one**

*Example Request*

```
GET https://api-feux.cfregisters.org/performances/5291

```

*Example Response*

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
**Optional Body Parameters**

There are three possible body parameters:

- session_id
  - *type*: integer
  - fetches all the performances belonging to a given session
- play_id
  - *type*: integer
  - returns only the performances of the specified play
- full
  - *type*: boolean
  - *default*: false
  - if enabled, the response will include the full cast, and all identifiers will be replaced with complete objects

<br>
Example configuration and corresponding response:

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

Due to the volume of data, running the basic (unfiltered) request with 'full' enabled is not recommended.


### Interpretations

This endpoint can be used to obtain all actor-performance-role triples along with information qualifying each interpretation.

For details on individual fields, see [here]("/en/casting/database.html#casting_records")


<br>
**Fetch All**

*Request*

```
GET https://api-feux.cfregisters.org/interpretations

```

*Response*

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

*Example Request*

```
GET https://api-feux.cfregisters.org/interpretations

```

*Example Response*

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
**Optional Body Parameters**

There are four possible body parameters:

- performance_id
  - *type*: integer
  - fetches all the casting of a specific play performance
- actor_id
  - *type*: integer
  - returns all of the interpretations of roles by a specific actor
- role_id
  - *type*: integer
  - returns all portrayals of a given role
- full
  - *type*: boolean
  - *default*: false
  - if enabled, returns a response with full details in place of identifiers


<br>
Example configurations and corresponding responses:

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

Due to the volume of data, running the basic (unfiltered) request with 'full' enabled is not recommended.
=======

### Authors

### Roles

### Locations

### Sessions

### Performances

### Interpretations
>>>>>>> f1d7d63... feux api inital
