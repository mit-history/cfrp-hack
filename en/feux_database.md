---
layout: page
lang: en
title: Database
nav_order: 2
parent: Casting Registers
grand_parent: English Version
permalink: /en/casting/database.html

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

While the [API](/en/casting/api.html) grants access to the full scope of the data, direct access to the database offers greater flexibility. The technical descriptions that follow are primarily targeted at developers and therefore assume a certain base level of knowledge of databases.

It is worth noting that if you are looking for the most up to date version of the data, it is recommended that you use the API. The database dump made available here is not updated as frequently.

Much like the receipts database, the casting database is the result of a continuous development process, constantly evolving to suit the changing  needs of the researchers and to adapt to quirks in the data; while the current instantiation is perfectly functional, some different structural choices could have been made. We ask that you  view the database schema for what it is: evidence of a learning process. We are currently in the process of creating a more refined version of our data access mechanisms but, in the meantime, we still wanted to provide access to the casting data. Finally, we ask you to please forgive our quirky naming ‘conventions’ (in the loosest sense of the term); as a bilingual project reliant on a good deal of domain specific jargon, we have a tendency to throw around rather a lot of ‘franglais’!

## Tables

The casting database is composed of two distinct groups of tables. The first are those taken directly from the [receipts database](/en/receipts/database.html), included so as to simplify queries but, for the most part, not significantly modified. The second group of tables describe *feux* register specific phenomena and are unique to the casting database.

The first group of tables includes:[people](#people), [plays](#plays), [authorships](#authorships), [registers](#registers), and [register_plays](#register_plays). The versions of these tables found in the casting database are somewhat simplified

The tables belonging to the second group are: [acteurs](#acteurs), [personnages](#personnages), [feux](#feux), [lieux](#lieux), [feux_plays](#feux_plays), and [casting_records](#casting_registers).

### people

This table, taken from the receipts database,  lists known people connected in some way to the Comédie-Française — principally actors and authors ( as denoted by the corresponding boolean attributes). The 'societaire_pensionnaire' field only applies to actors, indicating [their status as a member of the company](https://www.comedie-francaise.fr/en/how-it-works). The 'bnf_notes' field is only relevant for authors.

**Primary** key: id


```
       Column           |          Type          |
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

Though initially taken from the receipts database, the casting database version of this table is more complete. Unlike the receipts registers from which the original list was derived, the casting registers are not limited to performances in the Paris venues, but also list plays performed on trips to the country or to court.

**Primary key**: id

```
       Column         |            Type             |
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

This table links each play to its author(s).

**Primary key**: id  
**Foreign keys**:  ext_id (people), play_id (plays)

```
 Column |  Type   |
--------+---------+
id      | integer |
play_id | integer |
ext_id  | integer |
```

### registers

Another table ported over from the receipts database, so as to facilitate interrogations linking casting and revenue; each entry gives details pertaining to a single date.

So as to simplify calculations, the ‘en_livres’ function can be used to convert the three currently values (total_receipts_recorded_livres, total_receipts_recorded_sols, and total_receipts_recorded_deniers) to a single value expressed in *livres* (there are 20 *sols* to a *livre* and 12 *deniers* to a *sol*).

The 'representation' field reflects notes in the registers that it was the n<sup>th</sup> performance of the season.

The 'signatory' (*semainier* in French) is the company member who verified the sums and signed off on the register.

**Primary key**: id  


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

Typically, two plays were performed each day at the Comédie-Française (though sometimes only one and, on rare occasions, three). Each row in this table maps to a performance of an individual play, linking plays to sessions (dates). The ‘ordering’ field notes the order in which the plays were performed.

Before the casting information was recorded in a discrete register, actor debuts (the ‘newactor’ field) and notable portrayals of specific roles (the ‘actorrole’ filed) were occasionally noted in the receipts registers. Performances which took place during a play’s original run or revival are flagged by the corresponding boolean attributes (debut and reprise respectively).

**Primary key**: id  
**Foreign keys**: register_id (registers), play_id (plays)

```
     Column       |           Type              |
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

This list of the Comédie-Française actors, constructed in part before and expanded during the transcription of the *feux* data,  includes performers appearing prior to 1765, as well as those who tread the boards during the period covered by the casting registers (1765-1793).

As is the case with the ‘people’ table, the ‘status_osp’ column describes each actor’s relationship to the company, and only entries for full company members (*sociétaires*) have values for ‘entree’, ‘societariat’, and ‘depart’. Some columns do double up on those found in the people ‘table’, but their values are more detailed/up to date. The purpose of the ‘pseudonym_number’ field is to differentiate between actors with the same name and honorific and who lack any other distinguishing characteristics; it’s most often used in the case of families of actors.

**Primary key**: id  
**Foreign key**: people_id (people)

```
     Column      |          Type          |
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

This table lists all the characters for each play whose role breakdown appeared in the casting registers. The values in the ‘genre’ (gender)  column is endogenous — in the *feux*, each role was listed as being either male (*Mrs.*) or female (*Mes.*).

**Primary key**: id  
**Foreign key**: play_id (plays)

```
 Column |          Type          |
--------+------------------------+
id      | integer                |  
nom     | character varying(100) |  
play_id | integer                |  
genre   | character varying(5)   |  
```

### feux

Following in the same pattern as the ‘registers’ table in the receipts database, each entry in this table maps to a page in the *feux* registers, detailing a single session’s (and thus a single date’s) performances. That said, this table also includes dates that were not covered in the recipes registers by virtue of the fact that the performances took place outside of the company’s regular theatre; these gaps are the reason for the ‘perf_date’ field.

The ‘notes’ field contains researcher notes while the ‘annotations’ correspond to text from the manuscripts themselves.

**Primary key**: id  
**Foreign key**: register_id (registers)

```
   Column    |  Type   |
-------------+---------+
id           | integer |
perf_date    | date    |
notes        | text    |
annotations  | text    |
register_id  | integer |
```

### lieux

Between 1680 at 1793 the troupe occupied [four different venues](https://www.cfregisters.org/#!/encyclopedie/chantier/v/venues): Hôtel Guénégaud (1680-1689), the Salle de la rue des Fossées-Saint-Germain-des-Près (1689-1770), the Salle des Machines in the Palais des Tuileries (1770-1782) and the Théâtre de l’Odéon (1782-1793). However, a number of performances were given outside of these main locations — at court, at country estates, etc.; this table lists all of those external venues. The table preserves the level of granularity present in the registers, so some entries are fairly similar.

**Primary key**: id  

```
 Column |  Type   |
--------+---------+
id      | integer |
nom     | text    |
```

### feux_plays

To a certain degree, this table replicates the ‘register_plays’ table in the receipts database, in that it also associates plays with sessions (and thus dates). However, there are contradictions that exist between the two register sets which are reflected in the data. The data in the casting database is also more complete than that in the receipts database with respect to performances outside of the Paris theatres.

**Primary key**: id  
**Foreign keys**: feux_id (feux), play_id (plays), lieu_id (lieux)

```
 Column |  Type   |
--------+---------+
id      | integer |
feux_id | integer |
play_id | integer |
lieu_id | integer |
```

### casting_records

Each row in the ´casting_records’ table, which one could easily qualify as the most important table of the *feux* database, describes the performance of a specific role, by a specific actor, in the course of a specific evening.

Sometimes only the names of the characters are given, other times only the actors are known, so it is possible for either the ´actor_id’ or ‘role_id’ field to be null (but never both). Additionally, the cast of characters of some plays evolved over time, so it’s also possible for not all of the roles that exist to be filled each performance, without the data being considered incomplete. Cases where the information in the registers truly is only partial are noted in the ‘notes’ field in the ‘feux’ table.

The data populating the ‘debut’ and ‘reprise’ columns is endogenous — the values map to instances where an actor’s debut or their reprisal of a role was noted in the registers. The debut of a given actor is sometimes flagged multiple performances in a row as an actor’s debut period typically lasted about two weeks.

Occasionally, actors’ names are written in the middle of the page rather than along the right hand side; though we’re not currently sure why (or if it’s even significant), these instances are noted in the ‘in_middle’ column.

**Primary key**: id  
**Foreign keys**: feux_play_id (feux_plays), role_id (personnages), actor_id (acteurs)

```
   Column    |  Type   |
-------------+---------+
id           | integer |
role_id      | integer |
feux_play_id | integer |
actor_id     | integer |
debut        | boolean |
reprise      | boolean |
in_middle    | boolean |
```

## Download

A copy of the database ( dumpfile) is available [here](/data/dump/feux_public_19-07-2021.dump). So as simplify as much as possible, this version of the download *does not* use the postgres specific compressed dump format. The following instructions describe how to use this file to create a local copy of the database via postgres’ command line interface.

*(The steps described below assume that you already have postgres installed on your machine. If that’s not the case, you should [do that first](https://www.postgresql.org/download/))*

**As a user with the appropriate permissions**:
<br/><br/>
**1.** Create an empty database (you can call it whatever you like)

  ```
  	create_db [database name]
  ```
  If you prefer to complete this step via the CLI, the command

  ```
  create database [database name]
  ```
  accomplishes the same thing.  

<br/>
**2.** Download the dumpfile (if you haven’t already done so) and make sure it is owned by the user with postgres permissions.

<br/>
**3.** Import the data into the newly created database

  ```
  psql [database name] < [path to dumpfile]
  ```

If you already have some familiarity with postgres dumps and prefer to use [pg_restore](https://www.postgresql.org/docs/current/app-pgrestore.html) you can download a version of the data in the required format [here](/data/dump/feux_public_restore_format_19-07-2021.dump).


## Examples

**It’s important to always remember when working with the feux data that the results only pertain to the period between 1765 and 1793.**  
Note: there are some joins in the below examples that aren’t strictly required, but are included for the sake of clarity (i.e. to show text rather than identifiers).


<br/>

*Who are the five actors or actresses who most frequently appeared in performances of Voltaire’s plays?*

```sql
select acteurs.*, count(*) as cnt from casting_records join feux_plays on feux_play_id = feux_plays.id join authorships on authorships.play_id = feux_plays.play_id join acteurs on actor_id = acteurs.id
where ext_id = 5
group by acteurs.id
order by cnt desc
limit 5
```

result:

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
*Which plays were most frequently performed at Versailles?*

```sql
select title, author, count(*) as cnt from feux_plays join plays on play_id = plays.id
where lieu_id = 1
group by plays.id
order by cnt desc
```


result:

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
*What roles did Mademoiselle Dumesnil play?*

```sql
select distinct personnages.id, nom, title, personnages.genre from personnages join casting_records on casting_records.role_id = personnages.id join plays on play_id = plays.id
where actor_id = 191
```

result:

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

*Which actress played the titular role during the most profitable performance of Phèdre between 1770 and 1790?*

```sql
select acteurs.* from casting_records join feux_plays on feux_play_id = feux_plays.id join feux on feux_id = feux.id join registers on register_id = registers.id join acteurs on actor_id = acteurs.id
where role_id = 4 and extract(year from date)>1769 and extract(year from date)<1791
order by en_livres(total_receipts_recorded_l, coalesce(total_receipts_recorded_s, 0), coalesce(total_receipts_recorded_d, 0)) desc
limit 1
```

result:

```
id |people_id|pseudonym|pseudonym_number|honorific   |last_name       |first_name                        |alias  |status_osp|entree|societariat|depart|debut|notes|
---+---------+---------+----------------+------------+----------------+----------------------------------+-------+----------+------+-----------+------+-----+-----+
407|      719|Raucourt |               0|Mademoiselle|Saucerotte, dite|Françoise-Marie-Antoinette-Josèphe|Raucour|S         |  1772|       1779|  1815|{}   |     |
```

<br/>

*Who are the ten pairs of performers who most frequently appeared together on stage?*


```sql
select honorific1, pseudo1, honorific2, pseudo2 from casting_records t1 join casting_records t2 on t1.feux_play_id = t2.feux_play_id and t1.actor_id > t2.actor_id
join (select a1.id as id1, a1.honorific as honorific1, a1.pseudonym as pseudo1, a2.id as id2, a2.honorific as honorific2, a2.pseudonym as pseudo2 from acteurs a1, acteurs a2 ) as t3
on t1.actor_id = id1 and t2.actor_id = id2
group by honorific1, pseudo1, honorific2, pseudo2
order by count(*) desc
limit 10
```

result:

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

If you’re content to initially just work with ids and to associate them with names later on, the query is a lot simpler.

```sql
select t1.actor_id, t2.actor_id from casting_records t1 join casting_records t2 on t1.feux_play_id = t2.feux_play_id
where t1.actor_id > t2.actor_id
group by t1.actor_id, t2.actor_id
order by count(*) desc
limit 10
```

result:

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
