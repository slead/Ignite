require 'rails_helper'

describe Video do
  it "has a valid factory" do
    expect(build(:video)).to be_valid
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