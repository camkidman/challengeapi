require 'rails_helper'
require 'pry'

RSpec.describe Api::V1::ChallengesController, type: :controller do
  before(:each) { request.headers['Accept'] = 'application/vnd.challengeapp.v1' }

  describe "GET #show" do
    before(:each) do
      @challenge = FactoryGirl.create(:challenge)
      get :show, user_id: @challenge.user.id, id: @challenge.id, format: :json
    end

    it "returns the information about a reporter on a hash" do
      challenge_response = JSON.parse(response.body, symbolize_names: true)
      expect(challenge_response[:description]).to eql @challenge.description
      expect(challenge_response[:title]).to eql @challenge.title
    end

    it { should respond_with 200 }
  end

  describe "POST #create" do
    context "when successfully created" do

      before(:each) do
        @user = FactoryGirl.create(:user)
        @challenge_attributes = FactoryGirl.attributes_for(:challenge)
        post :create, user_id: @user.id, challenge: @challenge_attributes, format: :json
      end

      it "should render the JSON for the created challenge" do
        challenge_response = JSON.parse(response.body, symbolize_names: true)
        expect challenge_response[:description].to eql @challenge_attributes["description"]
        expect challenge_response[:title].to eql @challenge_attributes["title"]
      end
    end
  end

end
