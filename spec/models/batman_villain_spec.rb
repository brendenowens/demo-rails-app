require 'rails_helper'

RSpec.describe BatmanVillain, type: :model do
  it "is valid with valid attributes" do
    expect(BatmanVillain.new(name: "Firefly")).to be_valid
  end
  it "is not valid without a name" do 
    villain = BatmanVillain.new(name: nil)
    expect(villain).to_not be_valid
  end
end
