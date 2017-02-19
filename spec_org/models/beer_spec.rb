require 'rails_helper'

RSpec.describe Beer, type: :model do
  it "saves beer with name and style" do
    beer = Beer.create name:"kalia", style:"Lager"
    expect(beer).to be_valid
  end
  it "does not save w/o name" do
    beer = Beer.create name:"", style:"Lager"
    expect(beer).not_to be_valid
  end
  it "does not save w/o style" do
    beer = Beer.create name:"kalia", style:""
    expect(beer).not_to be_valid
  end
end
