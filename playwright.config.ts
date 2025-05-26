import { defineConfig, devices } from '@playwright/test';
import * as fs from 'fs';

const config = JSON.parse(fs.readFileSync('./test.config.json', 'utf-8'));

export default defineConfig({
  testDir: './tests',
  fullyParallel: true,
  forbidOnly: !!process.env.CI,
  retries: process.env.CI ? 2 : 0,
  workers: process.env.CI ? 1 : undefined,
  reporter: 'html',  use: {
    baseURL: config.baseUrl,
    trace: 'on-first-retry',
  },
  projects: [
    {
      name: 'chromium',
      use: { ...devices['Desktop Chrome'] },
    },
  ],
});
