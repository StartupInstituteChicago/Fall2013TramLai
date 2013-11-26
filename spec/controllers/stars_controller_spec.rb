require 'spec_helper'

describe StarsController do
  before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
    @restaurant = FactoryGirl.create(:restaurant, user: @user)
  end

  describe "GET #new" do
    it "should respond successfully with 200 code" do
      get :new, restaurant_id: @restaurant.id
      response.status.should eq 200
    end 
  end

  describe "POST #create" do
    it "should create a new restaurant" do
      post :create, restaurant_id: @restaurant.id
      response.should be_success
    end
  end

end
