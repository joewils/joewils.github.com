---
layout: post
title: "TIL: Compare two tables in SQL using a FULL OUTER JOIN"
categories:
- TIL
---

`sql
select a.*,b.* 
 from a full outer join b 
   on a.id1=b.id1 and a.id2=b.id2
   where a.id1 is null or b.id1 is null;
`

[http://stackoverflow.com/questions/34627224/how-to-compare-two-tables-in-postgresql](http://stackoverflow.com/questions/34627224/how-to-compare-two-tables-in-postgresql)