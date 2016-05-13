---
layout: post
title:  "JSON API request examples"
date:   2016-05-12 13:45:51 -0400
categories: tools examples
---

Here are examples of some requests to the HTTP (REST) data API. This collection includes: 

Plays 1-100
Plays with Totals
play_ticket_sales?total_sold=gte.100&name=eq.Places de Parterre
plays?author=eq.Voltaire (François-Marie Arouet dit)
plays_with_totals?order=total.desc
plays?title=ilike.*mal*
play_ticket_sales?total_sold=gte.100&date=lt.1720-01-01&date=gte.1710-01-01&title=eq.Misanthrope (Le)
plays?author=ilike.*François*

<div class="postman-run-button"
data-postman-action="collection/import"
data-postman-var-1="75eb47f4dd961830b5b9"></div>
<script type="text/javascript">
  (function (p,o,s,t,m,a,n) {
    !p[s] && (p[s] = function () { (p[t] || (p[t] = [])).push(arguments); });
    !o.getElementById(s+t) && o.getElementsByTagName("head")[0].appendChild((
      (n = o.createElement("script")),
      (n.id = s+t), (n.async = 1), (n.src = m), n
    ));
  }(window, document, "_pm", "PostmanRunObject", "https://run.pstmn.io/button.js"));
</script>