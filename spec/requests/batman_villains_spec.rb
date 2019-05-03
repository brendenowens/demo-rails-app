require 'rails_helper'

RSpec.describe "BatmanVillains", type: :request do
  describe "POST /batman_villains" do
    it "creates a batman villain" do 
      headers = {
        "ACCEPT" => "application/json"
      }
      post "/batman_villains", :params => { :name => "Firefly" }, :headers => headers

      expect(response.content_type).to eq ("application/json")
      expect(response). to have_http_status(:created)
    end
  end

  describe "GET /batman_villains" do 
    it "gets a batman villain" do 
      headers = {
        "ACCEPT" => "application/json"
      }

      get "/batman_villains", :headers => headers
      expect(response.content_type).to eq ("application/json")
      expect(response). to have_http_status(:success)
    end
  end
end
