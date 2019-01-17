---
layout: post
title: Nginx web server setup
---

Each time I have to set up a domain name service table or database access for a web server server I forget how to do it. And there doesn't seem to be a good online guide for it. So here are my notes.

## DNS Records

I use namecheap and AWS as my registrar and sometimes I set up a domain to point from namecheap to AWS to handle the actual DNS records.

## Appoach 1: [Namecheap](namecheap.com) Only

1. Log onto namecheap.
2. Click on the "DomainList" tab
3. Click on the "Manage" button next the one you want to configure
4. Find the "Advanced DNS" tab to the upper right
5. Set up your records to look like this:

```yaml
-
  Type: A Record
  Host: "@"
  Value: "{WIFI_ROUTER_IP_ADDRESS}"
  TTL: 20 min (or Automatic)
-
  Type: A Record 	
  Value: gpu
  Value: "{WIFI_ROUTER_IP_ADDRESS}"
  TTL: 20 min (or Automatic)
-
  Type: A Record 	
  Host: www
  Value: "{WIFI_ROUTER_IP_ADDRESS}"
  TTL: 20 min (or Automatic)
```

And on the NETGEAR wifi router console at 192.168.1.1 I set up Port Forwarding for ssh (custom port), http (80), https (443), and sometimes postgres (custom {PSQL_PORT} other than 5432) or the Django debug port (8000). Port Forwarding is on the [advanced tab](http://192.168.1.1/adv_index.htm) under the bottom left "Advanced Setup", clicking on the menu item link/button midway down called "Port Forwarding / Port Triggering."  Here are my LAN port forwarding settings:

```python
"""
# 	Service Name 	ExternalStartPort	ExternalEndPort	InternalStartPort	InternalEndPort	InternalIPaddress
1	WEB	            80	                80	            80	                80	            {SERVER_LAN_IP_ADDRESS}
2	hhtps	        443	                443	            443	                443	            {SERVER_LAN_IP_ADDRESS}
3	pgwebadmin	    5050	            5050	        5050	            5050	        {SERVER_LAN_IP_ADDRESS}
4	postgres	    {PSQL_PORT}	        {PSQL_PORT}	    {PSQL_PORT}	        {PSQL_PORT}	    {SERVER_LAN_IP_ADDRESS}
5	django debug	8000	            8000	        8000	            8000	        {SERVER_LAN_IP_ADDRESS}
6	gunicorn proxy	{GUNICORN_PORT}     {GUNICORN_PORT} {GUNICORN_PORT}     {GUNICORN_PORT} {SERVER_LAN_IP_ADDRESS}
7	ssh	            {SSH_PORT}	        {SSH_PORT}	    {SSH_PORT}	        {SSH_PORT}	    {SERVER_LAN_IP_ADDRESS}
""".format(**os.environ)
```

## NGINX

And then my nginx conf file in /etc/nginx/sites-enabled/django_app_name.conf on the server looks like this:

```config
server {
    listen 80;
    server_name gpu.totalgood.org {WIFI_ROUTER_IP_ADDRESS} {SERVER_LAN_IP_ADDRESS} 127.0.0.1;
    location / {
        proxy_pass http://127.0.0.1:{GUNICORN_PORT};
    }
    location /static/ {
        autoindex on;
        alias /var/www/knowledgequest/collected_static/;
    }
    location /robots.txt {
        alias /var/www/knowledgequest/collected_static/robots.txt;
    }
    location /favicon.ico {
        alias /var/www/knowledgequest/collected_static/favicon.ico;
    }
}
```

## `postgres`

And the postgres db setup script looks like this:

```python
import os

import numpy as np
from sqlalchemy import create_engine


DEFAULT_ENVIRON = dict(
    POSTGRES_KNOWLEDGEQUEST_DB_NAME='knowledgequest',
    POSTGRES_KNOWLEDGEQUEST_DB_USERNAME='kq',
    POSTGRES_KNOWLEDGEQUEST_DB_PW=str(str(3.1) + '{:5g}'.format(np.round((np.abs(100*np.pi*np.random.rand()) + 1), 4))),  
    )

CREATEDB_SQL_TEMPLATE = """
    CREATE DATABASE {POSTGRES_KNOWLEDGEQUEST_DB_NAME};
    CREATE USER {POSTGRES_KNOWLEDGEQUEST_DB_USERNAME} WITH PASSWORD '{POSTGRES_KNOWLEDGEQUEST_DB_PW}';
    ALTER ROLE {POSTGRES_KNOWLEDGEQUEST_DB_USERNAME} SET client_encoding TO 'utf8';
    ALTER ROLE {POSTGRES_KNOWLEDGEQUEST_DB_USERNAME} SET default_transaction_isolation TO 'read committed';
    ALTER ROLE {POSTGRES_KNOWLEDGEQUEST_DB_USERNAME} SET timezone TO 'UTC';
    GRANT ALL PRIVILEGES ON DATABASE knowledgequest TO {POSTGRES_KNOWLEDGEQUEST_DB_USERNAME};
    """

def execute_sql(engine='postgres://postgres@/postgres', sql=CREATEDB_SQL_TEMPLATE, **kwargs):
    """ Based on stackoverflow.com/a/8977109/623735 -- create a postgres database using sqlalchemy """
    env = DEFAULT_ENVIRON.copy()
    env.update(dict(os.environ))
    env.update(kwargs)
    sql.format(**env).splitlines()
    engine = create_engine(engine or 'sqlite:///enron_emails.db', echo=False) if not engine or isinstance(engine, str) else engine
    connection = engine.connect()
    connection.execute("commit")  # can't create a database from withing a transaction, so close the current transaction with a commit
    for statement in sql:
        print('SQL: {}'.format(statement))
        result = connection.execute(statement)
        connection.execute("commit")  # commit each transaction individually
        print('RESULT TABLE')
        print('------------')
        for row in result:
            print(row)
        print('------------')
    connection.close()

if __name__ == '__main__':
    execute_sql()
```

## Secrets

I keep secret network configuration settings in a shell script run by `~/.bash_profile` or `~/.bashrc` so that they are always in environment variables I can use with `envsubst` in bash or `.format()` string interpolation in a python app. 
