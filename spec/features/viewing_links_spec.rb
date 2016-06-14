#require "../../app"
#require "capybara/rspec"

#As a time-pressed user
#So that I can quickly go to web sites I regularly visit
#I would like to see a list of links on the homepage


feature 'Viewing links' do
  Link.create(url: " http://www.google.co.uk", name: 'google')
  scenario 'user visits homepage and can see links' do
    visit '/'
    expect(page.status_code).to eq 200
    expect(page).to have_content('www.google.co.uk')
  end
end
