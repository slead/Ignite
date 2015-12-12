FactoryGirl.define do
  factory :event do
    sequence(:name) { |n| "Ignite Test #{n}" }
    sequence(:city) { |n| "Sydney #{n}" }
    url ( "http://www.ignitesydney.com" )
  end
end