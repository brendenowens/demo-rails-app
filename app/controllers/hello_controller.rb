class HelloController < ApplicationController
    def index
        @date = Date.today.to_s
    end
end