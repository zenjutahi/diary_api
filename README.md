[![CircleCI](https://circleci.com/gh/zenjutahi/diary_api.svg?style=svg)](https://circleci.com/gh/zenjutahi/diary_api)
[![Coverage Status](https://coveralls.io/repos/github/zenjutahi/diary_api/badge.svg?branch=develop)](https://coveralls.io/github/zenjutahi/diary_api?branch=develop)

# My Diary API
A simple API that avails Diary end-points.

## Install

### Clone the repository

```shell
https://github.com/zenjutahi/diary_api.git
cd diary_api
```

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 2.6.0`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install 2.6.0
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler):

```shell
bundle install
```

### Initialize the database

```shell
rails db:create db:migrate
```

### Serve

```shell
rails s
```

## Continous Integration

```shell
coveralls and circle CI
```

## Licensing
This app is licensed under the MIT license.
