---
layout: page
title: Receipt Registers
topnav: true
permalink: /receipts/
---

## Receipt Registers

This repository contains JSON and CSV datasets, available in the codebase at `_data/json/` and `_data/csv/` Those [datasets can be leveraged via liquid](https://jekyllrb.com/docs/datafiles/) tags, for use within javascript if/as needed.

Files included as of now (others are being added):

- plays
- people
- performances

## Tables and fields

A full list of tables and their fields is available [here](/tables).

## Endpoints and requests

A full list of REST API endpoints is available [here](/endpoints), and a prefabricated set of requests can be downloaded on our [tools page](/tools).

---
layout: page
title: Data
topnav: false
permalink: /data/
---

## Datasets

This repository contains JSON and CSV datasets, available in the codebase at `_data/json/` and `_data/csv/` Those [datasets can be leveraged via liquid](https://jekyllrb.com/docs/datafiles/) tags, for use within javascript if/as needed.

Files included as of now (others are being added):

- plays
- people
- performances

## Tables and fields

A full list of tables and their fields is available [here](/tables).

## Endpoints and requests

A full list of REST API endpoints is available [here](/endpoints), and a prefabricated set of requests can be downloaded on our [tools page](/tools).

Below find a list of the most relevant tables in the CFRP database, with most of their relevant fields. Omitted are adminstrative tables, timestamp columns, and similar plumbing.

NB: All of the data from these tables is accessible via the [REST API endpoints](/endpoints).

Also, there is a complete dump of the database, in PostgreSQL compatible dumpfile format [here](/assets/data/cfrp-database.dump).

### Registers

```
   Column           |            Type             |
----------------------------+-----------------------------+
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
register_image_id          | integer                     |
register_period_id         | integer                     |
verification_state_id      | integer                     |
irregular_receipts_name    | character varying(255)      |
page_de_gauche             | character varying(255)      |
date_of_left_page_info     | date                        |
register_images_count      | integer                     |
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
_packed_id                 | integer                     |
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
-------------------+-----------------------------+
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
---------------------+-----------------------------+
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
-------------------------+-----------------------------+
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
--------------------+-----------------------------+
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
------------+-----------------------------+
id         | integer                     |
period     | character varying(255)      |

```

### Register Period Seating Categories
```
Column        |            Type             |
---------------------+-----------------------------+
id                  | integer                     |
register_period_id  | integer                     |
seating_category_id | integer                     |
ordering            | integer                     |

```
### Seating Categories

```

Column    |            Type             |
-------------+-----------------------------+
id          | integer                     |
name        | character varying(255)      |
description | character varying(255)      |
```

### Participations
```
Column      |            Type             |
------------------+-----------------------------+
id               | integer                     |
role             | character varying(255)      |
person_id        | integer                     |
debut            | boolean                     |
character        | character varying(255)      |
register_play_id | integer                     |
```

## Endpoints

A GET request to [http://api.cfregisters.org/](http://api.cfregisters.org/) returns a list of available endpoints (see an excerpt below).

As an example, an OPTIONS request to /plays returns a list of available columns; a GET request to [that same endpoint](http://api.cfregisters.org/plays) returns the data as JSON, and can be filtered.

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

### How to query the API

[Author](https://api.cfregisters.org/people?is_author=eq.true) records are now stored separately as well, and are related to plays via a "join" table, which is a more conventional structure for this kind of database. There are a few such examples of these "legacy" data, which have not been deleted, since previous versions of some tools depend on those fields.

To see everything that's available, visit [this page](https://api.cfregisters.org/), and/or install an [API browser](/tools) and explore the data in each table.

### How to query the API

Once you've decided which data you're interested in, you can get all records by visiting the endpoint for that table.

But you can also filter those records by any field in that table, exclude fields you're not interested in, or even nest data from related tables within a query.

Documentation of the syntax for those queries is available from the website for "[PostgREST](http://postgrest.org/en/v5.0.0/api.html#)", an API framework the name of which is a portmanteau for "PostgreSQL" (the database we use) and "REST" (the widely used API architecture we've adopted).

One example of that syntax is in use above, in the query for Authors:

```
https://api.cfregisters.org/people?is_author=eq.true
```

Since the `people` table includes both actors and authors, we filter the results of our query to that table, by specifying that we want only records for which the `is_author` field value is `true`. We do that by sending our request to the `/people` endpoint, with the query parameter key `is_author`, and by passing the `eq.true` value with that key. Other available query parameters include `gt`, `lt`, for "greater than" and "less than" (quantitative comparisons), `neq` for "not equal to", etc. The full list is available [here](http://postgrest.org/en/v7.0.0/api.html#operators).

These parameters can be strung together with `&` if you want to filter by more than one field at a time. There are also `and` and `or` operators, and taken together, these and other syntax features make the query interface quite flexible and powerful.

## Add to this documentation!

This documentation site is itself hackable, and we welcome pull requests.

### Set up
- Fork [this site](https://github.com/mit-history/cfrp-hack/)
- Clone this repo locally; then:
- `git branch your-proposed-change`
- If there is a request in Postman that serves your purposes, you can click "Generate Code" to get a copy/pasteable API client in your language of choice.

### Run this site locally

- If you have ruby installed:
- `gem install bundler`
- `bundle install`
- `jekyll serve`

### Submit your suggestion as a Pull Request

- Code!
- `git add .`
- `git commit -m "Created hackathon project"`
- `git push`
- Open a Pull request against [the upstream repo](https://github.com/mit-history/cfrp-hack/pulls).
