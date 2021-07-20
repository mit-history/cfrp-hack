---
layout: page
lang: fr
title: La Base de Données
nav_order: 2
parent: Les Registres des Feux
grand_parent: Version Française
permalink: /fr/feux/base-de-données.html

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

Bien que [l'API REST](/fr/feux/api.html) donne accès aux données, l'accès direct à la base de données offre une plus grande flexibilité; il faut in certain niveau de compétences techniques pour pouvoir en tirer profit, donc cette page se destine surtout aux développeurs.

Il vaut la peine de noter que si vous cherchez les données les plus récentes, il est mieux de passer par l'API, qui s'alimente toujours de la dernière version des données. La copie de la base complète décris ci-dessous sera mis à jour beaucoup moins fréquemment.

Cette base, comme celle des recettes, témoigne d'un processus de développent en évolution continue afin de répondre aux besoins complexes et changeants des chercheurs. Elle compte par conséquence certains éléments qui fonctionnent tout à fait, mais qui auraient pu être faits différemments. On vous prie de la voir pour ce qu'elle est: un processus d'apprentissage. Une ressource plus raffiné est en cours de développement, mais on voulait quand même rendre accessible nos données entre temps. On vous demande également de nous pardonner le drôle de mélange d'anglais et de français; un projet bilingue ayant un vocabulaire bien particulier, on se trouve toujours un peu entre deux!

## Les tableaux

La base des feux compte deux groupes de tableaux. Le premier, ce sont les tableaux tirés de la [base des recettes](/fr/les-recettes/la-base-de-données.html), inclus afin de faciliter les requêtes, mais, pour la plupart, pas modifiés de façon importante. Les tableaux du deuxième groupe sont propres à la base des feux et décrivent les nouveautés qu’apportent les registres ces registres. Il vaut la peine de noter que, bien que les tableaux de la base des recettes informent sur l'intégralité de la période, les données des feux ne recouvrent que la période entre 1765 et 1793.

Les tableaux appartenant au premier groupe sont: [people](#people), [plays](#plays), [authorships](#authorships), [registers](#registers) et [register_plays](#register_plays). Les versions qui se trouvent dans la base des feux ont été légèrement modifiées.

Le deuxième groupe inclut: [acteurs](#acteurs), [personnages](#personnages), [feux](#feux), [lieux](#lieux), [feux_plays](#feux_plays) et [casting_records](#casting_registers).

### people

Ce tableau est tiré de la base de recettes et liste un certain nombre de comédiens et d’auteurs liés à la Comédie-Française, leur fonction indiquée pas les attributs boolean correspondants. Certains attributs ne sont pertinents que pour les auteurs  — notamment *bnf_notes*  — alors que l’attribut  *societaire_pensionnaire*, qui note leur [statut au sein de la troupe](https://www.comedie-francaise.fr/fr/fonctionnement-troupe), est propre aux comédiens.

**Clé primaire**&nbsp;: id

```
      Colonne           |          Type          |
------------------------+------------------------+
id                      | integer                |
first_name              | character varying(255) |
last_name               | character varying(255) |
pseudonym               | character varying(255) |
honorific               | character varying(255) |
alias                   | character varying(255) |
societaire_pensionnaire | character varying(255) |
dates                   | character varying(255) |
birthyear               | integer                |
deathyear               | integer                |
pref_label              | character varying(255) |
orig_label              | character varying(255) |
bnf_notes               | text                   |
ext_id                  | integer                |
is_actor                | boolean                |          
is_author               | boolean                |
```


### plays

Bien que ce tableau provient originellement de la base des recettes, la version de la base des feux est plus complète. La liste originale, constituée lors de la saisie des données des registres des recettes, compte presque uniquement les pièces jouées à Paris. Cette liste inclut davantage celles jouées lors des voyages à la cour et à la campagne.

**Clé primaire**&nbsp;: id

```
      Colonne         |            Type             |
----------------------+-----------------------------+
id                    | integer                     |
author                | character varying(255)      |
title                 | character varying(255)      |
genre                 | character varying(255)      |
acts                  | integer                     |
prose_vers            | character varying(255)      |
prologue              | boolean                     |
musique_danse_machine | boolean                     |
alternative_title     | character varying(255)      |
date_de_creation      | date                        |
```

### authorships

Ce tableau associe chaque pièce à un ou plusieurs auteurs.

**Clé primaire**&nbsp;: id
**Clés étrangères**&nbsp;: ext_id (people), play_id (plays)

```
Colonne |  Type   |
--------+---------+
id      | integer |
play_id | integer |
ext_id  | integer |
```

### registers

Ce tableau est également piqué de la base des recettes, afin de faciliter des interrogations qui visent à mettre en relation la distribution et les recettes. Chaque rangée offre des détails sur une seule séance (et donc sur une date unique). La fonction « en_livres » sert à simplifier les calculs; elle peut convertir les trois valeurs relatives à la devise de l’époque  (total_receipts_recorded_livres, total_receipts_recorded_sols et total_receipts_recorded_deniers)  en un seul chiffre exprimer en *livres* (chaque *livre* fait 20 *sols* et chaque *sol* fait 12 *deniers*).

L’attribut « représentation » fait appel aux notes dans les registres indiquant que la séance était la n<sup>e</sup> représentation de la saison.

L'attribut « signatory » désigne le semainier — le membre de la troupe chargé ce jour là de vérifier les comptes, qui signait son nom en bas de la page.

**Clé primaire**&nbsp;: id  

```
        Colonne            |            Type             |
---------------------------+-----------------------------+
id                         | integer                     |
date                       | date                        |
weekday                    | character varying(255)      |
season                     | character varying(255)      |
register_num               | integer                     |
payment_notes              | text                        |
page_text                  | text                        |
total_receipts_recorded_l  | integer                     |
total_receipts_recorded_s  | integer                     |
representation             | integer                     |
signatory                  | character varying(255)      |
misc_notes                 | text                        |
for_editor_notes           | text                        |
ouverture                  | boolean                     |
cloture                    | boolean                     |
irregular_receipts_name    | character varying(255)      |
irregular_receipts_name_2  | character varying(255)      |
irregular_receipts_name_3  | character varying(255)      |
irregular_receipts_name_4  | character varying(255)      |
irregular_receipts_name_5  | character varying(255)      |
irregular_receipts_name_6  | character varying(255)      |
irregular_receipts_name_7  | character varying(255)      |
irregular_receipts_name_8  | character varying(255)      |
irregular_receipts_name_9  | character varying(255)      |
irregular_receipts_name_10 | character varying(255)      |
total_receipts_recorded_d  | integer                     |
```

### register_plays

On jouait typiquement deux pièces par séance à la Comédie-Française (parfois un, rarement trois). Les rangées de ce tableau sont des représentations de pièces individuelles; elles associent chacune une pièce à une séance (et donc à une date). L’attribut « ordering » renseigne sur l'ordre dans lequel on a joué les pièces.

Avant l'avènement des registres des feux, on notait parfois des débuts des comédiens (l’attribut « newactor ») et certaines représentations de rôles remarquables (l’attribut « actorrole »). Les représentations ayant eu lieu pendant la période de création ou de reprise d’une pièce sont signalées par les attributs boolean correspondants.

**Clé primaire**&nbsp;: id  
**Clés étrangères**&nbsp;: register_id (registers), play_id (plays)

```
     Colonne      |           Type              |
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

### acteurs

Ce tableau dresse la liste des comédiens et comédiennes de la troupe. Composée en partie avant, et en partie pendant, la saisie des registres des feux, elle inclut des acteurs et des actrices actifs et actives antérieur à la période des feux, aussi bien que ceux et celles qui jouent entre 1765 et 1793.

Comme dans le tableau des personnes, le champ « status_osp » désigne la position de chaque comédien ou comédienne au sein de la société. Seulement les sociétaires ont des dates d’entrée, de sociétariat et de départ. Certains autres attributs doublent des colonnes dans le tableau des personnes, mais sont plus détaillées/à jour. L’attribut « pseudonym_number » sert à différencier des comédiens ou comédiennes du même genre qui partagent un nom et manquent d’autres caractéristiques permettant de les distinguer l’un de l’autre&nbsp;; il est souvent employé dans le cas des familles de comédiens.

**Clé primaire**&nbsp;: id  
**Clé étrangère**&nbsp;: people_id (people)


```
    Colonne      |          Type          |
-----------------+------------------------+
id               | integer                |
people_id        | integer                |
pseudonym        | character varying(100) |
pseudonym_number | integer                |
honorific        | character varying(50)  |
last_name        | character varying(200) |
first_name       | character varying(200) |
alias            | text                   |
status_osp       | character varying(5)   |
entree           | integer                |
societariat      | integer                |
depart           | integer                |
debut            | integer[]              |
notes            | text                   |
```

### personnages

Ce tableau dresse la liste de personnages pour chaque pièce dont on donne la distribution dans les registres des feux. L'attribut « genre » renvoie à une donnée endogène — chaque personnage est indiqué dans les registres comme étant masculin (*Mrs.*) ou féminin (*Mes.*).

**Clé primaire**&nbsp;: id  
**Clé étrangère**&nbsp;: play_id (plays)

```

Colonne |          Type          |
--------+------------------------+
id      | integer                |  
nom     | character varying(100) |  
play_id | integer                |  
genre   | character varying(5)   |  
```

### feux

Dans le style du tableau « registers » dans la base des recettes, chaque entrée dans ce tableau représente une page dans les registres des feux et donne donc des détails sur une séance (et, par conséquent, une date) unique. Cela dit, ce tableau compte un certain nombre de dates qui ne sont pas présentes dans la base des registres en raison du fait que la représentation a eu lieu hors de la salle de la Comédie-Française; c’est pour cette raison qu’existe l’attribut « perf_date ».

Les données de la colonne « notes » sont des notes de chercheurs alors que les « annotations » correspondent à du texte des manuscrits mêmes.


**Clé primaire**&nbsp;: id  
**Clé étrangère**&nbsp;: register_id (registers)

```
  Colonne    |  Type   |
-------------+---------+
id           | integer |
perf_date    | date    |
notes        | text    |
annotations  | text    |
register_id  | integer |
```

### lieux

Entre 1680 et 1793 la troupe occupe [quatre salles différentes](https://www.cfregisters.org/#!/encyclopedie/chantier/s/salles): l’Hôtel Guénégaud (1680-1689), la Salle de la rue des Fossées-Saint-Germain-des-Près (1689-1770), la Salle des Machines au Palais des Tuileries (1770-1782) et le Théâtre de l’Odéon (1782-1793). Pourtant, les comédiens ont donné un certain nombre de représentations dans ailleurs — à la cour, à la campagne, etc.&nbsp;; ce tableau liste ces lieux extraordinaires.  Le choix s’est fait de préserver le même niveau de granularité que les manuscrits, donc certaines entrées sont assez similaires.

**Clé primaire**&nbsp;: id  

```
Colonne |  Type   |
--------+---------+
id      | integer |
nom     | text    |
```

### feux_plays

Ce tableau double, de quelque sorte, le tableau « register_plays » de la base des recettes, en ce qu’il associe des pièces à des soirées et donc à des dates. Pourtant, il existe quelques contradictions entre les deux collections de registres qui sont qui sont reflétées dans les données. Ce plus les données de la base des feux sont plus complètes en regard des représentations n’ayant pas eu lieu à Paris.

**Clé primaire**&nbsp;: id  
**Clés étrangères**&nbsp;: feux_id (feux), play_id (plays), lieu_id (lieux)

```
Colonne |  Type   |
--------+---------+
id      | integer |
feux_id | integer |
play_id | integer |
lieu_id | integer |
```

### casting_records

Dans ce tableau, qu’on pourrait bien dire le tableau le plus important de la base des feux, les entrées représentent chacune l’interprétation d’un rôle précis par un comédien précis lors d’une séance précise.

Parfois on ne connaît que la distribution, et d'autres fois on ne liste que les comédiens, donc il est possible qu’une rangée manque une valeur pour soit l’attribut « actor_id » soit le champ « role_id » (jamais les deux). Les distributions de certaines pièces ont évolué au cours des années, donc il est possible que pas toutes les rôles soient remplies lors de chaque représentation dans que la distribution soit considérée incomplète - les cas ou la distribution manque véritablement du détail sont notés dans la colonne « notes » dans le tableau « feux ».

 Les valeurs des attributs « debut » et « reprise » sont des données endogènes qui correspondent aux endroits dans les registres où on a noté le début d’un comédien (souvent plusieurs fois de suite lors de leur période de début, qui durait environ quinze jours) ou la reprise d’un ancien rôle.

Les noms des comédiens sont parfois écrits au centre de la page, au lieu d’être calés à droite (on ne sait pas trop pourquoi); cette information est notée dans la colonne « in_middle »

**Clé primaire**&nbsp;: id    
**Clés étrangères**&nbsp;: feux_play_id (feux_plays), role_id (personnages), actor_id (acteurs)

```
  Colonne    |  Type   |
-------------+---------+
id           | integer |
role_id      | integer |
feux_play_id | integer |
actor_id     | integer |
debut        | boolean |
reprise      | boolean |
in_middle    | boolean |
```

## Téléchargement

Vous pouvez télécharger [ici](/data/dump/feux_public_19-07-2021.dump) une copie de la base sous forme de fichier « dump » .

Afin de simplifier autant que possible, ce fichier ne se sert pas du format comprimé propre à postgres; pour reconstituer la base, il suffit donc d'effectuer les commandes suivantes à partir de l’interface en ligne de commande.

*(Ces étapes supposent que vous avez déjà postgres installé sur votre ordinateur. Si cela n’est pas le cas, voyez d'abord [cette page](https://www.postgresql.org/download/))*


**En tant qu’utilisateur ayant des permissions suffisantes**:
<br/><br/>
**1.** Créez d’abord une base de données vide (vous pouvez l'appeler comme vous voulez)

  ```
  create_db [nom de la base]
  ```
  Si vous préférez de ce faire à partir de l’ICL de postgres, la commande

  ```
  create database [nom de la base];
  ```
  donne la même chose.

<br/>
**2.** Téléchargez le fichier « dump » (si vous ne l'aviez déjà pas fait) et assurez-vous qu'il « appartient » au même utilisateur ayant accès à postgres.

<br/>

**3.** Importez les données dans la base nouvellement créée

  ```
  psql [nom de la base] < [chemin d'accès du ficher dump]
  ```
Si vous connaissez bien postgres et vous préférez vous servir de la commande [pg_restore](https://www.postgresql.org/docs/current/app-pgrestore.html), vous pouvez télécharger une version des données dans le format que demande cette méthode [ici](/data/dump/feux_public_restore_format_19-07-2021.dump).


## Quelques exemples

**En interrogeant la base des feux, il faut absolument ne pas oublier que les résultats ne portent que sur la période entre 1765 et 1793**  
À noter: Certains « join » dans les requêtes suivantes ne sont pas strictement nécessaires, mais sont pourtant inclus afin d'augmenter la lisibilité des résultats (en affichant du texte à la place des identifiants).

<br/>
*Qui sont les cinq comédiens ou comédiennes qui ont le plus représenté des pièces de Voltaire ?*

```sql
select acteurs.*, count(*) as cnt from casting_records join feux_plays on feux_play_id = feux_plays.id join authorships on authorships.play_id = feux_plays.play_id join acteurs on actor_id = acteurs.id
where ext_id = 5
group by acteurs.id
order by cnt desc
limit 5
```

résultat:

```
id |people_id|pseudonym|pseudonym_number|honorific|last_name               |first_name       |alias   |status_osp|entree|societariat|depart|debut|notes|cnt|
---+---------+---------+----------------+---------+------------------------+-----------------+--------+----------+------+-----------+------+-----+-----+---+
 62|      377|Brizard  |               0|Monsieur |Britard, dit            |Jean-Baptiste    |        |S         |  1757|       1758|  1786|{}   |     |582|
460|      772|Vanhove  |               0|Monsieur |Vanhove                 |Charles-Joseph   |Van Hove|S         |  1777|       1779|  1803|{}   |     |489|
115|      434|Dauberval|               0|Monsieur |Bercher, dit            |Etienne-Dominique|        |S         |  1760|       1762|  1780|{}   |     |489|
446|      758|Suin     |               0|Madame   |Vriot, épouse Suin, dite|Marie-Denise     |        |S         |  1775|       1776|  1804|{}   |     |469|
154|      472|Dorival  |               0|Monsieur |Thierret, dit           |Jean-Louis       |        |S         |  1776|       1779|  1791|{}   |     |442|
```

<br/>
*Quelles pièces a-t-on représenté le plus souvent à Versailles ?*

```sql
select title, author, count(*) as cnt from feux_plays join plays on play_id = plays.id
where lieu_id = 1
group by plays.id
order by cnt desc
```

résultat:

```
title                                       |author                                        |cnt|
--------------------------------------------+----------------------------------------------+---+
Esprit de contradiction (L')                |Du Fresny (Charles)                           | 11|
Tuteur amoureux (Le) ou Le Tuteur           |Dancourt (Florent Carton dit)                 | 10|
Précieuses ridicules (Les)                  |Molière (Jean-Baptiste Poquelin dit)          |  9|
Cinna ou la Clémence d'Auguste              |Corneille (Pierre)                            |  9|
Impromptu de campagne (L')                  |Poisson (Philippe)                            |  8|
Cercle ou la Soirée à la mode (Le)          |Poinsinet (Antoine-Alexandre-Henri)           |  8|
Esprit follet ou la Dame invisible (L')     |Hauteroche (Noël Lebreton, sieur de)          |  8|
Phèdre et Hippolyte ou Phèdre               |Racine (Jean)                                 |  8|
Crispin rival de son maître                 |Lesage (Alain-René)                           |  8|
Étourdi ou les Contretemps (L')             |Molière (Jean-Baptiste Poquelin dit)          |  8|
Somnambule (Le)                             |Pont-de-Veyle (Antoine de Fériol, comte de)   |  8|
...
```


<br/>

*Quels sont tous les rôles de Mademoiselle Dumesnil ?*

```sql
select distinct personnages.id, nom, title, personnages.genre from personnages join casting_records on casting_records.role_id = personnages.id join plays on play_id = plays.id
where actor_id = 191
```

résultat:


```
id  |nom                |title                                                                          |genre|
----+-------------------+-------------------------------------------------------------------------------+-----+
   4|Phèdre             |Phèdre et Hippolyte ou Phèdre                                                  |Mes. |
  63|Mme. Adam          |Joueur (Le)                                                                    |Mes. |
  64|Mme. La Ressource  |Joueur (Le)                                                                    |Mes. |
  86|Ismène             |Babillard (Le)                                                                 |Mes. |
 186|Mme. Argante       |Légataire universel (Le)                                                       |Mes. |
 212|Hermione           |Andromaque                                                                     |Mes. |
 252|Mérope             |Mérope                                                                         |Mes. |
 276|Oriane             |Mercure galant (Le) ou la Comédie sans titre / La Pièce sans titre (titre alt.)|Mes. |
 295|Léontine           |Héraclius, empereur d'Orient                                                   |Mes. |
 353|Émilie             |Cinna ou la Clémence d'Auguste                                                 |Mes. |
 458|La Gouvernante     |Gouvernante (La)                                                               |Mes. |
 ...
```

<br/>

*Quelle actrice a joué le rôle éponyme lors de la représentation la plus rentable de Phèdre de entre 1770 et 1790 ?*

```sql
select acteurs.* from casting_records join feux_plays on feux_play_id = feux_plays.id join feux on feux_id = feux.id join registers on register_id = registers.id join acteurs on actor_id = acteurs.id
where role_id = 4 and extract(year from date)>1769 and extract(year from date)<1791
order by en_livres(total_receipts_recorded_l, coalesce(total_receipts_recorded_s, 0), coalesce(total_receipts_recorded_d, 0)) desc
limit 1
```

résultat:

```
id |people_id|pseudonym|pseudonym_number|honorific   |last_name       |first_name                        |alias  |status_osp|entree|societariat|depart|debut|notes|
---+---------+---------+----------------+------------+----------------+----------------------------------+-------+----------+------+-----------+------+-----+-----+
407|      719|Raucourt |               0|Mademoiselle|Saucerotte, dite|Françoise-Marie-Antoinette-Josèphe|Raucour|S         |  1772|       1779|  1815|{}   |     |
```

<br/>

*Quels sont les dix couples de comédiens/comédiennes qui ont le plus souvent parut ensemble sur scène?*


```sql
select honorific1, pseudo1, honorific2, pseudo2 from casting_records t1 join casting_records t2 on t1.feux_play_id = t2.feux_play_id and t1.actor_id > t2.actor_id
join (select a1.id as id1, a1.honorific as honorific1, a1.pseudonym as pseudo1, a2.id as id2, a2.honorific as honorific2, a2.pseudonym as pseudo2 from acteurs a1, acteurs a2 ) as t3
on t1.actor_id = id1 and t2.actor_id = id2
group by honorific1, pseudo1, honorific2, pseudo2
order by count(*) desc
limit 10
```

résultat:

```
honorific1  |pseudo1     |honorific2|pseudo2  |
------------+------------+----------+---------+
Monsieur    |Bouret      |Monsieur  |Bellemont|
Mademoiselle|Lachassaigne|Monsieur  |Bellemont|
Monsieur    |Dugazon     |Monsieur  |Bellemont|
Monsieur    |Courville   |Monsieur  |Bellemont|
Monsieur    |Marchand    |Monsieur  |Bellemont|
Monsieur    |Préville    |Monsieur  |Bouret   |
Monsieur    |Bouret      |Monsieur  |Augé     |
Mademoiselle|Doligny     |Monsieur  |Bouret   |
Mademoiselle|Lachassaigne|Monsieur  |Bouret   |
Monsieur    |Bellemont   |Monsieur  |Augé     |
```

Si vous pouvez vous contenter de ne d'abord chercher que les identités et de trouver les noms dans un deuxième temps, la requête se simplifie beaucoup.

```sql
select t1.actor_id, t2.actor_id from casting_records t1 join casting_records t2 on t1.feux_play_id = t2.feux_play_id
where t1.actor_id > t2.actor_id
group by t1.actor_id, t2.actor_id
order by count(*) desc
limit 10
```

résultat:

```
actor_id|actor_id|
--------+--------+
      57|      37|
     303|      37|
     188|      37|
      95|      37|
     344|      37|
     395|      57|
      57|      10|
     147|      57|
     303|      57|
      37|      10|
```
