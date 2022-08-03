describe("Jungle Authentication", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000");
  });

  it("should successfully log in a valid user", () => {
    cy.get("a").contains("Log In").click();
    cy.get("[name='email']").type("nolan@vmail.com");
    cy.get("[name='password']").type("viltrumite");
    cy.get("input").contains("Log In").click();
    cy.contains("Logout");
  });

  it("should redirect to login on failed authentication", () => {
    cy.get("a").contains("Log In").click();
    cy.get("[name='email']").type("nolan@vmail.com");
    cy.get("[name='password']").type("wrong_password");
    cy.get("input").contains("Log In").click();
    cy.contains("Login");
  });

  it("should successfully register a user", () => {
    cy.get("a").contains("Sign Up").click();
    cy.get("[name='user[first_name]']").type("Mark", { force: true });
    cy.get("[name='user[last_name]']").type("Grayson");
    cy.get("[name='user[email]']").type("mark@vmail.com");
    cy.get("[name='user[password]']").type("viltrumite");
    cy.get("[name='user[password_confirmation]']").type("viltrumite");
    cy.get("input").contains("Submit").click();
    cy.contains("Logout");
  });
});
