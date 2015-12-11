require 'spec_helper'

describe Event do
  it "has a valid factory" do
    expect(build(:event)).to be_valid
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