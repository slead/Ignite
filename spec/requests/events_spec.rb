require 'spec_helper'

describe "Events" do

  it "Signs in as an administrator", js: true do
    DatabaseCleaner.clean

    # Create an Admin user
    admin = FactoryGirl.create(:role, name:"admin")
    user = FactoryGirl.create(:user, role: admin)

    visit "/users/sign_in"
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign in'

    visit "/events/new"
    expect(page).to have_content "Add a new Ignite"

  end
end