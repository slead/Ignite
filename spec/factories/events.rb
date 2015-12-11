require 'ffaker'

FactoryGirl.define do
  factory :event do
    name ( FFaker::Address.city )
    city ( FFaker::Address.city )
    url ( FFaker::Internet.http_url )
  end
end