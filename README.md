# ABOUT

ChrpTrckr tracks the [CHIRP Radio](https://chirpradio.org/) playlist by artist, album and DJ. Where available, it retrieves artist bio info and image links from Last.fm and the artist's Discogs info.

# REQUIREMENTS

Ruby >= 2.6.6
Postgres >= 9.6
Bundler >= 1.17.2

# INSTALL

- Edit config/database.yml as needed
- Open terminal / command line and cd into directory
- Run `bundle install`
- Run `rake db:setup`
- Run `rails s` to start server
- Visit http://localhost:3000

# CRON

ChrpTrcker uses the [whenever gem](https://github.com/javan/whenever) to retrieve DJ spins every minute using the `rake spin:retrieve` task (which can also be run from the command line) in lib/tasks.

Edit config/schedule.rb to change this.

Run `whenever --update-crontab` from the application's root directory.

