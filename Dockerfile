FROM ruby:2.7.2

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /usr/jedis
COPY . /usr/jedis
RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

RUN gem install nokogiri --platform=ruby
RUN bundle config set force_ruby_platform true
RUN bundler install

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
