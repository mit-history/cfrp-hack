---
layout: page
lang: fr
title: La Base de Données
nav_order: 2
parent: Les Registres des Recettes
grand_parent: Version Française
permalink: /fr/les-recettes/la-base-de-données.html

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

Dans certains cas, il est utile de comprendre la structure réelle de la base de données, en termes de tables, de colonnes et de relations.

Cette page est principalement destinée aux développeurs. Il sera plus courant de travailler avec les données via [l'API REST](api), plutôt qu'avec la base de données elle-même.

## Les Tableaux

Vous trouverez ci-dessous une liste des tableaux les plus pertinents de la base de données CFRP, avec la plupart de leurs champs pertinents. Les tables administratives, les colonnes d'horodatage et la plomberie similaire sont omises.

### Registers

```
|           Column           |            Type             |
|----------------------------|-----------------------------|
| id                         | integer                     |
| date                       | date                        |
| weekday                    | character varying(255)      |
| season                     | character varying(255)      |
| register_num               | integer                     |
| payment_notes              | text                        |
| page_text                  | text                        |
| total_receipts_recorded_l  | integer                     |
| total_receipts_recorded_s  | integer                     |
| representation             | integer                     |
| signatory                  | character varying(255)      |
| misc_notes                 | text                        |
| for_editor_notes           | text                        |
| ouverture                  | boolean                     |
| cloture                    | boolean                     |
| register_image_id          | integer                     |
| register_period_id         | integer                     |
| verification_state_id      | integer                     |
| irregular_receipts_name    | character varying(255)      |
| page_de_gauche             | character varying(255)      |
| date_of_left_page_info     | date                        |
| register_images_count      | integer                     |
| irregular_receipts_name_2  | character varying(255)      |
| irregular_receipts_name_3  | character varying(255)      |
| irregular_receipts_name_4  | character varying(255)      |
| irregular_receipts_name_5  | character varying(255)      |
| irregular_receipts_name_6  | character varying(255)      |
| irregular_receipts_name_7  | character varying(255)      |
| irregular_receipts_name_8  | character varying(255)      |
| irregular_receipts_name_9  | character varying(255)      |
| irregular_receipts_name_10 | character varying(255)      |
| total_receipts_recorded_d  | integer                     |
| _packed_id                 | integer                     |
```

### Plays

```
        Column         |            Type             |
-----------------------+-----------------------------+
 id                    | integer                     |
 author                | character varying(255)      |
 title                 | character varying(255)      |
 genre                 | character varying(255)      |
 acts                  | integer                     |
 prose_vers            | character varying(255)      |
 prologue              | boolean                     |
 musique_danse_machine | boolean                     |
 alternative_title     | character varying(255)      |
 url                   | character varying(255)      |
 date_de_creation      | date                        |
 expert_validated      | boolean                     |
 _packed_id            | integer                     |
 ```

### Register Plays

```
     Column       |            Type             |
------------------+-----------------------------+
id                | integer                     |
register_id       | integer                     |
play_id           | integer                     |
firstrun          | boolean                     |
newactor          | character varying(255)      |
actorrole         | character varying(255)      |
firstrun_perfnum  | integer                     |
ordering          | integer                     |
free_access       | boolean                     |
ex_attendance     | character varying(255)      |
ex_representation | character varying(255)      |
ex_place          | character varying(255)      |
reprise           | boolean                     |
debut             | boolean                     |
reprise_perfnum   | integer                     |

```

### Ticket Sales

```
      Column        |            Type             |
--------------------+-----------------------------+
id                  | integer                     |
total_sold          | integer                     |
register_id         | integer                     |
seating_category_id | integer                     |
price_per_ticket_l  | integer                     |
price_per_ticket_s  | integer                     |
recorded_total_l    | integer                     |
recorded_total_s    | integer                     |
price_per_ticket_d  | integer                     |
recorded_total_d    | integer                     |
```

### People

```
        Column          |            Type             |
------------------------+-----------------------------+
id                      | integer                     |
first_name              | character varying(255)      |
last_name               | character varying(255)      |
full_name               | character varying(255)      |
pseudonym               | character varying(255)      |
honorific               | character varying(255)      |
url                     | character varying(255)      |
alias                   | character varying(255)      |
societaire_pensionnaire | character varying(255)      |
dates                   | character varying(255)      |
```


### Register Images

```
      Column       |            Type             |
-------------------+-----------------------------+
id                 | integer                     |
filepath           | character varying(255)      |
user_id            | integer                     |
register_id        | integer                     |
image_file_name    | character varying(255)      |
image_content_type | character varying(255)      |
image_file_size    | integer                     |
image_updated_at   | timestamp without time zone |
orientation        | character varying(255)      |
```

### Register Periods

```
  Column   |            Type             |
-----------+-----------------------------+
id         | integer                     |
period     | character varying(255)      |
```

### Register Period Seating Categories

```
      Column        |       Type       |
--------------------+------------------+
id                  | integer          |
register_period_id  | integer          |
seating_category_id | integer          |
ordering            | integer          |

```

### Seating Categories

```
  Column    |            Type             |
------------+-----------------------------+
id          | integer                     |
name        | character varying(255)      |
description | character varying(255)      |
```

### Participations

```
     Column      |            Type             |
-----------------+-----------------------------+
id               | integer                     |
role             | character varying(255)      |
person_id        | integer                     |
debut            | boolean                     |
character        | character varying(255)      |
register_play_id | integer                     |

```

## Travailler avec une copie de la base de données

Il y a un vidage complet de la base de données, au format dumpfile compatible PostgreSQL [ici](/data/dump/cfrp-database.dump).

Avec un client Postgresql installé, vous pouvez exécuter des requêtes directement sur les données CFRP dans une seule table dénormalisée. Cela rend la collecte de nombreuses statistiques descriptives beaucoup plus simple.

NB: Ce fichier de vidage est un instantané de la base de données, à un moment donné, et n'est pas la version la plus récente de la base de données en direct; pour accéder aux données les plus récentes, veuillez vous référer à l '[API REST] (api).

Si vous utilisez Homebrew sur OS X, tapez la configuration 'brew install postgresql'. Sinon, consultez la [page PostgreSQL](http://www.postgresql.org/download/).

### Travailler avec les données dénormalisées

De là, vous avez accès à une vue de base de données appelée `cfrp`, avec une ligne pour chaque entrée de vente de billets dans les registres CF.

```
Column                  + Type                   |
------------------------+------------------------+
date                    | date                   |
cfrp_season             | text                   |
sold                    | integer                |
price                   | double precision       |
author_1                | character varying(255) |
title_1                 | character varying(255) |
genre_1                 | character varying(255) |
acts_1                  | integer                |
prose_vers_1            | character varying(255) |
prologue_1              | boolean                |
musique_danse_machine_1 | boolean                |
date_de_creation_1      | date                   |
author_2                | character varying(255) |
title_2                 | character varying(255) |
genre_2                 | character varying(255) |
acts_2                  | integer                |
prose_vers_2            | character varying(255) |
prologue_2              | boolean                |
musique_danse_machine_2 | boolean                |
date_de_creation_2      | date                   |
author_3                | character varying(255) |
title_3                 | character varying(255) |
genre_3                 | character varying(255) |
acts_3                  | integer                |
prose_vers_3            | character varying(255) |
prologue_3              | boolean                |
musique_danse_machine_3 | boolean                |
date_de_creation_3      | date                   |
ouverture_1             | boolean                |
cloture_1               | boolean                |
free_access_1           | boolean                |
firstrun_1              | boolean                |
firstrun_perfnum_1      | integer                |
reprise_1               | boolean                |
reprise_perfnum_1       | integer                |
newactor_1              | character varying(255) |
actorrole_1             | character varying(255) |
debut_1                 | boolean                |
ex_attendance_1         | character varying(255) |
ex_representation_1     | character varying(255) |
ex_place_1              | character varying(255) |
ouverture_2             | boolean                |
cloture_2               | boolean                |
free_access_2           | boolean                |
firstrun_2              | boolean                |
firstrun_perfnum_2      | integer                |
reprise_2               | boolean                |
reprise_perfnum_2       | integer                |
newactor_2              | character varying(255) |
actorrole_2             | character varying(255) |
debut_2                 | boolean                |
ex_attendance_2         | character varying(255) |
ex_representation_2     | character varying(255) |
ex_place_2              | character varying(255) |
ouverture_3             | boolean                |
cloture_3               | boolean                |
free_access_3           | boolean                |
firstrun_3              | boolean                |
firstrun_perfnum_3      | integer                |
reprise_3               | boolean                |
reprise_perfnum_3       | integer                |
newactor_3              | character varying(255) |
actorrole_3             | character varying(255) |
debut_3                 | boolean                |
ex_attendance_3         | character varying(255) |
ex_representation_3     | character varying(255) |
ex_place_3              | character varying(255) |
```

### Examples

_Combien de nuits dans chaque saison une pièce de Voltaire a-t-elle ouverte pour une pièce de Racine?_

```sql
    SELECT cfrp_season, COUNT(DISTINCT date) FROM cfrp
      WHERE author_1 ILIKE 'Voltaire%'
      AND author_2 ILIKE 'Racine%'
    GROUP BY cfrp_season
    ORDER BY cfrp_season
```

```
    cfrp_season | count
    -------------+-------
    1732-1733   |     1
    1735-1736   |     1
    1736-1737   |     1
    1741-1742   |     1
    1742-1743   |     1
    1743-1744   |     3
    1745-1746   |     1
    1756-1757   |     1
    1762-1763   |     1
    1770-1771   |     1
    1781-1782   |     2
    1782-1783   |     1
    1783-1784   |     1
    1784-1785   |     1
    1788-1789   |     1
    1789-1790   |     1
```

_Quels étaient les reçus de billets faibles, moyens et élevés par nuit pour chaque saison?_

Nous calculons d'abord le total des recettes par jour; puis re-grouper par saison.

```sql
    WITH temp AS(
      SELECT date, sum(sold * price) AS receipts FROM cfrp GROUP BY date
    ) SELECT cfrp_season,
             min(receipts) AS min_receipts,
             avg(receipts)::REAL AS mean_receipts,
             max(receipts) AS max_receipts
      FROM temp JOIN cfrp USING (date)
      GROUP BY cfrp_season
      ORDER BY cfrp_season
```

```
cfrp_season | min_receipts | mean_receipts | max_receipts
------------+--------------+---------------+--------------
1680-1681   |       118.25 |       655.838 |       1794.5
1681-1682   |       101.25 |       625.187 |       1951.5
1682-1683   |         82.5 |       653.483 |         2191
1683-1684   |           90 |       518.882 |         1468
1684-1685   |          120 |       533.038 |       1928.5
1685-1686   |         94.5 |        565.52 |       2200.5
1686-1687   |        121.5 |       560.988 |         2085
1687-1688   |           63 |        537.47 |       1609.5
1688-1689   |          114 |       515.759 |      1459.75
1689-1690   |        76.75 |       582.089 |       1942.5
1690-1691   |          114 |       562.934 |      2763.45
1691-1692   |        97.75 |       475.086 |         2367
1692-1693   |           55 |       509.444 |         1707
1693-1694   |         54.5 |       439.137 |      1710.75
1694-1695   |         68.5 |        503.27 |      1994.75
1695-1696   |           36 |        674.26 |       4331.5
1696-1697   |        61.25 |       584.902 |      1835.25
1697-1698   |           79 |       631.586 |         1882
1698-1699   |          135 |       801.608 |      2088.15
1699-1700   |         57.9 |       728.774 |       2279.1
...
```

## Plus d'infos

Vous trouverez utile la [documentation sur les requêtes PostgreSQL](http://www.postgresql.org/docs/9.5/static/sql-select.html), en particulier les sous-requêtes (ou CTE) et les partitions.
