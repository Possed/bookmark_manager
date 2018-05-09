feature 'Check URL Validity' do
  scenario 'Alert user if url is not valid' do
    visit '/'
    click_button 'Add bookmark'
    fill_in 'new_bookmark', :with => 'http:||fsdfdssd'
    click_button 'Add'
    expect(page).to have_content 'Error! Wrong URL'
  end
end
