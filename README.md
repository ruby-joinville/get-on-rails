# GetOnRails
This is a template Rails app designed for learning purposes. This template includes the basic to get a Rails student started with a functioning system with postgres, devise and a [basic bootstrap theme](https://startbootstrap.com/templates/sb-admin/).

### Preconditions
 - ruby version `2.5.3`
 - rails version `5.2.3`
 - Local installation of Postgres with a `postgres:postgres` user:password

### Setup


```sh
cp config/database.sample.yml config/database.yml
```

```sh
bundle install
```

```sh
rails db:setup
```
