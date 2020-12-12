---
layout: default
title: Database
parent: Receipt Registers
---

<details open markdown="block">
  <summary>
    Table of contents
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>

Below find a list of the most relevant tables in the CFRP database, with most of their relevant fields. Omitted are adminstrative tables, timestamp columns, and similar plumbing.

NB: All of the data from these tables is accessible via the [REST API endpoints](/endpoints).

Also, there is a complete dump of the database, in PostgreSQL compatible dumpfile format [here](/assets/data/cfrp-database.dump).

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
