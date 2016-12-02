require './app/app'

RSpec.feature "Email validation", :type => :feature do
  scenario "User tries to enter blank email" do
    DatabaseCleaner.clean
    user_count = User.all.count
    visit '/users/new'
    fill_in('email', with: '')
    fill_in('password', with: 'woo')
    fill_in('password_confirmation', with: 'woo')
    click_button('Submit')
    expect(current_path).to eq '/users/new'
    expect(page).to have_content("Please enter a correct email address")
    expect(User.all.count).to eq (user_count)
  end


end
