---
layout: post
title: Model and Diagram Any Database Using SQLAlchemy
---

I needed to model and diagram (ERD) a client's database schema in order to understand their machine learning task. They don't use Django, so I can't just `manage.py inspectdb` and [`manage.py graph_models`](http://django-extensions.readthedocs.org/en/latest/graph_models.html). But fortunately, sqlalchemy makes both of these tasks easy. 

It will work on any database that sqlalchemy knows how to deal with (many more [supported databases](http://docs.sqlalchemy.org/en/latest/core/engines.html#others) than Django's ORM). Look, Ma, no Django!

Autocoding Your SQLAlchemy Models (`inspectdb`)
-----------------------------------------------

The [`sqlautocode`](https://code.google.com/p/sqlautocode/) package creates models.py files (an sqlalchemy schema) for any database. Unfortunately there's an incompatability with the latest sqlalchemy, but [a patch] and [fork](https://bitbucket.org/x746e/sqlautocode) fixed that up. So you'll want to download this fork rather than installing from pypi or the official mercurial repo on code.google.com. Here's the bash trifecta that'll install it an model your database:

{% highlight bash %}
hg clone https://bitbucket.org/x746e/sqlautocode
pip install sqlautocode
sqlautocode postgres://username:password@host.domain.com/dewey -o models.py
{% endhighlight %}

Diagramming Your Database (`graph_models`)
------------------------------------------

Unless sqlalchemy has fixed things, you'll need a special pyparsing version for pydot to play nice with sqlalchemy:

{% highlight bash %}
pip uninstall pyparsing
pip install -Iv https://pypi.python.org/packages/source/p/pyparsing/pyparsing-1.5.7.tar.gz#md5=9be0fcdcc595199c646ab317c1d9a709 pydot
{% endhighlight %}

To diagram a PostrgreSQL database:

{% highlight python %}
from sqlalchemy_schemadisplay import create_schema_graph
connection = "postgres://username:password@host.server.url.com/database_name"
graph = create_schema_graph(metadata=MetaData(connection), show_datatypes=False, show_indexes=False, rankdir='LR', concentrate=False)
graph.write_png('database_schema_diagram.png')
{% endhighlight %}

Glossary
--------

**ERD**: Entity-Relationship Diagram -- a block diagram of your DB tables and their relationships through foreign keys
