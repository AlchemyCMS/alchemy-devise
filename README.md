## Devise based authentication for Alchemy 3.4

[![Build Status](https://secure.travis-ci.org/AlchemyCMS/alchemy-devise.svg?branch=3.4-stable)](http://travis-ci.org/AlchemyCMS/alchemy-devise)

[![Gem Version](https://badge.fury.io/rb/alchemy-devise.svg)](http://badge.fury.io/rb/alchemy-devise) [![Test Coverage](https://codeclimate.com/github/AlchemyCMS/alchemy-devise/badges/coverage.svg)](https://codeclimate.com/github/AlchemyCMS/alchemy-devise/coverage) [![Code Climate](https://codeclimate.com/github/AlchemyCMS/alchemy-devise/badges/gpa.svg)](https://codeclimate.com/github/AlchemyCMS/alchemy-devise) [![security](https://hakiri.io/github/AlchemyCMS/alchemy-devise/3.4-stable.svg)](https://hakiri.io/github/AlchemyCMS/alchemy-devise/master) [![Dependency Status](https://gemnasium.com/AlchemyCMS/alchemy-devise.svg)](https://gemnasium.com/AlchemyCMS/alchemy-devise)

AlchemyCMS has no authentication in its core. So it is possibly to bring your own authentication and use it to authorize users in AlchemyCMS. If you don't have your own authentication, you can use this gem.

## Install

Just put the gem into your projects `Gemfile`.

```ruby
# Gemfile
gem 'alchemy-devise', github: 'AlchemyCMS/alchemy-devise', branch: '3.4-stable'
```

and run `bundle install`.

Then run the installer:

```shell
$ bin/rails g alchemy:devise:install
```

## Upgrading

After updating the gem, please run the installer again.

```shell
$ bundle update alchemy-devise
$ bin/rails g alchemy:devise:install
```

## Testing

If you want to contribute (and you should ^_^), you need to run the tests locally on your machine.

Just follow these pretty rails standard way of testing projects:

### 1. Once to prepare the test suite:

Clone the repo to your local harddrive. Then

```shell
$ bundle install
$ rake alchemy:spec:prepare
```

### 2. Run the tests with:

```shell
$ rspec
```

_Optional:_ Even shorter

```shell
$ rake
```

That prepares the database and runs the Rspec task in one step.

Getting Help
------------

* If you have bugs, please use the [issue tracker on Github](https://github.com/AlchemyCMS/alchemy-devise/issues).
* For Q&A and general usage, please use the [User Group](http://groups.google.com/group/alchemy-cms) or the IRC channel.
* New features should be discussed on our [Trello Board](https://trello.com/alchemycms). *PLEASE* don't use the Github issues for new features.

Resources
---------

* Homepage: <http://alchemy-cms.com>
* Live-Demo: <https://demo.alchemy-cms.com> (user: demo, password: demo123)
* API Documentation: <http://rubydoc.info/github/AlchemyCMS/alchemy-devise>
* Issue-Tracker: <https://github.com/AlchemyCMS/alchemy-devise/issues>
* Sourcecode: <https://github.com/AlchemyCMS/alchemy-devise>
* User Group: <http://groups.google.com/group/alchemy-cms>
* IRC Channel: #alchemy_cms on irc.freenode.net
* Discussion Board: <https://trello.com/alchemycms>

License
-------

* BSD: <https://github.com/AlchemyCMS/alchemy-devise/LICENSE>
