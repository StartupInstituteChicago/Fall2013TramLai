require 'spec_helper'

describe OwnersController do

	describe "GET #dashboard" do
		it "should allow logged in owner to see his restaurant" do
			owner = FactoryGirl.create(:owner)
			restaurant = FactoryGirl.create(:restaurant, owner: owner)
			get :dashboard
			response.should eq restaurant
		end

		it "should direct to the sign in page if there is no logged in owner" do
			get :dashboard
			response.should redirect_to new_owner_session_path
		end
	end

end
