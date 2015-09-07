require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  before(:each) { request.headers['Accept'] = 'application/vnd.challengeapp.v1' }

  describe "GET #show" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      get :show, id: @user.id, format: :json
    end

    it "returns the information about a reporter on a hash" do
      user_response = JSON.parse(response.body, symbolize_names: true)
      expect(user_response[:user][:email]).to eql @user.email
    end

    it { should respond_with 200 }
  end

  describe "POST #create" do
    context "when successfully created" do

      before(:each) do
        @user_attributes = FactoryGirl.attributes_for :user
        binding.pry
        post 'create', { user: @user_attributes }, format: :json
      end

      it "renders the JSON for the user we just created" do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response[:user][:email]).to eql @user_attributes.email
      end

      it { should respond_with 201 }

    end

    context "when not successfully created" do

      before(:each) do
        @invalid_user_attributes = { password: "12345678",
                                     password_confirmation: "12345678" }
        post 'create', { user: @invalid_user_attributes }, format: :json
      end

      it "should render an error JSON response" do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response).to have_key(:errors)
      end

      it "should include the error of why it couldn't be created" do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response[:user][:email]).to include "can't be blank"
      end


    end
  end
end
