# Minimal Store

This project is a minimal store made with `ruby` and `rails`  to admin products and show to potential buyers.
It have the minimal validations to model and requests, also uses `rspec-rails` as testing framework together with `factory-bot` as a fixture replacement and database-cleaner as cleaner strategy to test db.

## Dependencies
For you to use this project you need:

* Ruby version 3.2.2

* Rails 7.0.6

* Postgresql >14

* Node 18.16.0

* Yarn 1.22.19

* Assets processing uses Active Storage from the `image_processing` gem, you need to have installed in your system 
  * [`libvips`](https://github.com/libvips/libvips) for image processing
  * [`ffmpeg`](http://ffmpeg.org/) for video processing, and
  * [`poppler`](https://poppler.freedesktop.org/) for PDF previews

## Developing
If your system matches the dependencies you can run `bundle install` to install the gems used by the project, you'll have to setup you local database configuration acordingly to your username and password defined in your system. I highly recommend to store your keys using the `rails credentials:edit` command to keep your secrets, then run `rails db:create db:migrate` to setup your database.

If you want to see this project live on your machine run the `./bin/dev` command to start the server with the js and css watchers defined in `./Procfile.dev` file. Fell free to change any script you want to start the server. It has already a binding to access the server on a LAN.

## Test suite
As I said before, this project uses `rspec-rails` as testing framework and `factory_bot_rails`/`faker` as fixture replacement.

You can find this fixtures and tests in the `spec` folder.

To run the test suite you have to run `bundle exec rspec`

## Deployment
If you want to deploy this app I recommend to use [`capistrano`](https://github.com/capistrano/capistrano). If you're using [`asdf`](https://asdf-vm.com/) for ruby versioning you can follow this tutorial [Deploy a EC2 de una app rails 7-postgres usando asdf y capistrano](https://medium.com/@mauriciofuentesbravo/deploy-a-ec2-de-una-app-rails-7-postgres-usando-asdf-y-capistrano-af5e794598fc)
