require "rails_helper"

describe Challenge do
  let(:challenge) { FactoryGirl.build :challenge }
  subject { challenge }

  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:user) }
  it { should respond_to(:challenged_user_id) }
  it { should respond_to(:complete?) }

  describe "#challenger" do
    before do
      @user = FactoryGirl.create(:user)
      @challenge = FactoryGirl.create(:challenge, user: @user)
    end

    it "should return the user that created the challenge" do
      expect(@challenge.challenger).to eql(@user)
    end
  end

  describe "#challengee" do
    before do
      @user_one = FactoryGirl.create(:user)
      @user_two = FactoryGirl.create(:user)
      @challenge = FactoryGirl.create(:challenge, user: @user_one, challenged_user_id: @user_two.id)
    end

    it "should return the challenged user" do
    expect(@challenge.challengee).to eql(@user_two)
    end
  end
end
