Given('I am on the home page') do
    visit('/')
end
  
When('I follow {string}') do |string|
    click_link(string)
end
  
Then('I should be on the home page') do
    expect(page).to have_current_path('/movies')
end

Given('I am on the create_new_movie page') do
    visit('/movies/new')
end
  
Given('I am on searching TMDb for {string} page') do |string|
    visit('/movies/tmdb_search?key='+string)
end

Then('I should see {string}') do |string|
    expect(page).to have_content(string)
end

Then('I should see button {string}') do |string|
    expect(page).to have_content(string)
end
  
When('I fill in {string} with {string}') do |string, string2|
    fill_in(string, with: string2)
end
  
When('I click {string}') do |string|
    click_button(string)
end
  
Then('I should not see {string}') do |string|
    expect(page).not_to have_content(string)
end

When('I select {string} in {string}') do |string, string2|
    select(string, from: string)
  end


When('I pick {string} radio btn') do |string|
    choose(option: string)
end
