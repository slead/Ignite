FactoryGirl.define do
  factory :video do
    sequence(:title) { |n| "title #{n}" }
    sequence(:description) { |n| "Lorem ipsum #{n}" }
    uid { "AlkKPojdVAk" }
    url { "http://www.youtube.com/watch?v=AlkKPojdVAk" }
    event
    sequence(:speaker_name) { |n| "John #{n}" }
  end
end