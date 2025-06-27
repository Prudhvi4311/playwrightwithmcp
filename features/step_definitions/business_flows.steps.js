
const { Given, When, Then, setDefaultTimeout, AfterAll, Before } = require('@cucumber/cucumber');
const { expect } = require('@playwright/test');
const HomePage = require('../../pageObjects/HomePage');
setDefaultTimeout(60 * 1000);

Given('I am on the GreenKart home page', async function () {
  if (!this.page) {
    const playwright = require('playwright');
    this.browser = await playwright.chromium.launch({ headless: true });
    this.page = await this.browser.newPage();
  }
  this.homePage = new HomePage(this.page);
  await this.homePage.goto();
});

When('I search for {string}', async function (product) {
  await this.homePage.search(product);
});

Then('I should see {string} in the results', async function (product) {
  const count = await this.homePage.getProductCountByName(product);
  expect(count).toBeGreaterThan(0);
});

Then('I should see products containing {string} in the results', async function (partial) {
  const found = await this.homePage.getProductsContaining(partial);
  expect(found).toBe(true);
});

Then('I should see no products in the results', async function () {
  const count = await this.homePage.getTotalProducts();
  expect(count).toBe(0);
});


// Retry failed scenarios up to 2 times
Before(function () {
  this.retries = 2;
});

AfterAll(async function () {
  if (this.page) await this.page.close();
  if (this.browser) await this.browser.close();
});
