---
layout: default
lang: en
nav_order: 1
title: API
parent: Receipt Registers
grand_parent: English Version
permalink: /en/receipts/api.html
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

This API is the preferred method for working with the RCF data. It provides read-only access to the live data.

There is a single REST API endpoint for each table and each view in the database. Each of these endpoints provide access to the data in that table, in JSON format.

### Endpoints

Here is a full list of REST API endpoints (which you will note, correspond to the tables available in the [database](/en/receipts/database.html#tables)):

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


A prefabricated set of requests can be downloaded as described under [#tools](#tools).

[Author](https://api.cfregisters.org/people?is_author=eq.true) records are now stored separately as well, and are related to plays via a "join" table, which is a more conventional structure for this kind of database. There are a few such examples of these "legacy" data, which have not been deleted, since previous versions of some tools depend on those fields.

### How to query the API

Visiting [http://api.cfregisters.org/](http://api.cfregisters.org/) returns a list of all available endpoints (see an excerpt below).

Install an [API browser](#tools) and explore the data in each table.

Once you've decided which data you're interested in, you can get all records by visiting the endpoint for that table.

As an example, sending an `OPTIONS` request to the `/plays` endpoint returns a list of available columns; a GET request to [that same endpoint](http://api.cfregisters.org/plays) returns the data as JSON.

You can also filter those records by any field in that table, exclude fields you're not interested in, or even nest data from related tables within a query.

One example of that syntax is below: a query for Authors:

```
https://api.cfregisters.org/people?is_author=eq.true
```

Since the `people` table includes both actors and authors, we filter the results of our query to that table, by specifying that we want only records for which the `is_author` field value is `true`. We do that by sending our request to the `/people` endpoint, with the query parameter key `is_author`, and by passing the `eq.true` value with that key. Other available query parameters include `gt`, `lt`, for "greater than" and "less than" (quantitative comparisons), `neq` for "not equal to", etc. The full list is available [here](http://postgrest.org/en/v7.0.0/api.html#operators).

These parameters can be strung together with `&` if you want to filter by more than one field at a time. There are also `and` and `or` operators, and taken together, these and other syntax features make the query interface quite flexible and powerful.

Documentation of the syntax for more complex queries is available from the website for "[PostgREST](http://postgrest.org/en/v5.0.0/api.html#)", an API framework the name of which is a portmanteau for "PostgreSQL" (the database we use) and "REST" (the widely used API architecture we've adopted).

## Tools

### JSON View

[JSONView for Chrome](https://chrome.google.com/webstore/detail/jsonview/chklaanhfefbnpoihckbnefhakgolnmc) prints JSON responses in a familiar outline format.

### Postman

Postman is a RESTful Web API browser.

1. [Install Postman](https://www.getpostman.com)
2. Import [this collection of API requests](https://www.getpostman.com/collections/75eb47f4dd961830b5b9) into Postman.
3. Experiment with the requests in the collection

Once Postman is installed, you can also use this button to import the collection of sample requests.
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
