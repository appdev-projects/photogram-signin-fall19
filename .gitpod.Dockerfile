FROM gitpod/workspace-full:latest

USER root

RUN apt-get update

## Ruby
RUN curl -L https://get.rvm.io | bash -s stable
#Set env just in case
ENV PATH /usr/local/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.6.5"
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

RUN bundle install

USER gitpod
WORKDIR /myapp
RUN bundle install
