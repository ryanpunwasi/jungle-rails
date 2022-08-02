describe("Product Details Page", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000");
  });

  it("shows an individual product when article element is clicked on", () => {
    cy.get(".products article").first().click();
    cy.get("article h1").should("have.text", "Scented Blade");
  });
});
