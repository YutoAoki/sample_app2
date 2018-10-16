require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    FactoryBot.build(:user)
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "is valid with a name, email, password" do
    user = FactoryBot.create(:user)
    expect(user).to be_valid
  end

  it "is invalid without a name" do
    user = FactoryBot.build(:user, name: nil)
    # expect(user.valid?).to_not be_valid
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end

  it "is invalid with invalid email" do
    emails = ["aaa", "aaaaa@aaaaa", "/aaaaa@gmail.com", "aaaa@gamai."]
    count = 1
    emails.each do |email_test|
      user = FactoryBot.build(:user, email: email_test)
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
      count += 1
    end
  end

  it "is invalid with ununique email" do
    user = FactoryBot.create(:user)
    other_user = FactoryBot.build(:user, email: user.email)

    other_user.valid?
    expect(other_user.errors.count).to eq 1

    expect(other_user.errors[:email]).to include("はすでに存在します")
  end

  it "is invalid with short password" do
    user = User.new(password: "1")
    user.valid?
    expect(user.errors[:password]).to include("は6文字以上で入力してください")
  end

  it "can remember user digest & token" do
    user = FactoryBot.create(:user)
    user.remember
    token = user.remember_token
    expect(user.authenticated?(token)).to be true
  end

  it "is create valid 2 users" do
    user1 = FactoryBot.create(:user)
    user2 = FactoryBot.create(:user)
  end

  it "is saved as downcase" do
    email = "EMAIL@gmail.com"
    user = FactoryBot.build(:user, email: email)
    user.save
    expect(user.email).to eq email.downcase
  end

  it "name is invalid with 51 legth name" do
    name = "a" * 51
    user = FactoryBot.build(:user, name: name)
    expect(user).to_not be_valid
  end

  it "become nil with forget method" do
    user = FactoryBot.build(:user)
    user.remember
    user.forget
    expect(user.remember_digest.nil?).to eq true
  end

  it "is secure password" do
    user = FactoryBot.build(:user, password: "abc123")
    user.save
    expect(user.password_digest).not_to eq "abc123"
  end

end
