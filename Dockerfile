FROM ruby:2.5.1
LABEL version="1.0.0"
LABEL maintainer="Bowens3@nd.edu"

# Install apt based dependencies required to run Rails as 
# well as RubyGems. As the Ruby image itself is based on a 
# Debian image, we use apt-get to install those.
RUN apt-get update && apt-get install -y \ 
  build-essential \ 
  nodejs && \
  mkdir -p /app 

WORKDIR /app
ADD . /app

RUN gem install bundler && bundle install
RUN bundle exec rake db:create db:migrate

# Expose port 3000 to the Docker host, so we can access it 
# from the outside.
EXPOSE 3000

CMD ["rails","s", "-b", "0.0.0.0"]