FROM ruby:2.3.7

RUN apt-get update -q 
RUN apt-get install -y nodejs curl git postgresql

RUN mkdir /app

RUN adduser -S -D -H -h /app rubyuser

ADD . /app
WORKDIR /app

RUN gem install bundler -v 1.17.3

RUN bundle install

RUN rake assets:precompile

# Expose port
EXPOSE 3000

RUN chmod -R 777 /app/db/
RUN chmod -R 777 /app/tmp/
RUN chmod -R 777 log

USER rubyuser

CMD ["puma","-C","config/puma.rb"]
