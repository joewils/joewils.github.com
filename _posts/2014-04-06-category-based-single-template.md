---
layout: post
title: Category Based Single Page Templates
categories:
- bookmark
- development
- wordpress
---

[http://www.nathanrice.net/blog/wordpress-single-post-templates/](http://www.nathanrice.net/blog/wordpress-single-post-templates/)

I've modified Nathan's oneliner to support child themes (STYLESHEETPATH vs. TEMPLATEPATH) and to use names instead of ids (slug vs. term_id)

```php
add_filter('single_template', create_function('$t', 'foreach( (array) get_the_category() as $cat ) { if ( file_exists(STYLESHEETPATH . "/single-{$cat->slug}.php") ) return STYLESHEETPATH . "/single-{$cat->slug}.php"; } return $t;' ));
```