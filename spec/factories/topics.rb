FactoryBot.define do
  factory :topic do
    topic_name "test_topic"
    sequence(:topic_search_id) { |n| "#{n}testtopic" }
    topic_image Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test_image.jpeg'))
    topic_bio "test topic bio"
    association :user
  end
end
