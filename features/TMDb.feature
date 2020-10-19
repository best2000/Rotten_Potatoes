Feature: User can look for movie by searching for it in TMDb

Scenario: Try to search for non-exis movie 
  Given I am on the home page
  Then I should see "Add from TMDb"
  When I fill in "key" with "dsad"
  And I click "TMDb Search"
  Then I should see "Search Result"
  And I should not see "dsad"

Scenario: Try to search for exist movie 
  Given I am on the home page
  Then I should see "Add from TMDb"
  When I fill in "key" with "ไอ้เหล็กไหล"
  And I click "TMDb Search"
  Then I should see "Search Result"
  And I should see "ไอ้เหล็กไหล"