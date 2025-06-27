Feature: Edge Cases
  As a user, I want the app to handle edge cases gracefully.

  Scenario: Add zero quantity to cart
    Given I am on the GreenKart home page
    When I try to add zero quantity of "Brocolli - 1 Kg" to the cart
    Then I should see an error or no action

  Scenario: Remove all products from cart and try to checkout
    Given I have products in the cart
    When I remove all products and try to checkout
    Then I should see a message indicating the cart is empty

  Scenario: Add products, refresh the page, and verify cart persistence
    Given I have products in the cart
    When I refresh the page
    Then the cart should still contain the products
