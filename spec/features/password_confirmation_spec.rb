require './app/app'

RSpec.feature "Password confirmation", :type => :feature do
  scenario "User enters incorrect password" do
    DatabaseCleaner.clean
    signup
    fill_in('password_confirmation', with: 'wrongpassword')
    click_button('Submit')
    expect(current_path).to eq '/users/new'
    expect(page).to have_content("Passwords don't match")
  end


end
