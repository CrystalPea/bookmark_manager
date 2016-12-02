require './app/app'

RSpec.feature "Signing up", :type => :feature do
  scenario "user creates an account" do
    DatabaseCleaner.clean
    user_count = User.all.count
    visit '/users/new'
    fill_in('email', with: 'doodle@diddle.do')
    fill_in('password', with: 'bamboozlediddledoodledoo')
    click_button('Submit')
    expect(current_path).to eq '/links'
    message = "Welcome to your bookmark manager, doodle@diddle.do"
    expect(page).to have_content(message)
    expect(User.all.count).to eq (user_count + 1)
  end

  end
