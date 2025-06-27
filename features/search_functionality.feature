Feature: Search Functionality
  As a user, I want to search for products so that I can find and add them to my cart.

  Scenario: Search for an existing product by full name
    Given I am on the GreenKart home page
    When I search for "Brocolli"
    Then I should see "Brocolli - 1 Kg" in the results

  Scenario: Search for a product by partial name
    Given I am on the GreenKart home page
    When I search for "Bro"
    Then I should see products containing "Bro" in the results

  Scenario: Search for a non-existent product
    Given I am on the GreenKart home page
    When I search for "Dragonfruit"
    Then I should see no products in the results
