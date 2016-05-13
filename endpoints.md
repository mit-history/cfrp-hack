---
layout: page
title: Endpoints
permalink: /endpoints
---

A GET request to http://api.cfregisters.org/ returns a list of available endpoints (see an excerpt below).

As an example, an OPTIONS request to /plays returns a list of available columns; a GET request to [that same endpoint](http://api.cfregisters.org/plays) returns the data as JSON, and can be filtered.

{% highlight json %}
  [
    {
         "schema": "public",
         "name": "amalgamated_sales",
         "insertable": false
    },
    {
         "schema": "public",
         "name": "participations",
         "insertable": true
    },
    {
         "schema": "public",
         "name": "people",
         "insertable": true
    },
    {
         "schema": "public",
         "name": "performances",
         "insertable": false
    },
    {
         "schema": "public",
         "name": "performances_with_totals",
         "insertable": false
    },
    {
         "schema": "public",
         "name": "play_ticket_sales",
         "insertable": false
    },
    {
         "schema": "public",
         "name": "plays",
         "insertable": true
    },
    {
         "schema": "public",
         "name": "plays_with_totals",
         "insertable": false
    },
    {
         "schema": "public",
         "name": "register_images",
         "insertable": true
    },
    {
         "schema": "public",
         "name": "register_period_seating_categories",
         "insertable": true
    },
    {
         "schema": "public",
         "name": "register_periods",
         "insertable": true
    },
    {
         "schema": "public",
         "name": "register_plays",
         "insertable": true
    },
    {
         "schema": "public",
         "name": "registers",
         "insertable": true
    },
    {
         "schema": "public",
         "name": "sales_by_date",
         "insertable": false
    },
    {
         "schema": "public",
         "name": "seating_categories",
         "insertable": true
    },
    {
         "schema": "public",
         "name": "ticket_sales",
         "insertable": true
    },
    {
         "schema": "public",
         "name": "ticket_sales_by_profile",
         "insertable": false
    },
  ]
{% endhighlight %}
