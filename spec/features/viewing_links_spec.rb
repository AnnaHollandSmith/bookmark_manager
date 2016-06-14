#require "../../app"
require "capybara/rspec"


feature 'Viewing links' do
  scenario 'user visits homepage and can see links' do
    visit '/'
    expect(page).to have_content('Link1')
  end
end
