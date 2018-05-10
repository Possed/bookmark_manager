feature 'View bookmarks' do
  scenario 'A user can see bookmarks' do
    add_bookmarks
    visit '/bookmarks'
    expect(page).to have_content 'makersacademy'
    expect(page).to have_content 'google'
  end
end
