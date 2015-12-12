require 'spec_helper'

describe Event do

  before(:each) do 
    data = [{
      "address" => {"country"=>"Australia", "state" => "New South Wales"},
      "city"=>"Sydney", "lat" => -33, "lon" => 156
    }].to_json
    stub_request(:any, /.*nominatim.openstreetmap.*/).to_return(status: 200, body: data)
    stub_request(:put, /.*localhost:9200.*/).to_return(status: 200)
  end

  it "has a valid factory" do
    expect(create(:event)).to be_valid
  end

  it "is invalid without a name" do
    expect(build(:event, name: nil)).to be_invalid
  end

  it "is invalid without a city" do
    expect(build(:event, city: nil)).to be_invalid
  end

  it "is invalid without a URL" do
    expect(build(:event, url: nil)).to be_invalid
  end

end