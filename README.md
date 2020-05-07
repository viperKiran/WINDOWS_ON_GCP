### Windows on GCP

- set GOOGLE_BACKED_CREDENTIALS and GOOGLE_KEYFILE_JSON to google cloud creds.json file
- Enable compute engine api
- Create a bucket in google cloud storage and update the bucket name in backend.tf
- terraform plan and apply will create a basic windows instance on GCP
- Run windowd_password_generation.py to generate password to the instance

### TODO:
- Verify why startup.ps1 is not working
- Install counterstike
- Install AOE
- Install Hamachi LogmeIn
- Install GameRanger
- Bake the image and use this AMI for subsequent launch