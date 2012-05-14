Feature: Posting Statuses

  Scenario: Succesfully posting a status
    When I am on the home page
    And I fill in "Status" with "Integration testing helps ensure your coworkers don't break shit"
    And I press "Post Update"
    Then I should see "Integration testing helps ensure your coworkers don't break shit"