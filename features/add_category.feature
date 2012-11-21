Feature: Article Categories
  As a blog administrator
  In articles to be divided into categories
  I want to be able to manage categories

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Add category
    Given I am on the admin content page
    And I follow "Categories"
    Then I should be on the new category page
    When I fill in "category_name" with "Nonsense"
    When I fill in "category_description" with "God save the queen"
    And I press "Save"
    Then I should be on the new category page
    And I should see "Category was successfully saved."
    And I should see "Nonsense"
    And I should see "God save the queen"
