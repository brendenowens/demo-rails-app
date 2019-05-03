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
end
