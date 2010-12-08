Feature: Follow twiddr users
  So that I can see what they have to say
  As a twiddr user
  I can follow other twiddr user

  Scenario: Follow another twiddr user
    Given the following email confirmed user exists:
      | twiddr_name | email                |
      | bob         | bob@example.com      |
    And I have signed in with "hgimenez@example.com/test"
    When I go to the profile page for "bob"
    And I press "Follow bob"
    Then I should be on the home page
    And I should see "You are now following bob!"
    And I should see "bob" within "div.folowing"
