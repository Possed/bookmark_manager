feature 'Deleting bookmarks' do
  scenario 'should remove title and url from database' do
    visit'/'
    click_button 'Add bookmark'
    fill_in 'new_bookmark', :with => 'http://google.com'
    fill_in 'new_title', :with => 'google'
    click_button 'Add'
    click_button 'Homepage'
    click_button 'Delete bookmark'
    fill_in 'title', :with => 'google'
    click_button 'Delete'
    click_button 'View bookmarks'
    expect(page).not_to have_content 'google'
  end
end
