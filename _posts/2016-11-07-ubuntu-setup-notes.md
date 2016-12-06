---
layout: post
title: Ubuntu Web Application Server Setup notes
categories:
- ubuntu
---

## Ubuntu Setup 

* [Xenial Xerus](https://wiki.ubuntu.com/XenialXerus/ReleaseNotes)
* [adcli](https://www.freedesktop.org/software/realmd/adcli/adcli.html)
* [adcli bug (--host-fqdn)](https://bugs.freedesktop.org/show_bug.cgi?id=86107)

[AD Tutorial](https://www.kiloroot.com/add-ubuntu-14-04-server-or-desktop-to-microsoft-active-directory-domain-login-to-unity-with-domain-credentials/)

* apt-get update
* apt-get install realmd sssd samba-common samba-common-bin samba-libs sssd-tools krb5-user adcli packagekit vim -y
* kinit -V joeadmin
* realm --verbose join -U adminuser corp.COMPANY.com 
* echo 'ad_hostname = HOST.corp.COMPANY.com' >> /etc/sssd/sssd.conf
* echo 'dyndns_update = True' >> /etc/sssd/sssd.conf
* service sssd restart
* echo 'session required pam_mkhomedir.so skel=/etc/skel/ umask=0022' >> /etc/pam.d/common-session
* visudo
  * %domain\ admins@corp.COMPANY.com ALL=(ALL:ALL) ALL
  * %linuxadmins@corp.COMPANY.com ALL=(ALL:ALL) ALL

## Ruby/Sinatra Setup

* [Digital Ocean Guide - (Apache & Passenger Combo)](https://www.digitalocean.com/community/tutorials/how-to-deploy-sinatra-based-ruby-web-applications-on-ubuntu-13#installations)
* [GoRails](https://gorails.com/setup/ubuntu/14.10)


## Apache Setup

* [Linode Guide](https://www.linode.com/docs/websites/apache/apache-web-server-on-ubuntu-14-04)