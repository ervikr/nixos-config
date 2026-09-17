# My NixOS config
### Connect to anyconnect vpn using openconnect-sso
```
openconnect-sso --server <server> 
```
Example 
```
openconnect-sso --server vpn.ntnu.no
```
#### Why use openconnect-sso over openconnect on KDE?
If the API endpoint/server requires SSO or SAMLv2 openconnect will fail at sso handling.
