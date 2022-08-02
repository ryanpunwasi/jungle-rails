describe("Cart Funtionality", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000");
  });

  it("should add item to cart when add button is clicked", () => {
    cy.get("a").contains("My Cart (0)"); // Check that cart is empty
    cy.get("button").contains("Add").click({ force: true });
    cy.get("a").contains("My Cart (1)"); // Check that cart count incremented by one
  });
});
