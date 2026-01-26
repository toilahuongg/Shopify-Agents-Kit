#!/usr/bin/env node

const fs = require('fs-extra');
const path = require('path');
const { program } = require('commander');

program
  .name('antigravity-sync')
  .description('Sync Google Antigravity Kit skills and agents to your project')
  .version('1.0.0')
  .action(async () => {
    try {
      const sourceDir = path.join(__dirname, '..', '.agent');
      const targetDir = path.join(process.cwd(), '.agent');

      console.log(`Syncing from ${sourceDir} to ${targetDir}...`);

      if (!fs.existsSync(sourceDir)) {
        console.error('Error: Could not find source .agent directory in the package.');
        process.exit(1);
      }

      // Ensure target directory exists
      await fs.ensureDir(targetDir);

      // Copy contents
      await fs.copy(sourceDir, targetDir, {
        overwrite: true,
        errorOnExist: false
      });

      console.log('✅ Successfully synced Google Antigravity Kit to .agent/');
      console.log('You can now use the new skills and agents in your AI assistant.');

    } catch (err) {
      console.error('❌ Error during sync:', err);
      process.exit(1);
    }
  });

program.parse();
