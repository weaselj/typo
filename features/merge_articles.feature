Feature: Merge Articles
  As a blog administrator
  In order to prevent similiar ideas in different articles
  I want to be able to merge articles in my blog

  Background:
    Given the blog is set up
    And I add user publisher as publisher
    And I create article "Foo" with text "Bla bla bla" as publisher
    And I add comment "Ta ta ta" to article "Foo" as "George"
    And I create article "Boo" with text "Ga ga ga" as admin
    And I add comment "Ha ha ha" to article "Foo" as "Alice"

  Scenario: When articles are merged, the merged article should contain the text of both previous articles
    Given I am logged in as admin
    And I go to the admin content page
    And I follow "Foo"
    Then I should see "Merge Articles"
    When I fill in "merge_with" with id of "Boo"
    And I press "Merge"
    Then I should be on the admin content page
    And I should see "The articles were successfully merged"
    When I go to the home page
    Then I should see "Foo"
    When I follow "Foo"
    Then I should see "Bla bla bla"
    And I should see "Ga ga ga"
    And I should see "Ta ta ta"
    And I should see "Ha ha ha"

  Scenario: A non-admin cannot merge two articles
    Given I am logged in as publisher
    And I go to the admin content page
    And I follow "Foo"
    Then I should not see "Merge Articles"

  Scenario: try to merge when other post is not available
    Given I am logged in as admin
    And I go to the admin content page
    And I follow "Foo"
    Then I should see "Merge Articles"
    When I fill in "merge_with" with "5"
    And I press "Merge"
    Then I should be on the admin content page
    And I should see "Error, Couldn't find Article"
