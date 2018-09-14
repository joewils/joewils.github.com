---
layout: nil
title: "SAPM"
---

# Shared Account Password Management (SAPM)

## Goals
1. Safe'ish: secret key encryption
2. Auditable: who, what, when

### Models
1. Auth
  * OAuth
2. Vault
  * Vaults have one or more owners
  * Vaults have zero or more members
3. Secret
  * Secrets belong to one vault
  * Secrets are shared to all vault members
4. Audit

### Requirements
1. Log all views and edits
2. Write Once Read Many (WORM)
3. Encrypted at rest

### Gems
1. Sinatra
2. PG
3. RbNaCl

### Security
1. System security is dependent upon the web application server.  If an attacker gains access to the web application server, they can access the secret keys used to encrypt/decrypt the data and the credentials used to connect to the data warehouse.
2. Sharing secrets among a team is hard.
3. Just use Zoho Vault. Too cheap to compete with...

### Commercial Products
* <https://www.zoho.com/vault/>
* <https://www.centrify.com/products/infrastructure-services/shared-password-management/>
* <https://www.lastpass.com/team-password-manager>
