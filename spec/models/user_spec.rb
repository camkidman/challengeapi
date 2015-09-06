require 'rails_helper'

RSpec.describe User, type: :model do
  before { @user = FactoryGirl.build(:user) }
  subject { @user }

  it { should respond_to(:email) }
  pending "add some examples to (or delete) #{__FILE__}"
end
