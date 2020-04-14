---
layout: default
title: Staff
permalink: /staff
---
# Staff

{% for author in site.authors %}
## [{{ author.name }}]({{ author.url }})
{{ author.position }}
{{ author.content | markdownify }}
{% endfor %}
