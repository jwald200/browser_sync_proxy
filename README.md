[![Build Status](https://travis-ci.org/jwald200/browser_sync_proxy.svg?branch=master)](https://travis-ci.org/jwald200/browser_sync_proxy)

# browser_sync_proxy

`browser_sync_proxy` eases the usage of [browser-sync](https://www.browsersync.io/) with your dynamic application.
You can probably use it with any application (besides Ruby), but I use it with Sinatra and Rails.

## Prerequisites

Please verify that you have `node` installed by typing `node -v`. If you do not have it installed, please visit
https://nodejs.org/en/ for installation instructions.

Please check that you have [browser-sync](https://www.browsersync.io/) by typing `browser-sync -v`.
If you don't, type `npm install -g browser-sync`.

## Installation

    $ gem install browser_sync_proxy



## Custom Setup
To configure your application type:

    bsync setup

This will prompt you to enter your host, port, and directories/files you want to watch.
hit y to confirm. This will create a file
called `browser_sync_proxy.yml` in your directory.

## Usage

Start your server as usual, for example `rails server`. Once your server is up,
open a new terminal tab/window. If you have a custom configuration setup type:

    bsync

There are also a default option for Rails and Sinatra

    bsync --rails | bsync --sinatra

The rails defaults are localhost:3000 and watched files app/views, app/assets.
Sinatra defaults are localhost:9292 and watched files views/*

![Usage Demo](images/Browser_sync_proxy_demo.gif)
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jwald200/browser_sync_proxy. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
