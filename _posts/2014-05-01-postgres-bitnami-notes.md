---
layout: post
title: Bitnami PostGreSQL Notes
categories:
- bookmark
- development
---

## Conf:

* firewall - Open up port 5432
* postgresql.conf - Update listen_addresses
* pg_hba.conf - Update host to accept from samenet

## PGAdmin

* [PGAdmin Create Users](https://chartio.com/docs/datasources/connections/details/pgadmin)
* [PGAdmin3 Win32](http://ftp.postgresql.org/pub/pgadmin3/release/v1.18.1/win32/)

## Automated Backup:

* [Create Backup User](http://jamie.curle.io/blog/creating-a-read-only-user-in-postgres/)
* [Win32 Batch File](https://wiki.postgresql.org/wiki/Automated_Backup_on_Windows)
* [Task Scheduler](http://technet.microsoft.com/en-us/library/cc721871.aspx)

### Bitnami

* [Bitnami Module](https://bitnami.com/stack/postgresql)
* [Bitnami Module Documentation](http://wiki.bitnami.com/Components/PostgreSQL)

## ODBC

* [Postgresql ODBC Setup](http://stackoverflow.com/questions/6796252/setting-up-postgresql-odbc-on-windows)
* [ODBC MSI](http://ftp.postgresql.org/pub/odbc/versions/msi/)