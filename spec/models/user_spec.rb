require 'spec_helper'

describe User do
  subject { build(:user) }

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
  context "with events" do
    it "has videos" do
      video = create(:video)
      event = video.event
      user = build(:user, events: [event])

      expect(user.videos).to eq [video]
    end
  end

  context "without event" do
    it "has no videos" do
      expect(subject.videos).to eq []
    end
  end
end