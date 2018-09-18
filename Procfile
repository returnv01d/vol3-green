web: bundle exec rails server -p $PORT
worker: bundle exec sidekiq -q order_meal
release: rake db:migrate