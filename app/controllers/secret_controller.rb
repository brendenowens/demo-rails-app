class SecretController < ApplicationController
    def index
        @secrets = {}
        @secrets[:bowens3rubydemo] = ENV["bowens3-ruby-demo".upcase]
        render json: @secrets, status: 200
    end
end