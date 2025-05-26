# gherkin-testgen-example: Playwright + Cucumber E2E Test Generation

This project demonstrates automated end-to-end (E2E) test generation and synchronization using Playwright and Cucumber (Gherkin feature files) with TypeScript. All test code, step definitions, and Playwright tests are auto-generated and kept in sync with `.feature` files for robust, low-maintenance testing.

---

## Features
- **Auto-generation:** Step definitions and Playwright tests are generated from Gherkin `.feature` files.
- **Config-driven:** All paths and the test server URL are set in `test.config.json`.
- **Modular scripts:** Core logic is split into reusable modules for config, file I/O, path utilities, and code generation.
- **Watchers & CLI:** Scripts/watchers keep tests and steps in sync with features automatically.
- **No generated files in Git:** `tests/` and `step_definitions/` are ignored by Git.

---

## Getting Started

1. **Install dependencies:**
   ```sh
   npm install
   ```
2. **Add or edit `.feature` files** in the `features/` directory (subdirectories per domain are supported).
3. **Generate tests and step definitions:**
   ```sh
   node scripts/bin/generate-tests.js <feature-file>
   # or use the CLI/watcher for auto-generation
   ```
4. **Run tests:**
   - All E2E tests: `npm run test:e2e`
   - Playwright only: `npm run test:playwright`
   - Cucumber only: `npm run test:cucumber`

---

## Project Structure
- `features/` - Gherkin feature files (with subdirectories per domain)
- `step_definitions/` - Generated Cucumber step definitions (mirrors `features/` structure)
- `tests/` - Generated Playwright tests (mirrors `features/` structure)
- `scripts/` - Test/step generation logic, CLI, and watcher scripts
- `test.config.json` - Central config for baseUrl and paths
- `playwright.config.ts` - Playwright config (uses `test.config.json`)
- `.gitignore` - Ignores generated files

---

## Automation & Workflow
- **Test/Step Generation:**
  - Run `node scripts/bin/generate-tests.js <feature-file>` to generate or update step definitions and Playwright tests for a feature file.
  - All generated files mirror the feature file directory structure and use the correct extensions.
- **File Watchers:**
  - `scripts/bin/watch-features.js`: Watches `.feature` files and auto-generates/updates tests and step definitions on changes.
  - `scripts/bin/watch-step-definitions.js`: Watches step definition files and re-runs Cucumber tests on changes.
- **Step Definitions:**
  - Each feature gets its own step definition file (no shared/common files).
  - Missing step stubs are added automatically based on Cucumber feedback.
- **Playwright Test Generation:**
  - Playwright tests are generated for each feature, using selectors and parameter mappings from `scripts/fieldMappings.js`.
  - All navigation uses the dynamic `baseUrl` from config.
- **Error Handling:**
  - Parent directories are always created before reading/writing generated files to prevent ENOENT errors.
  - If a step definition file does not exist, it is created with the correct import/comment structure.

---

## Configuration
- The base URL for all tests is set in `test.config.json` (e.g., `{ "baseUrl": "http://localhost:3000" }`).
- All generated test and step code must reference this config for the test server address (never hardcode URLs).

---

## Contributing
- Please open issues or pull requests for improvements, bug fixes, or new features.
- See the code in `scripts/` for extension points and customization.

---

## License
MIT