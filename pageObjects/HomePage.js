class HomePage {
  constructor(page) {
    this.page = page;
    this.searchInput = '.search-keyword';
    this.productCard = '.products .product';
  }

  async goto() {
    await this.page.goto('https://rahulshettyacademy.com/seleniumPractise/#/');
  }

  async search(product) {
    await this.page.fill(this.searchInput, product);
    await this.page.waitForTimeout(1000);
  }

  async getProductCountByName(name) {
    return await this.page.locator(`${this.productCard}:has-text(\"${name}\")`).count();
  }

  async getProductsContaining(partial) {
    const results = await this.page.locator(this.productCard);
    let found = false;
    for (let i = 0; i < await results.count(); i++) {
      const text = await results.nth(i).textContent();
      if (text && text.includes(partial)) found = true;
    }
    return found;
  }

  async getTotalProducts() {
    return await this.page.locator(this.productCard).count();
  }
}

module.exports = HomePage;
