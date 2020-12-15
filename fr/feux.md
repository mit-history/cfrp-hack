---
layout: page
lang: fr
nav_order: 3
title: Les Registres des Feux
parent: Version Française
permalink: /fr/feux/
---

<details open markdown="block">
  <summary>
    Table de Contenus
  </summary>
  {: .text-delta }
1. TdC
{:toc}
</details>


## Intro -  bases de données relationnelles

Une base de données relationnelle est une structure qui permet d’organiser des informations rangées en tableaux  (parfois appelés ‘relations’). Les colonnes de chaque tableau décrivent les attributs (on les appelle parfois aussi des ‘champs’) des données qu’il contient. Chaque rangée est un n-uplet qui contient les attributs spécifiés par l’ensemble de colonnes.

La clé primaire d’un tableau permet d'identifier de façon unique chaque rangée. Il se compose soit d’un seul attribut ou, parfois, d’une collection de champs.

On relie les tableaux par des rapports de clé étrangère, ce qui veut dire qu’une colonne d’un tableau fait référence à  l‘identité (la clé primaire) d’un autre. Ces rapports assurent l’intégrité des donnés en nous empêchant d’enlever des rangées où l’identité est référencé ailleurs.

Veuillez ne pas tenir compte du mélange atroce de conventions d’appellation...

## Description des tableaux

La base de données comprend quatorze tableaux. Neuf d’entre eux sont nouveaux, et cinq viennent de la base des recettes. Lors de la saisie, de nouvelles données ont été ajoutées à certains de ces tableaux, donc ils ne correspondent plus aux versions originales. La fonction, les attributs importants, et les schémas entité-association des tableaux suivent :

- Clé primaire = CP
- Clé étrangere = CE

###  people

Ce tableau vient de la base des recettes. Il décrit les personnes (non seulement les comédiens) de la CF

- CP: id

###  acteurs

Ce tableau contient la liste complète des comédiens avec des informations permettant de les identifier. Les nouveaux ajouts sont caractérisés par un manque de ‘people_id’

- CP: id
- - CE: people_id (people)

_Précisions:_

Le ‘status_osp’ indique si le comédien tenait le rang de occasionel, pensionnaire, ou sociétaire
Habituellement on comédien n'a qu’un début, mais parfois il y en a plusieurs - d’où le type liste
Pendant que nous puissions calculer la dernière apparition d’un comédien (à l’intérieur de notre période), ce ne sont que les sociétaires qui ont un ‘départ’ officiel

###  registers

Ce tableau provient de la base des recettes. Il donne les détails d’un registre de recettes.

- CP: id

###  feux

Ce tableau est une représentation d’une page dans les registres des feux. Il se concerne avec les données qui ont un rapport 1-1 à une séance; des tableaux séparés s’occupent des rapports 1-à-plusieurs.

- CP: id
- CE: register_id (registers) , verification (verification_states)

_Précisions:_
- Le champ ‘notes’ et pour les notes supplémentaires présents dans les registres ils-mêmes
- Les ‘annotations’ sont pour les notes/observations des chercheurs


###  lieux

Ce tableau enregistre les lieux alternatifs quand des pièces se  jouent hors de théâtres de la CF.

- CP: id

###  plays

Ce tableau provient de la base des recettes. Il décrit les pièces jouées à la CF - certaines nouvelles ont été ajoutées lors de la saisie des feux.

- CP: id

###  authorships

Ce tableau est aussi piqué de la base des recettes. Il met en lien les auteurs (personnes) et les pièces. Le choix a été fait d’utiliser un tableau pour ce faire en raison du fait que quelques pièces ont plusieurs auteurs.

- CP: id
- CE: ext_id (people), play_id (plays)


###  register_plays

Ce tableau, pris de la base des recettes, associe des pièces à des registres (et donc à des dates).

- CP: id
- CE: play_id (plays), register_id (registers)*

*celle là n’est pas ‘officiel’ dans le schéma de la base

_Précisions:_

- La contrainte de clé étrangère entre ce tableau et le tableau des pièces a été ajoutée que dans la base des feux
- Il n’était pas possible de faire la même chose pour le ‘register_id’ car il existe 4310 valeurs dans cette colonne qui ne sont pas présentes dans le tableau des registres
- Cela ne devrait pas arriver: à suivre

###  feux_plays

Ce tableau associe les feux (les séances) avec les pièces jouées.

- CP: id
- CE: feux_id (feux), play_id (plays), lieu_id (lieux)


###  personnages

Ce tableau décrit les personnages qui appartiennent à chaque pièce. Le genre indique si c’est un rôle d’homme ou de femme; parfois, ce champ est null, lorsqu'il s’agit d’un d’un petit rôle.

- CP: id
- CE: play_id (plays)

###  casting_records
Ce tableau décrit pour chaque séance, qui joue quel rôle, dans quelle pièce.

- CP: id
- CE: feux_play_id (feux), role_id (personnages), actor_id (acteurs)


_Précisions:_
- Parfois (nous ne savons pas trop pourquoi) des comédiens sont écrit au centre de la page au lieu d’être à la droite; le boolean ‘in_middle’ est notre moyen de noter ces cas.
- Les valeurs de ‘debut’ et ‘reprise’ sont vrais que quand ces événements sont notés dans les registres (non en raison de nos observations).
- Le ‘role_id’ est null si nous avons que les noms des comédiens, et le ‘actor_id’ peut être null dans des cas où nous avons que la distribution


###  user_permissions

Ce tableau décrit le modèle de permissions utilisé par l’outil. Il n’a rien à faire avec les données des registres.

- CP: permission

###  users

Ce tableau est utilisé pour les permissions dans l'interface. Ce tableau ne concerne pas les données.

- CP: id
- CE: permission (user_permissions)


###  verification_states

Tableau de la base des recettes. Décrit les états possible d’une entrée.

- CP: id

## Hébergement et Pile Technologique
Toutes les applications de l’univers rcf sont hébergés sur le serveur de Compute Canada (app.cfregisters.uvic.ca)
- OS : ubuntu (linux)
- Serveur web: nginx
- L’interface de saisie des feux utilise:
- Une base de données Postgres
PostgRest pour aider à la création d’une une interface de - programmation applicative pour les données de la base
- AngularJS pour la logique de l’interface
