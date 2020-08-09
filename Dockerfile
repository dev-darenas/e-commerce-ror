FROM ruby:2.6.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client build-essential libpq-dev
RUN mkdir /e-commerce
WORKDIR /e-commerce
COPY Gemfile /e-commerce/Gemfile
COPY Gemfile.lock /e-commerce/Gemfile.lock
RUN bundle install
COPY . /e-commerce

RUN yarn install --check-files

EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
