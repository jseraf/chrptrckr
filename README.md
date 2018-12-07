# ABOUT

ChrpTrckr tracks the CHIRP Radio playlist by artist, album and DJ. It retrieves bio info and images links from Last.fm and Discogs.

# REQUIREMENTS (AS CONFIGURED)

Ruby >= 2.5.0
Postgres >= 9.6
Bundler >= 1.16.1

# INSTALL

- Edit config/database.yml as needed
- Open terminal / command line and cd into directory
- Run `bundle install`
- Run `rake db:setup`
- Run `rails s` to start server
- Visit http://localhost:3000

# CRON

ChrpTrcker uses the whenever gem to retrieve DJ spins every minute using the `rake spin:retrieve` task (which can also be run from the command line).

Edit config/schedule.rb to change this.

Run `whenever --update-crontab` from the application's root directory.

