---
layout: page
lang: en
nav_order: 3
title: Casting Registers
parent: English Version

permalink: /en/feux/
---

<details open markdown="block">
  <summary>
    Table de Contenus
  </summary>
  {: .text-delta }
1. TdC
{:toc}
</details>


## Overview

### Intro -  relational databases

A relational database is a structure that allows you to organize information in tables (sometimes called "relationships"). The columns in each table describe the attributes (sometimes also called ‘fields’) of the data it contains. Each row is a tuple that contains the attributes specified by the set of columns.

The primary key of an array uniquely identifies each row. It either consists of a single attribute or, sometimes, a collection of fields.

Tables are linked to one another by referring to foreign keys, which means that one column of one table refers to the identity (the primary key) of another. This approach ensures data integrity by preventing us from removing rows where identity is referenced elsewhere.

### Tables

The database includes fourteen tables. Nine of them are new, and five are from the recipe base. During entry, new data was added to some of these tables, so they no longer correspond to the original versions. The function, important attributes, and entity-association schemas of the tables follow:

** Primary key = The database includes fourteen tables. Nine of them are new, and five are from the recipe base. During entry, new data was added to some of these tables, so they no longer correspond to the original versions. The function, important attributes, and entity-association schemas of the tables follow:

- Primary key = CP
- Foreign key = FK

**people**

This table comes from the recipe base. It describes the people (not just the comedians) of the CF

- PK: id

**acteurs**

This table contains the complete list of actors with information to identify them. New additions are characterized by a lack of ‘people_id’

- PK: id
- FK: people_id (people)

_Notes:_
- The "status_osp" indicates whether the actor held the rank of occasional, boarder, or member
- Usually an actor has only one beginning, but sometimes there are several - hence the type list
- While we can calculate the last appearance of a comedian (within our period), it is only the members who have an official 'start'


**registers**

This table comes from the receipts database. It gives the details of a receipts register.

- PK: id

**feux**

This table is a one page representation of the fire logs. It is concerned with the data that have a relation 1-1 to a session; separate tables handle 1-to-many relationships.

- PK: id
- FK: register_id (registers), verification (verification_states)

_Notes:_
- The "notes" field and for additional notes present in the registers themselves
- The 'annotations' are for the notes / observations of the researchers

**lieux**

This table records the alternative locations when plays are performed outside CF theaters.

- PK: id

**plays**

This table comes from the recipe database. It describes the plays played at the CF - some new ones were added when entering lights.

- PK: id

**authorships**

This table is also stitched from the base of recipes. It links the authors (people) and the pieces. The choice was made to use an array to do this due to the fact that some pieces have multiple authors.

- PK: id
- FK: ext_id (people), play_id (plays)


**register_plays**

This table, taken from the base of recipes, associates parts with registers (and therefore with dates).

PK: id
FK: play_id (plays), register_id (registers)*

_*this one is not 'official' in the database diagram_

_Notes:_

- The foreign key constraint between this table and the parts table has been added only in the base of lights
- It was not possible to do the same for the 'register_id' because there are 4310 values in this column which are not present in the register table.
- This should not happen: to be continued


**feux_plays**

This painting associates the fires (the sessions) with the pieces performed.

- PK: id
- FK: feux_id (feux), play_id (plays), lieu_id (lieux)


**personnages**

This table describes the characters that belong to each piece. Gender indicates whether it is a male or female role; sometimes this field is null, when it is a small role.

- PK: id
- FK: play_id (plays)

**casting_records**
This table describes for each session, who plays which role, in which room.

- PK: id
- FK: feux_play_id (feux), role_id (personnages), actor_id (acteurs)


Notes:
- Sometimes (we're not sure why) comedians are written in the center of the page instead of on the right; the 'in_middle' boolean is our way of noting these cases.
- The values of "start" and "restart" are true only when these events are noted in the registers (not because of our observations).
- The 'role_id' is null if we only have the names of the actors, and the 'actor_id' can be null in cases where we have the cast

**user_permissions**

This table describes the permissions model used by the tool. It has nothing to do with registry data.

- PK: permission

**users**

This table is used for permissions in the interface. This table does not apply to data.

- PK: id
- FK: permission (user_permissions)


**verification_states**

Table of the revenue base. Describes the possible states of an input.

- PK: id

### Hosting and Technology Stack
All applications in the RCF universe are hosted on the Compute Canada server (app.cfregisters.uvic.ca)
- OS: ubuntu (linux)
- Web server: nginx
- The traffic light entry interface uses:
- A Postgres database
- PostgREST to help create an application programming interface for database data
- AngularJS for interface logic
