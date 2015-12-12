require 'rails_helper'

describe Video do
  before(:each) do 
    mapData = [{
      "address" => {"country"=>"Australia", "state" => "New South Wales"},
      "city"=>"Sydney", "lat" => -33, "lon" => 156
    }].to_json
    ytData = {
      "view_count" => 0, "like_count" => 0, "dislike_count" => 0
      }.to_json
    stub_request(:any, /.*nominatim.openstreetmap.*/).to_return(status: 200, body: mapData)
    stub_request(:any, /.*www.googleapis.com.*/).with(:headers => {'Content-Length'=>'0', 'User-Agent'=>'Yt::Request (gzip)'}).to_return(status: 200, body: ytData)
    stub_request(:put, /.*localhost:9200.*/).to_return(status: 200)
  end

  it "has a valid factory" do
    # video = build(:video)
    # byebug
    # expect(build(:video)).to be_valid
    expect(create(:video)).to be_valid
  end

  it "is invalid without a title" do
    expect(build(:video, title: nil)).to be_invalid
  end

  it "is invalid without a description" do
    expect(build(:video, description: nil)).to be_invalid
  end

  it "is invalid without an event" do
    expect(build(:video, event: nil)).to be_invalid
  end

  it "is invalid without a URL" do
    expect(build(:video, url: nil)).to be_invalid
  end

  it "is invalid without a uID" do
    expect(build(:video, uid: nil)).to be_invalid
  end

  it "is invalid without a YouTube-style URL" do
    expect(build(:video, url: "www.smh.com.au")).to be_invalid
  end


end