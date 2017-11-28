---
layout: post
title: Determine PostgreSQL Table Usage
categories:
- til
---

`
select * from pg_catalog.pg_statio_all_tables 
where schemaname not in ('pg_catalog', 'information_schema', 'pg_toast')
order by schemaname, heap_blks_hit DESC
`

[dba.stackexchange.com](https://dba.stackexchange.com/questions/5155/postgresql-last-access-time-to-table)

Use the following to reset stats:

`sql
select pg_stat_reset();
`