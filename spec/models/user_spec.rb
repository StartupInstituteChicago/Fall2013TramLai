require 'spec_helper'

describe User do
  it {should validate_presence_of(:email)}
  it {should validate_presence_of(:password)}
  it {should validate_presence_of(:name)}
  it {should have_many(:starred_restaurants).through(:stars)}

  
  it "should only star a restaurant once" do
  end


end
