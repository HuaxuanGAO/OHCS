# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  * ruby 3.0.0
  * Rails 6.1.4

* System dependencies
  * `bundle install`
  * `yarn add bootstrap`

* Database creation
  * `rails db:migate`

* Database initialization
  * `rails db:seed`

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
  * precompile assets 
    * `rake assets:precompile`
    * `git add public`  
  * push (assume the remote url has been added)
    * `git push heroku main`
  * if deploying for the first time
    * redis init
      * `heroku addons:create heroku-redis:hobby-dev -a ohcs`
      * add this line to `config/initializers/redis.rb` `$redis = Redis.new(url: ENV["REDIS_URL"], ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE })` 
    * database init
      * `heroku run rails db:migrate`
      * `heroku run rails db:seed`
