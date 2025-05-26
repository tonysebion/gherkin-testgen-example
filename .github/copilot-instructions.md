<!-- Use this file to provide workspace-specific custom instructions to Copilot. For more details, visit https://code.visualstudio.com/docs/copilot/copilot-customization#_use-a-githubcopilotinstructionsmd-file -->

# Workspace E2E Testing & Automation Overview

This project uses both Cucumber.js (with Playwright) and standalone Playwright for end-to-end testing. All test code, step definitions, and Playwright tests are auto-generated and kept in sync with `.feature` files. The workflow is designed for maintainability, robustness, and minimal manual intervention.

## Test Structure
1. **Cucumber/Gherkin Tests:**
   - Feature files: `/features/` (with subdirectories for each domain)
   - Step definitions: `/step_definitions/` (mirrors the `features/` structure; one file per feature, no shared/common step files)
   - Support code: `/features/support/`

2. **Playwright Tests:**
   - Test files: `/tests/` (mirrors the `features/` structure)
   - Configuration: `playwright.config.ts` (uses `baseUrl` from `test.config.json`)

## Configuration
- The base URL for all tests is set in `test.config.json` (e.g., `{ "baseUrl": "http://sitetotest" }`).
- All generated test and step code must reference this config for the test server address (never hardcode URLs).

## Automation & Workflow
- **Test/Step Generation:**
  - Run `node scripts/generate-tests.js <feature-file>` to generate or update step definitions and Playwright tests for a feature file.
  - All generated files mirror the feature file directory structure and use the correct extensions.
  - Parameter/selector mapping is generic and customizable via `scripts/fieldMappings.js`.
- **File Watchers:**
  - `scripts/watch-features.js`: Watches `.feature` files and auto-generates/updates tests and step definitions on changes.
  - `scripts/watch-step-definitions.js`: Watches step definition files and re-runs Cucumber tests on changes.
- **Step Definitions:**
  - Each feature gets its own step definition file (no shared/common files).
  - Ambiguous or duplicate steps are resolved by keeping steps unique to each file.
  - Missing step stubs are added automatically based on Cucumber feedback.
- **Playwright Test Generation:**
  - Playwright tests are generated for each feature, using selectors and parameter mappings from `fieldMappings.js`.
  - All navigation uses the dynamic `baseUrl` from config.
- **Error Handling:**
  - Parent directories are always created before reading/writing generated files to prevent ENOENT errors.
  - If a step definition file does not exist, it is created with the correct import/comment structure.

## Running Tests
- **Run All Tests:** Executes both Cucumber and Playwright test suites (`npm run test:e2e`)
- **Run Playwright Tests:** Runs only Playwright tests (`npm run test:playwright`)
- **Run Cucumber Tests:** Runs only Cucumber tests (`npm run test:cucumber`)

## Notes
- Tests expect a running server at the URL specified in `test.config.json`.
- All automation scripts and conventions are designed to minimize manual maintenance and keep tests in sync with features.
- For advanced customization (e.g., scenario outlines, selector inference), see `scripts/fieldMappings.js` and the main generator script.
