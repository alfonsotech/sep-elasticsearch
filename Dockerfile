FROM ruby:2.3.1

WORKDIR /usr/app

RUN mkdir -p /lib/sep/elasticsearch

COPY lib/sep/elasticsearch/version.rb /lib/sep/elasticsearch/

COPY Gemfile /
COPY Gemfile.lock /
COPY *gemspec /

RUN bundle

COPY . /

