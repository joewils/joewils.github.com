---
layout: post
title: WPEngine Local Development Notes 
categories:
- noise
- development
- wordpress
---

1. Setup and install [XAMP](https://www.apachefriends.org) for local MySQL and PHP development
1. Download latest backup/restore point from [WPEngine](https://my.wpengine.com)
1. Extract archive and move it to your local htdocs folder
1. Create SQL export using PHPMyAdmin from [WPEngine](https://my.wpengine.com)
1. Create local SQL database using [PHPMyAdmin](http://localhost/phpmyadmin)
1. Import SQL dump using [PHPMyAdmin](http://localhost/phpmyadmin)
1. Modify the following using [PHPMyAdmin](http://localhost/phpmyadmin): wp_options.home and wp_options.siteurl to reflect your local development environment
1. Modify wp-config.php to reflect local database settings
1. ???
1. Profit!

## Bonus Points:

* Setup Git using WPEngines [Instructions](http://wpengine.com/git/) to track, manage, and deploy code changes