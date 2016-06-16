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

#As a time-pressed user
#So that I can organise my links into different categories for ease of search
#I would like to add tags to the links in my bookmark manager
scenario 'I can add multiple tags to a new link' do
  visit '/add_link'
  fill_in 'url',   with: 'http://www.makersacademy.com/'
  fill_in 'name', with: 'Makers Academy'
  fill_in 'tags',  with: 'education ruby'
  click_button 'Add link'
  link = Link.first
  expect(link.tags.map(&:name)).to include('education', 'ruby')
end

end
