require 'spec_helper'

describe UsersController do

	describe "GET #dashboard" do
		it "should allow logged in user to see his restaurant" do
			user = FactoryGirl.create(:user)
			sign_in user
			restaurant = FactoryGirl.create(:restaurant, user: user)
			get :dashboard
			response.status.should eq 200
		end

		it "should direct to the sign in page if there is no logged in user" do
			get :dashboard
			response.should redirect_to new_user_session_path
		end
	end

end
