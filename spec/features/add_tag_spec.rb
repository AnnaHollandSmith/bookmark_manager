feature 'Adding tag to a link' do
  scenario 'user adds tag to a link on bookmark manager ' do
    visit '/add_link'
    fill_in 'name', with: 'This is BBC'
    fill_in 'url', with: 'www.bbc.co.uk'
    fill_in 'tag', with: 'news'
    click_button 'Add link'
    expect(current_path). to eq '/'
    expect(page).to have_content 'Tag: news'
  end
end
