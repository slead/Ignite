FactoryGirl.define do
  factory :video do
    sequence(:title) { |n| "title #{n}" }
    sequence(:description) { |n| "Lorem ipsum #{n}" }
    sequence(:uid) { |n| "UID #{n}" }
    url { "http://www.youtube.com/watch?v=abc" }
    event
    sequence(:speaker_name) { |n| "John #{n}" }
  end
end