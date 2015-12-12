require 'spec_helper'

describe User do

  before(:each) do 
    data = [{
      "address" => {"country"=>"Australia", "state" => "New South Wales"},
      "city"=>"Sydney", "lat" => -33, "lon" => 156
    }].to_json
    stub_request(:any, /.*nominatim.openstreetmap.*/).to_return(status: 200, body: data)
    stub_request(:put, /.*localhost:9200.*/).to_return(status: 200)
  end

  subject { create(:user) }

  it "has a valid factory" do
    expect(subject).to be_valid
  end
  it "is invalid without a name" do
    expect(build(:user, name: nil)).to be_invalid
  end

  it "is invalid without an email" do
    expect(build(:user, email: nil)).to be_invalid
  end

  it "is invalid without a password" do
    expect(build(:user, password: nil)).to be_invalid
  end

  #it "can access assets owned by events it belongs to" do
  # context "with events" do
  #   it "has videos" do
  #     video = create(:video)
  #     user = build(:user)

  #     # expect(user.videos).to eq [video]
  #   end
  # end

  # context "without event" do
  #   it "has no videos" do
  #     expect(subject.videos).to eq []
  #   end
  # end
end