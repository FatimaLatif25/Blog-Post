require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = build(:user)
    expect(user).to be_valid
  end

  it "is invalid without username" do
    user = build(:user, username: nil)
    expect(user).to_not be_valid
  end

  it "is invalid without email" do
    user = build(:user, email: nil)
    expect(user).to_not be_valid
  end
  it "is invalid without password" do
    user = build(:user, password: nil)
    expect(user).to_not be_valid
  end
end
