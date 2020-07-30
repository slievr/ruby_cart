FROM ruby:2.5

RUN gem install bundler
# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY . .
RUN bundle install


CMD ["rspec"]