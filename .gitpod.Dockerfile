FROM gitpod/workspace-full:latest

USER root

RUN sudo apt-get update -qq && apt-get install -y nodejs postgresql-client && mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile

USER gitpod

RUN bundler --version && bundle install

EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
