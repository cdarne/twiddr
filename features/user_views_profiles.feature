Feature: user profiles
  In order to see if I'm interested in following other users
  As a twiddr user
  I can see other user's profiles

  Scenario: View user's profile
    Given the following email confirmed user exists:
      | twiddr_name | email                |
      | hgimenez    | hgimenez@example.com |
    Given I have signed in with "me@example.com/test"
    When I go to the profile page for "hgimenez"
    Then I should see "hgimenez" within "div.twiddr_name"
    And I should see "hgimenez@example.com" within "div.email"
    And I should see "Follow"
