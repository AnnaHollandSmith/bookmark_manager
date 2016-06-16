# As a time-pressed user
# So that I can save a website
# I would like to add the site's address and title to my bookmark manager

feature 'user can add link to homepage' do
  scenario 'user adds site address and title to their bookmark manager' do
    visit 'links/add_link'
    fill_in 'name', with: 'This is BBC'
    fill_in 'url', with: 'www.bbc.co.uk'
    click_button 'Add link'
    expect(current_path). to eq '/links'
    expect(page).to have_content ('This is BBC')
  end
end
