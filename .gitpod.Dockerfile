FROM ruby:2.6.5

USER root

WORKDIR /myapp
COPY Gemfile /myapp/Gemfile

USER gitpod

RUN bundle install
