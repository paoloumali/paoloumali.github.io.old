---
layout: default
title: Blog
---
# Latest Posts

{% for post in site.posts %}
## <a href="{{ post.url }}">{{ post.title }}</a>
{{ post.excerpt }}
{% endfor %}
