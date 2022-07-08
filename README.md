# Spotify User Data
This is a basic node application that uses the Spotify API to gather data from users who log in.

## Setup
The application requires a couple of secrets in order to function most of which you should store in a .env file:
```
CLIENT_ID="Spotify client secret"
CLIENT_SECRET="Spotify client secret"
REDIRECT_URI="callback uri for token"
GCLOUD_STORAGE_BUCKET="gcloud bucket name"
```
You also need a gcloud service accounts key stored in a key.json file in order to upload files to a bucket.