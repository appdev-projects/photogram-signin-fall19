FROM ruby:2.6.5

USER root

WORKDIR /myapp
COPY Gemfile /myapp/Gemfile

RUN bundle install

EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
