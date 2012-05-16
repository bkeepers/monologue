Feature: Posting Statuses

  Scenario: Succesfully posting a status
    When I am on the home page
    And I fill in "Status" with "Integration testing helps ensure your coworkers don't break shit"
    And I press "Post Update"
    Then I should see "Integration testing helps ensure your coworkers don't break shit"

  Scenario: Viewing previous status updates
    Given the following statuses exist:
      | This is outside-in development |
      | It's not so bad                |
    When I am on the home page
    Then I should see "This is outside-in development"
    And I should see "It's not so bad"
