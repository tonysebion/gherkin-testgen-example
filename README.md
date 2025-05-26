# Playwright + Cucumber E2E Testing Setup

This project is set up for end-to-end testing using Playwright and Cucumber (Gherkin feature files) with TypeScript.

## Getting Started

- Place your `.feature` files in the `features/` directory.
- Step definitions go in `features/step_definitions/`.
- Run tests with `npx cucumber-js`.

## Useful Scripts
- `npm run test:e2e` - Run Cucumber/Gherkin tests (starts server automatically)
- `npm run start` - Start the web server manually

## Project Structure
- `features/` - Gherkin feature files and step definitions
- `public/` - Static web files (HTML, CSS, JS)
- `src/` - Server implementation

---

# run freshly generated cucumber tests with this prompt
run the cucumber tests, and take actions based on the instructions in the /prompts/on-step-definition-change based on any tests that aren't successful or aren't populated appropriately.