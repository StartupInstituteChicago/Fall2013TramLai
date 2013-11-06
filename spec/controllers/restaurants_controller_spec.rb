require 'spec_helper'

describe RestaurantsController do

  describe "GET #index" do
    it "responds successfully  with an http 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
    
    it "renders the index template" do
      get :index
      response.should render_template("index")
    end
    
    it "loads all of the restaurants into @restaurants" do
      restaurant1 = FactoryGirl.create(:restaurant)
      restaurant2 = FactoryGirl.create(:restaurant)
      get :index   
      expect(assigns[:restaurants]).to match_array([restaurant1, restaurant2])
    end
  end
  
  describe "GET #new" do
    it "responds successfully  with an http 200 status code" do
      get :new
      expect(response).to be_success
      response.status.should eql 200
    end
  
    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
    
    it "assigns a new restaurant" do
      get :new 
      expect(assigns(:restaurant)).to_not be_nil
    end
    
  end
  
  describe "POST #create" do

    it "should create a restaurant" do
      post :create, restaurant: {name: "McDonalds", description: "So fatty but cheap and convenient", full_address: "1234 W Argyle", phone_numer: "1234567890'"}
      response.should be_success
    end

    it "should render template new if there were any invalid params" do
      post :create, restaurant: {name: "McDonalds", description: "So fatty but cheap and convenient", full_address: "1234 W Argyle", phone_numer: "12345690'"}
      response.should render_template(:new)
    end
    
  end
  
  describe "GET #edit" do
    it "should go to the edit page for that restaurant" do
      restaurant = FactoryGirl.create(:restaurant)
      get :edit, id: 1
      expect(assigns[:restaurant]).to eq restaurant
    end
    
  end
  
  
  describe "PATCH #update" do
    it "should direct to an updated page" do
      restaurant = FactoryGirl.create(:restaurant)
      put :update, {id: restaurant.id, restaurant: {name: restaurant.name, description: restaurant.description, full_address: restaurant.full_address, phone_number: restaurant.phone_number}}
      response.should redirect_to restaurant_path(restaurant)
    end

    it "should render the edit template if the input params are invalid" do
      restaurant = FactoryGirl.create(:restaurant)
      put :update,  {id: restaurant.id, restaurant: {name: restaurant.name, description: restaurant.description, full_address: restaurant.full_address, phone_number: "123456"}}
      response.should render_template('edit')
    end


  end
  
  describe "GET #show" do
    it "should show the correct restaurant when given a valid restaurant id" do
      restaurant = FactoryGirl.create(:restaurant)
      get :show, id: 1
      expect(assigns[:restaurant]).to eq restaurant
    end
        
    it "should raise error when given an invalid restaurant id" do
      expect{
      get :show, id: 1
      }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
  
  
end

