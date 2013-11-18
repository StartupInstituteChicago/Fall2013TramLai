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
      get :index   
      expect(assigns[:restaurants]).to eq Restaurant.all
    end
 
  end
  
  describe "GET #new" do
    it "responds successfully  with an http 302 status code" do
      get :new
      response.status.should eql 302
    end
  
    it "renders the new template if owner signs in" do
      owner = FactoryGirl.create(:owner)
      sign_in owner
      get :new
      expect(response).to render_template(:new)
    end
    
    it "assigns a new restaurant if owner signs in" do
      owner = FactoryGirl.create(:owner)
      sign_in owner
      get :new 
      expect(assigns(:restaurant)).to_not be_nil
    end

    it "should redirect to the sign in page if owner does not sign in" do
      get :new 
      response.should redirect_to new_owner_session_path
    end
    
  end
  
  describe "POST #create" do
    before (:each) do 
      @attr = {name: "McDonalds", 
        description: "So fatty but cheap and convenient",
         full_address: "1234 W Argyle",
          phone_numer: "1234567890'"}
    end

    it "should create a restaurant if owner signs in" do
      owner = FactoryGirl.create(:owner)
      sign_in owner
      post :create, restaurant: @attr
      response.should be_success
    end

    it "should render template new if owner signed in but there were any invalid params" do
      owner = FactoryGirl.create(:owner)
      sign_in owner
      post :create, restaurant: {name: "McDonalds", 
        description: "So fatty but cheap and convenient",
         full_address: "1234 W Argyle", 
         phone_numer: "12345690'"}
      response.should render_template(:new)
    end

    it "should redirect to the sign in page if owner does not sign in" do
      post :create, restaurant: @attr
      response.should redirect_to new_owner_session_path
    end

    it "should create a category for a restaurant if the category box gets checked" do
      owner = FactoryGirl.create(:owner)
      sign_in owner
      post :create, restaurant: @attr, restaurant
      expect(assigns[:restaurant.category_id]).to eq 1
    end
    
  end
  
  describe "GET #edit" do
    it "should edit a restaurant if the owner of that restaurant is signed in" do
      owner = FactoryGirl.create(:owner)
      sign_in owner
      restaurant = FactoryGirl.create(:restaurant, owner: owner)
      get :edit, id: restaurant.id
      expect(assigns[:restaurant]).to eq restaurant
    end
    
  end
  
  
  describe "PATCH #update" do
    it "should direct to an updated page if the owner of that restaurant signs in" do
      owner = FactoryGirl.create(:owner)
      sign_in owner
      restaurant = FactoryGirl.create(:restaurant, owner: owner)    
      put :update, {id: restaurant.id, restaurant: {name: restaurant.name, description: restaurant.description, full_address: restaurant.full_address, phone_number: restaurant.phone_number}}
      response.should redirect_to restaurant_path(restaurant)
    end
  end
  
  describe "GET #show" do
    it "should show the correct restaurant when given a valid restaurant id" do
      owner = FactoryGirl.create(:owner)
      restaurant = FactoryGirl.create(:restaurant, owner: owner)
      get :show, id: restaurant.id
      expect(assigns[:restaurant]).to eq restaurant
    end
        
    it "should raise error when given an invalid restaurant id" do
      expect{
      get :show, id: -1
      }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
  
  
end

