FROM ruby:2.5.1
LABEL version="1.0.0"
LABEL maintainer="Bowens3@nd.edu"

# Install apt based dependencies required to run Rails as 
# well as RubyGems. As the Ruby image itself is based on a 
# Debian image, we use apt-get to install those.
RUN apk update && apk install -y \ 
  nodejs && \
  mkdir -p /app 

WORKDIR /app
ADD . /app

RUN gem install bundler && bundle install

# Expose port 3000 to the Docker host, so we can access it 
# from the outside.
EXPOSE 3000

CMD ["rails","s -b 0.0.0.0"]