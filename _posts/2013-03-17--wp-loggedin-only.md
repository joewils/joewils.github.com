---
layout: post
title: "Restrict Page to Authenticated Users - WordPress"
categories:
- bookmark
tags:
- development
- wordpress
- php
---

Quick method for preventing non-authenticated users from a WordPress page:

    <?php if ( !is_user_logged_in() ) {
    nocache_headers();
    header("HTTP/1.1 302 Moved Temporarily");
    header('Location: ' . get_settings('siteurl') . '/wp-login.php?redirect_to=' . urlencode($_SERVER['REQUEST_URI']));
    header("Status: 302 Moved Temporarily");
    exit();
    }?>

[http://wordpress.org/support/topic/restrict-access-level-to-specific-post-or-page](http://wordpress.org/support/topic/restrict-access-level-to-specific-post-or-page)
