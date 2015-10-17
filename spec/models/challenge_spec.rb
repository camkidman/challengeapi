require "rails_helper"

describe Challenge do
  let(:challenge) { FactoryGirl.build :challenge }
  subject { challenge }

  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:user) }
end
