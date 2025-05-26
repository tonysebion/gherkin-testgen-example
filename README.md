# gherkin-testgen-example: Automated E2E Test Generation from Gherkin

This repository is an example project demonstrating how to automatically generate Playwright and Cucumber (Gherkin) end-to-end (E2E) tests from feature files using a modular, config-driven Node.js test generation system. It is designed as a reference for teams or individuals looking to:

- Keep E2E tests and step definitions in sync with Gherkin `.feature` files
- Maintain a clean repository by excluding generated test code
- Easily extend or adapt the test generation workflow for their own projects

---

## What This Example Shows
- **Feature-Driven Test Generation:**
  - Place your Gherkin `.feature` files in the `features/` directory (with subdirectories as needed).
  - When you run the test generation tool (see below), Playwright test files and Cucumber step definition files are automatically created in `./tests/` and `./step_definitions/`, mirroring the feature file structure.
- **Generated Code is Not Tracked:**
  - The `./tests` and `./step_definitions` directories are excluded from version control via `.gitignore`.
  - This keeps your repository focused on source, configuration, and feature files only.
- **Modular, Configurable System:**
  - All paths and the test server URL are set in `test.config.json`.
  - The project is ready for further extension, including custom templates, selector heuristics, and CLI enhancements.
- **Ready for Integration:**
  - While this example does not include scripts to run Playwright or Cucumber tests directly, it is structured for easy integration with CI/CD or local test runners in the future.

---

## How to Use This Example

1. **Install dependencies:**
   ```sh
   npm install
   ```
2. **Add or edit `.feature` files** in the `features/` directory.
3. **Generate tests and step definitions:**
   - Use the [Gherkin Test Generation Tool](https://github.com/tonysebion/gherkin-testgen) (replace with your actual tool or package name) to process your feature files:
   ```sh
   npx gherkin-testgen --dir features
   # or use your project's CLI/watcher scripts if available
   ```
   - This will create or update files in `./tests/` and `./step_definitions/`.
4. **Run tests (optional, for future expansion):**
   - The project is ready for Playwright and Cucumber test execution, but does not include custom scripts for this yet. You can add these as needed.

---

## Project Structure
- `features/` - Gherkin feature files (source of truth for test generation)
- `step_definitions/` - Generated Cucumber step definitions (not tracked in Git)
- `tests/` - Generated Playwright tests (not tracked in Git)
- `scripts/` - (If present) Test/step generation logic, CLI, and watcher scripts
- `test.config.json` - Central config for baseUrl and paths
- `playwright.config.ts` - Playwright config (uses `test.config.json`)
- `.gitignore` - Ignores generated files

---

## Why Generated Files Are Not Tracked
This example follows best practices by keeping all generated code (tests and step definitions) out of version control. This ensures that your repository only contains source files, configuration, and feature specifications. Generated files are always up-to-date with your feature files and can be re-created at any time using the test generation tool.

---

## Extending This Example
- Add scripts or CI workflows to run Playwright and Cucumber tests as needed.
- Customize the test generation logic, templates, or config to fit your application's needs.
- Integrate with your own test runner or automation pipeline.

---

## License
MIT
