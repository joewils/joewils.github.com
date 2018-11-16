---
layout: nil
---

LightSail

(Cohalo)
* ssh -i LightsailDefaultPrivateKeyUSWest.pem bitnami@54.202.58.1

SCP
scp -i Downloads/home/bitnami/apps/wordpress/htdocs/wp-content/themes/wp-bootstrap-4 USER@SERVER:/home/USER/FILENAME

scp -i LightsailDefaultPrivateKeyUSWest.pem Downloads/home/bitnami/apps/wordpress/htdocs/wp-content/themes/wp-bootstrap-4 bitnami@54.202.58.1

Bitnami WordPress on LightSail

* https://docs.bitnami.com/aws/get-started-lightsail/
* https://docs.bitnami.com/aws/apps/wordpress/

Bitnami Lets Encrypt Setup
https://docs.bitnami.com/aws/how-to/generate-install-lets-encrypt-ssl/

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