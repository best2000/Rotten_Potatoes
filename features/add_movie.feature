Feature: User can add movie

Scenario: Add movie manually
  Given I am on the home page
  And I follow "Add movie manually"
  Then I should see "Add New Movie"
  When I fill in "movie[name]" with "Joker"
  And I fill in "movie[len]" with "100"
  And I fill in "movie[gen]" with "Comedy"
  And I fill in "movie[des]" with "He is here to kill everyone."
  And I click "Submit"
  Then I should see "Movie Info & Management"
  And I should see "Name"
  And I should see "Joker"
  And I should see button "Edit"
  And I should see button "Delete"

Scenario: Add movie from TMDb
  Given I am on the home page
  Then I should see "Add from TMDb"
  When I fill in "key" with "Teketeke"
  And I click "TMDb Search"
  Then I should see "Search Result"
  And I should see "Teketeke 2009-03-21"
  When I pick "101981" radio btn 
  And I click "Next"
  Then I should see "Add movie"
  And I should see "Descriptions:"
  And I should see "The upper torso of a female, claws her way around Japan searching for her lower half."
  When I click "Submit"
  Then I should see "Movie Info & Management"
  And I should see "Name"
  And I should see "Teke Teke"
  And I should see button "Edit"
  And I should see button "Delete"