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
      expect(assigns(:restaurants)).to match_array([restaurant1, restaurant2])
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
    # before :each do
 #      @attr = {name: "Tram", description: "Awesome place to eat", full_address: "123 Argyle st", phone_number: "1234567890"}
 #    end
    
    it "should create a restaurant" do
      post :create, restaurant: FactoryGirl.build(:restaurant)
      response.should redirect_to restaurant_path(:restaurant)
    end
    
# it "should render 'view' if restaurant is not saved"
#       post :create, :restaurant => @attr, :restaurant.save == false
#       response.should render_template(:new)
#     end
    
  end
  
  describe "GET #edit" do
    it "should go to the edit page for that restaurant" do
      get :edit
      response.should redirect_to edit_restaurant_path(:restaurant)
    end
    
  end
  
  
  describe "PATCH #update" do
    it "should render the edit template" do
      put :update
      response.should render_template('edit')
    end
  end
  
  describe "GET #show" do
    it "should show the correct restaurant when given a valid restaurant id" do
      get :show
      response.should redirect_to restaurant_path(:restaurant)
    end
        
    # it "should raise error when given an invalid restaurant id" do
    #   get :show
    #   
    # end
  end
  
  
end

