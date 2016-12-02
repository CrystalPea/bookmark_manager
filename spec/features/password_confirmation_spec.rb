require './app/app'

RSpec.feature "Password confirmation", :type => :feature do
  scenario "User enters incorrect password" do
    DatabaseCleaner.clean
    user_count = User.all.count
    signup
    fill_in('password_confirmation', with: 'wrongpassword')
    click_button('Submit')
    expect(current_path).to eq '/users/new'
    expect(page).to have_content("Passwords don't match")
    expect(User.all.count).to eq (user_count)
  end


end
