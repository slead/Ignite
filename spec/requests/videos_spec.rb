require 'spec_helper'

describe "Videos" do
  describe "View videos" do
    it 'Opens the homepage' do
      visit "/videos"
      expect(page).to have_content "Watch Ignite videos"
    end
  end
end