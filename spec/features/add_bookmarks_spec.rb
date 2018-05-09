feature 'Add bookmarks' do
  scenario 'A user can access form to add new bookmark' do
    visit '/'
    click_button 'Add bookmark'
    expect(page).to have_content 'Enter bookmark url:'
  end
  xscenario 'A user can see the added bookmark in the list' do
    visit '/'
    click_button 'Add bookmark'
    fill_in 'new_bookmark', :with => 'http://newurl.com'
    click_button 'Add'
    expect(page).to have_content 'http://newurl.com'
  end
end
