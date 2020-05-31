# README
## Ruby version: 2.7.1

## System dependencies
- Ruby 2.7.1
- Postgres 3.19.3
- Node 12.15.0
- Yarn 1.22.4
- ImageMagick 7.0.10

## Configuration
Install your application dependencies

```
bundle install
npm install
```

### Database creation

```
bundle exec rake db:create
bundle exec rake db:migrate
```

### Deployment instructions

```
heroku create
git push heroku master
heroku run rake db:migrate
```

Check if one dyno is running

```
heroku ps:scale web=1
```

Check the state of the app’s dynos

```
heroku ps
```

Visit the app in your browser with heroku open

```
heroku open
```