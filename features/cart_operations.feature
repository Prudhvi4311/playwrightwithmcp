Feature: Cart Operations
  As a user, I want to manage my cart so that I can purchase products efficiently.

  Scenario: Add a single product to the cart
    Given I am on the GreenKart home page
    When I add "Brocolli - 1 Kg" to the cart
    Then the cart should contain "Brocolli - 1 Kg" with quantity 1

  Scenario: Add multiple different products to the cart
    Given I am on the GreenKart home page
    When I add "Brocolli - 1 Kg" and "Carrot - 1 Kg" to the cart
    Then the cart should contain both products

  Scenario: Increase quantity of a product before adding to cart
    Given I am on the GreenKart home page
    When I increase the quantity of "Brocolli - 1 Kg" to 3 and add to cart
    Then the cart should contain "Brocolli - 1 Kg" with quantity 3

  Scenario: Add the same product multiple times and verify quantity
    Given I am on the GreenKart home page
    When I add "Brocolli - 1 Kg" to the cart twice
    Then the cart should contain "Brocolli - 1 Kg" with quantity 2

  Scenario: Remove a product from the cart
    Given I have "Brocolli - 1 Kg" in the cart
    When I remove "Brocolli - 1 Kg" from the cart
    Then the cart should not contain "Brocolli - 1 Kg"
