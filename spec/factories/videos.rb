require 'ffaker'

FactoryGirl.define do
  factory :video do
    title ( FFaker::BaconIpsum.phrase)
    description ( FFaker::BaconIpsum.paragraph )
    uid ( FFaker::Internet.domain_word)
    url ( "http://www.youtube.com/watch?v=" + FFaker::Internet.domain_word)
    event ( Event.create(name: "Ignite " + FFaker::Address.city, city: FFaker::Address.city, url:FFaker::Internet.http_url))
    speaker_name ( FFaker::Name.name )

  end
end