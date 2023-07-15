require 'rails_helper'

RSpec.describe User, type: :user do
  before(:all) do
    @user1 = create(:user)
  end

  it "is valid with attributes" do
    expect(@user1).to be_valid
  end

  it "has a unique email" do
    user2 = build(:user, email: @user1.email )

    expect(user2).to_not be_valid
  end
end
