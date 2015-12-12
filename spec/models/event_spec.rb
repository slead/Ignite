require 'spec_helper'

describe Event do

  it "has a valid factory" do

    data = [{"country_name"=>"Australia", "city"=>"Sydney", "latitude"=>47.6801, "longitude"=>-122.1206}].to_json
    stub_request(:any, /.*nominatim.openstreetmap.*/).to_return(status: 200, body: data)
    stub_request(:put, /.*localhost:9200.*/).to_return(status: 200)
    expect(create(:event)).to be_valid
  end

  # it "is invalid without a name" do
  #   expect(build(:event, name: nil)).to be_invalid
  # end

  # it "is invalid without a city" do
  #   expect(build(:event, city: nil)).to be_invalid
  # end

  # it "is invalid without a URL" do
  #   expect(build(:event, url: nil)).to be_invalid
  # end

end