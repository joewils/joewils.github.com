---
layout: post
title: How to kill PG connections
categories:
- til
---

`select pg_terminate_backend(pg_stat_activity.pid) from pg_stat_activity where usename='USERNAME' and pid <> pg_backend_pid();`