feature 'clickable title links' do
  scenario 'redirects to url ' do
    visit'/'
    click_button 'Add bookmark'
    fill_in 'new_bookmark', :with => 'http://google.com'
    fill_in 'new_title', :with => 'google'
    click_button 'Add'
    click_button 'Homepage'
    click_button 'View bookmarks'
    click_link 'google'
    expect(page.current_url).to eq 'http://google.com/'

  end
end
