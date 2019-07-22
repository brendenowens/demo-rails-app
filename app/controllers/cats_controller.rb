class CatsController < ApplicationController
    def index 
        render :json [{name: "Nyan Cat"},{name: "Chairman Meow"},{name: "Sherlock Meows"}], status: 200
    end
end