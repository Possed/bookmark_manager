feature 'Add bookmarks' do
  scenario 'A user can access form to add new bookmark' do
    visit '/'
    click_button 'Add bookmark'
    expect(page).to have_content 'Enter bookmark url:'
  end
  scenario 'A user can see the added bookmark in the list' do
    visit '/'
    click_button 'Add bookmark'
    fill_in 'new_bookmark', :with => 'http://newurl.com'
    fill_in 'new_title', :with => 'newurl'
    click_button 'Add'
    click_button 'Homepage'
    click_button 'View bookmarks'
    expect(page).to have_content 'newurl'
  end
end
