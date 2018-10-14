require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a name, email, password" do
    user = User.new(
      name: "Yuuuto",
      email: "yuto@gmail.com",
      password: "yuto1216",
    )
    expect(user).to be_valid
  end

  it "is invalid without a name" do
    user = User.new(name: nil)
    # expect(user.valid?).to_not be_valid
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end

  it "is invalid with invalid email" do
    emails = ["aaa", "aaaaa@aaaaa", "/aaaaa@gmail.com", "aaaa@gamai."]
    count = 1
    emails.each do |email_test|
      user = User.new(
        name: "Yuuuto",
        email: email_test,
        password: "aaaaaaa1111111",
      )
      user.valid?
      p count.to_s + email_test
      expect(user.errors[:email]).to include("は不正な値です")
      count += 1
    end
  end

  it "is invalid with ununique email" do
    user = User.create(
      name: "yuuuuto",
      email: "yuto@gmail.com",
      password: "abcd1234"
    )
    other_user = User.new(
      name: "yuuuuto",
      email: "yuto@gmail.com",
      password: "abcd1234"
    )

    other_user.valid?
    expect(other_user.errors.count).to eq 1
    expect(other_user.errors[:email]).to include("はすでに存在します")
  end

  it "is invalid with short password" do
    user = User.new(password: "1")
    user.valid?
    expect(user.errors[:password]).to include("は6文字以上で入力してください")
  end

end
