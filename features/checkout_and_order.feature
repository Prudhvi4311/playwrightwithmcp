Feature: Checkout and Order
  As a user, I want to checkout and place orders securely.

  Scenario: Proceed to checkout with products in the cart
    Given I have products in the cart
    When I proceed to checkout
    Then I should be on the checkout page

  Scenario: Try to checkout with an empty cart
    Given I have no products in the cart
    When I try to proceed to checkout
    Then I should see a message indicating the cart is empty

  Scenario: Apply a valid promo code at checkout
    Given I am on the checkout page with products in the cart
    When I apply a valid promo code
    Then I should see a discount applied

  Scenario: Apply an invalid promo code at checkout
    Given I am on the checkout page with products in the cart
    When I apply an invalid promo code
    Then I should see an error message

  Scenario: Complete purchase and verify order confirmation
    Given I am on the checkout page with products in the cart
    When I place the order
    Then I should see an order confirmation message
