---
layout: post
title: PostgreSQL Backup Account
categories:
- bookmark
- development
- postgresql
---

``` sql
CREATE USER backup_user  WITH ENCRYPTED PASSWORD 'password';
GRANT CONNECT ON DATABASE production to backup_user;
\c production
GRANT USAGE ON SCHEMA public to backup_user; /*thanks Dominic!*/
GRANT SELECT ON ALL SEQUENCES IN SCHEMA public TO backup_user;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO backup_user;
```

* [http://stackoverflow.com/questions/13497352/](http://stackoverflow.com/questions/13497352/error-permission-denied-for-relation-tablename-on-postgres-while-trying-a-selec)
* [http://jamie.curle.io/blog/creating-a-read-only-user-in-postgres/](http://jamie.curle.io/blog/creating-a-read-only-user-in-postgres/)