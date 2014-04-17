---
layout: post
title: Sort Wordpress Categories by Year
categories:
- bookmark
- development
- wordpress
---

``` php
  <?php
      $current_category = get_query_var('cat');
      $year ='';
      if(isset($_GET['postyear'])){
          $year = '&year='.intval($_GET['postyear']);
          $title_year = htmlspecialchars($_GET['postyear']);
      }
      query_posts('cat='.$current_category . $year);
  ?>
```

[http://wordpress.org/support/topic/combining-year-and-category-with-permalinks](http://wordpress.org/support/topic/combining-year-and-category-with-permalinks)