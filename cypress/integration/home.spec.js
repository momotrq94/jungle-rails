describe("homepage tests", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("should be on the homepage", () => {
    cy.contains("Jungle");
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
});
