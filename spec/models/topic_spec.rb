require 'rails_helper'

RSpec.describe Topic, type: :model do
  let(:image_path) { File.join(Rails.root, 'spec/fixtures/test_image.jpeg') }
  let(:image) { Rack::Test::UploadedFile.new(image_path) }


  it "is valid with correct input" do
    user = FactoryBot.create(:user)
    test_topic = FactoryBot.create(:topic)
    expect(test_topic.valid?).to be true
    # test_topic.valid?
    # expect(test_topic).to be_valid
    test_topic2 = FactoryBot.create(:topic)
    expect(test_topic2.valid?).to be true
  end

  it "is invalid with a duplicate topic_search_id" do
    user = User.create(
      name: "yuto",
      email: "yuto@gmail.com",
      password: "yuto1216"
    )

    test_topic1 = user.topics.create(
      topic_name: "お墓の名前1",
      topic_search_id: "test_topics",
      topic_bio: "test haka",
      topic_image: image
    )

    p test_topic1

    test_topic2 = user.topics.new(
      topic_name: "お墓の名前2",
      topic_search_id: "test_topics",
      topic_bio: "test haka",
      topic_image: image
    )

    test_topic2.valid?
    expect(test_topic2.errors[:topic_search_id]).to include("は不正な値です")
  end

  it "is invalid with invalid topic_search_id" do
    user = User.create(
      name: "yuto",
      email: "yuto@gmail.com",
      password: "yuto1216"
    )

    topic_search_id_arr = ["111", "1234", "abc12", "a-123456", "  "]

    topic_search_id_arr.each do |id|
      test_topic = user.topics.create(
        topic_name: "お墓の名前1",
        topic_search_id: id,
        topic_bio: "test haka",
        topic_image: image
      )
      # test_topic.valid?
      expect(test_topic).to_not be_valid
    end
  end


end
