describe("product navigation tests", () => {
  beforeEach(() => {
    cy.visit("/");
  });
  it("should be on the homepage and then navigate to a product", () => {
    cy.contains("Jungle");
    cy.get(".products article").first().click();
  });
});
