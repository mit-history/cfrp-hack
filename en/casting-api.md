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

Each allows the user to fetch the complete list of entities or to fetch a single instance via an optional id URL parameter. Various additional parameters included in the body of the request, as described below, allow for more detailed filtering. All filters are conjunctive (AND).

### Actors

This endpoint allows the user to fetch the list of all the actors who were active during the period covered by the casting registers (1765-1793).

For details on individual fields, see [here]("/en/casting/database.html#acteurs")

<br>
**Fetch all**

*Request*
```
GET https://api-feux.cfregisters.org/actors

```

*Example Response*


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


### Plays

This endpoint gives access to all of the plays performed during the relevant period (1765-1793). It should be noted that, while some of this data duplicates what is available via the receipts API, outside performances and discrepancies in the source data mean that the two lists do differ slightly.

For details on individual fields, see [here]("/en/casting/database.html#plays")

<br>
**Fetch All**

*Request*

```
GET https://api-feux.cfregisters.org/plays

```

*Example Response*

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
  - *default*: null
  - filters to return only plays by a specific author
- full
  - *type*: boolean
  - *default*: false
  - if enabled, returns a response with full details in place of identifiers

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


### Authors

### Roles

### Locations

### Sessions

### Performances

### Interpretations
