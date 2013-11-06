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
      post :create
      response.should redirect_to restaurant_path(assigns[:restaurant])
      
    end

    it "should render template new" do
      post :create, restaurant: FactoryGirl.create(:invalid_restaurant)
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
      p restaurant
      put :update, {id: restaurant.id, restaurant: restaurant}
      response.should redirect_to restaurant_path(:restaurant)
    end

    it "should render the edit template" do
      restaurant = FactoryGirl.create(:restaurant)
      put :update, id: 1
      reponse.should render_template(:show)
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

