Feature: click at "Rotten Potatoes" and it make user go to home page back 

Scenario: click banner
  Given I am on the home page
  When I follow "Rotten Potatoes"
  Then I should be on the home page

Scenario: click banner on create page
  Given I am on the create_new_movie page
  When I follow "Rotten Potatoes"
  Then I should be on the home page

Scenario: click banner on Tmdb search result page
  Given I am on searching TMDb for "300" page 
  When I follow "Rotten Potatoes"
  Then I should be on the home page