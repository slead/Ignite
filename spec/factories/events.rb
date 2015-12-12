FactoryGirl.define do
  factory :event do
    sequence(:name) { |n| "Ignite Test #{n}" }
    sequence(:city) { |n| "City #{n}" }
    url ( "http://www.ignitename.com" )
  end
end