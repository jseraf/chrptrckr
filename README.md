# ABOUT

ChrpTrckr tracks the [CHIRP Radio](https://chirpradio.org/) playlist by artist, album and DJ. Where available, it retrieves:
- Last.fm artist bio; 
- Last.fm album image url;
- links to Last.fm and the artist's Discogs info.

# REQUIREMENTS
Ruby >= 3.3.1  
Postgres >= 9.6  
Bundler >= 2.2.22

## API Tokens
Update Rails [credentials file](https://guides.rubyonrails.org/security.html#custom-credentials) to include:

- [lastfm](https://www.last.fm/api):  
  - user_token  

- [discogs](https://www.discogs.com/developers/):  
  - api_key  
  - token  

# INSTALL
- Get tokens and update credentials
- Edit config/database.yml as needed
- Open terminal / command line and cd into directory
- Run `bundle install`
- Run `rake db:setup`
- Run `yarn install`
- Run `bin/dev` or `rails s` to start server
- Visit http://localhost:3000
