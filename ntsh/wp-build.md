---
layout: nil
published: false
hidden: true
---

LightSail

A Record: 54.202.58.1

(Cohalo)
* ssh -i LightsailDefaultPrivateKeyUSWest.pem bitnami@54.202.58.1

SCP
scp -i Downloads/home/bitnami/apps/wordpress/htdocs/wp-content/themes/wp-bootstrap-4 USER@SERVER:/home/USER/FILENAME

scp -i LightsailDefaultPrivateKeyUSWest.pem Downloads/home/bitnami/apps/wordpress/htdocs/wp-content/themes/wp-bootstrap-4 bitnami@54.202.58.1

Bitnami WordPress on LightSail

* https://docs.bitnami.com/aws/get-started-lightsail/
* https://docs.bitnami.com/aws/apps/wordpress/

Bitnami Lets Encrypt Setup

* Renew: sudo /etc/lego/renew-certificate.sh
* https://docs.bitnami.com/aws/how-to/generate-install-lets-encrypt-ssl/#alternative-approach

Amazon SES
https://metablogue.com/email-aws-lightsail-wordpress/

WordPress Command Line Tool
https://wp-cli.org
/opt/bitnami/php/bin/php wp-cli.phar --info

PHP
/opt/bitnami/php/bin/php --version

AWS Command Line Interface
https://docs.aws.amazon.com/cli/latest/userguide/awscli-install-linux.html


vulnerability scanning
https://github.com/wpscanteam/wpscan



WPROOT: /home/bitnami/apps/wordpress/htdocs
tar -czf wordpress.tar.gz /home/bitnami/apps/wordpress/htdocs



----------
NearlyFreeSpeech.net
----------

SSH: ssh joewils_cohalo@ssh.phx.nearlyfreespeech.net

Fix File Permissions
sudo find . -type f -exec chmod 664 {} +
sudo find . -type d -exec chmod 775 {} +

Update tmp file location
define('WP_TEMP_DIR', '/home/tmp/');

A Record: 208.94.117.181

Fix Path: 
echo 'PATH=~/.local/bin:$PATH' >> ~/.profile

Backup Shell Script
/home/private//.local/bin/backup.sh
