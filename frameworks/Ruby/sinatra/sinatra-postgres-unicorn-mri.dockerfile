FROM ruby:3.3-rc

ENV RUBY_YJIT_ENABLE=1

ADD ./ /sinatra
WORKDIR /sinatra

RUN bundle install --jobs=4 --gemfile=/sinatra/Gemfile --path=/sinatra/sinatra/bundle

ENV DBTYPE=postgresql

EXPOSE 8080

CMD bundle exec unicorn -c config/mri_unicorn.rb -o 0.0.0.0 -p 8080 -E production
