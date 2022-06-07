describe("product navigation tests", () => {
  beforeEach(() => {
    cy.visit("/");
  });
  it("should be on the homepage and then navigate to a product", () => {
    cy.contains("Jungle");
    cy.contains("My Cart (0)");
    cy.contains(".btn", "Add").first().click({ force: true });
    cy.contains("My Cart (1)");
  });
});
