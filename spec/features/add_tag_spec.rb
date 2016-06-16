feature 'Adding tag to a link' do
  scenario 'user adds tag to a link on bookmark manager ' do
    visit '/add_link'
    fill_in 'name', with: 'This is BBC'
    fill_in 'url', with: 'www.bbc.co.uk'
    fill_in 'tags', with: 'news'
    click_button 'Add link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('news')
  end
end
