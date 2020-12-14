---
layout: default
lang: fr
nav_order: 1
title: l'API
parent: Les Registres des Recettes
grand_parent: Version Française
permalink: /fr/recettes/api.html
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

Cette API est la méthode préférée pour travailler avec les données RCF. Il fournit un accès en lecture seule aux données en direct.

Il existe un seul point de terminaison d'API REST pour chaque table et chaque vue de la base de données. Chacun de ces points de terminaison permet d'accéder aux données de cette table, au format JSON.

### Points de terminaison

Voici une liste complète des points de terminaison de l'API REST (que vous noterez, correspondent aux [tables dans la base de données](/fr/les-recettes/la-base-de-données.html#les-tableaux)):

- amalgamated_sales
- participations
- people
- performances
- performances_with_totals
- play_ticket_sales
- plays
- plays_with_totals
- register_images
- register_period_seating_categories
- register_periods
- register_plays
- registers
- sales_by_date
- seating_categories
- ticket_sales
- ticket_sales_by_profile


Un ensemble préfabriqué de requêtes peut être téléchargé comme décrit sous [#tools](#tools).

Les [Auteurs](https://api.cfregisters.org/people?is_author=eq.true) sont désormais également stockés séparément, et sont liés aux lectures via une table de "jointure", qui est une structure plus conventionnelle pour ce type de base de données. Il existe quelques exemples de ces données «héritées», qui n'ont pas été supprimées, car les versions précédentes de certains outils dépendent de ces champs.

### Comment créer une requête vers cette API

La visite de [http://api.cfregisters.org/](http://api.cfregisters.org/) renvoie une liste de tous les points de terminaison disponibles (voir un extrait ci-dessous).

Installez un [navigateur API](#outils) et explorez les données de chaque tableau.

Une fois que vous avez décidé des données qui vous intéressent, vous pouvez obtenir tous les données en visitant le point de terminaison de cette table.

Par exemple, l'envoi d'une requête `OPTIONS` au point de terminaison `/play` renvoie une liste des colonnes disponibles; une requête GET à [ce même point de terminaison](http://api.cfregisters.org/plays) renvoie les données au format JSON.

Vous pouvez également filtrer ces données en fonction de n'importe quel champ de cette table, exclure des champs qui ne vous intéressent pas ou même imbriquer des données de tables associées dans une requête.

Un exemple de cette syntaxe est ci-dessous: une requête pour les auteurs:

```
https://api.cfregisters.org/people?is_author=eq.true
```

Puisque la table `people` inclut à la fois des acteurs et des auteurs, nous filtrons les résultats de notre requête sur cette table, en spécifiant que nous ne voulons que les données pour lesquels la valeur du champ `is_author` est `true`. Nous faisons cela en envoyant notre requête au point de terminaison `/people`, avec la clé de paramètre de requête `is_author`, et en passant la valeur `eq.true` avec cette clé. Les autres paramètres de requête disponibles incluent `gt`, `lt`, pour «supérieur à» et «inférieur à» (comparaisons quantitatives), `neq` pour «pas égal à», etc. La liste complète est disponible [ici](https://postgrest.org/en/v7.0.0/api.html#operators).

Ces paramètres peuvent être liés avec `&` si vous souhaitez filtrer par plus d'un champ à la fois. Il existe également des opérateurs `and` et `or` (et/ou). Ensemble, ce syntaxe rendent l'interface de requête assez flexible et puissante.

La documentation de la syntaxe pour les requêtes plus complexes est disponible sur le site Web de "[PostgREST](http://postgrest.org/en/v5.0.0/api.html#)", un framework d'API dont le nom est un portmanteau pour "PostgreSQL" (la base de données que nous utilisons) et "REST" (l'architecture d'API largement utilisée que nous avons adoptée).

## Tools

### JSON View

[JSONView pour Chrome](https://chrome.google.com/webstore/detail/jsonview/chklaanhfefbnpoihckbnefhakgolnmc) rends les responses JSON dans un format convivial.

### Postman

Postman est un navigateur d'API REST.

1. [Installer Postman](https://www.getpostman.com)
2. Importez [cette collection de requêtes API](https://www.getpostman.com/collections/75eb47f4dd961830b5b9) dans Postman.
3. Expérimentez avec les demandes de la collection

Une fois Postman installé, vous pouvez également utiliser ce bouton pour importer la collection d'exemples de demandes.

<div class="postman-run-button" data-postman-action="collection/import" data-postman-var-1="75eb47f4dd961830b5b9"></div>
<script type="text/javascript">
  (function (p,o,s,t,m,a,n) {
    !p[s] && (p[s] = function () { (p[t] || (p[t] = [])).push(arguments); });
    !o.getElementById(s+t) && o.getElementsByTagName("head")[0].appendChild((
      (n = o.createElement("script")),
      (n.id = s+t), (n.async = 1), (n.src = m), n
    ));
  }(window, document, "_pm", "PostmanRunObject", "https://run.pstmn.io/button.js"));
</script>
