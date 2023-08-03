# ABOUT

ChrpTrckr tracks the [CHIRP Radio](https://chirpradio.org/) playlist by artist, album and DJ. Where available, it retrieves artist bio info and image links from Last.fm and the artist's Discogs info.

# REQUIREMENTS

Ruby >= 3.0.2  
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

- Edit config/database.yml as needed
- Open terminal / command line and cd into directory
- Run `bundle install`
- Run `rake db:setup`
- Run `yarn install`
- Run `bin/dev` or `rails s` to start server
- Visit http://localhost:3000

# CRON

ChrpTrcker uses the [whenever gem](https://github.com/javan/whenever) to retrieve DJ spins every minute using the `rake spin:retrieve` task (which can also be run from the command line) in lib/tasks.

Edit config/schedule.rb to change this.

Run `whenever --update-crontab` from the application's root directory.
