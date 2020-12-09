---
layout: page
title: API
topnav: false
permalink: /api/
---

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
