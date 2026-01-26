#!/usr/bin/env node

const fs = require('fs-extra');
const path = require('path');
const { program } = require('commander');

const PACKAGE_NAME = 'shopify-cc-kit';
const SOURCE_DIR = '.claude';

program
  .name('shopify-cc-kit')
  .description('Sync Shopify Claude Code Kit skills and agents to your project')
  .version('1.1.2')
  .option('-f, --force', 'Overwrite existing files without prompting')
  .option('-a, --agents-only', 'Only sync agents')
  .option('-s, --skills-only', 'Only sync skills')
  .option('--dry-run', 'Show what would be synced without making changes')
  .action(async (options) => {
    try {
      const sourceDir = path.join(__dirname, '..', SOURCE_DIR);
      const targetDir = path.join(process.cwd(), SOURCE_DIR);

      console.log(`\n📦 ${PACKAGE_NAME} - Sync Tool\n`);

      if (!fs.existsSync(sourceDir)) {
        console.error(`❌ Error: Could not find source ${SOURCE_DIR} directory in the package.`);
        process.exit(1);
      }

      // Check if target already exists
      const targetExists = fs.existsSync(targetDir);

      if (options.dryRun) {
        console.log('🔍 Dry run mode - no changes will be made\n');
      }

      if (targetExists && !options.force && !options.dryRun) {
        console.log(`⚠️  Warning: ${SOURCE_DIR}/ already exists in your project.`);
        console.log('   Use --force to overwrite existing files.\n');
      }

      // Determine what to sync
      let itemsToSync = [];

      if (options.agentsOnly) {
        itemsToSync.push({ src: 'agents', label: 'Agents' });
      } else if (options.skillsOnly) {
        itemsToSync.push({ src: 'skills', label: 'Skills' });
      } else {
        itemsToSync = [
          { src: 'agents', label: 'Agents' },
          { src: 'skills', label: 'Skills' },
          { src: 'settings.local.json', label: 'Settings', isFile: true }
        ];
      }

      // Count items
      const agentsDir = path.join(sourceDir, 'agents');
      const skillsDir = path.join(sourceDir, 'skills');

      const agentCount = fs.existsSync(agentsDir)
        ? fs.readdirSync(agentsDir).filter(f => f.endsWith('.md')).length
        : 0;
      const skillCount = fs.existsSync(skillsDir)
        ? fs.readdirSync(skillsDir).filter(f => fs.statSync(path.join(skillsDir, f)).isDirectory()).length
        : 0;

      console.log(`📊 Package contents:`);
      console.log(`   • ${agentCount} Agents`);
      console.log(`   • ${skillCount} Skills\n`);

      if (options.dryRun) {
        console.log(`📁 Would sync to: ${targetDir}\n`);
        for (const item of itemsToSync) {
          console.log(`   ✓ ${item.label}`);
        }
        console.log('\n✅ Dry run complete. Use without --dry-run to apply changes.');
        return;
      }

      console.log(`📁 Syncing to: ${targetDir}\n`);

      // Ensure target directory exists
      await fs.ensureDir(targetDir);

      // Sync each item
      for (const item of itemsToSync) {
        const srcPath = path.join(sourceDir, item.src);
        const destPath = path.join(targetDir, item.src);

        if (!fs.existsSync(srcPath)) {
          console.log(`   ⏭️  Skipping ${item.label} (not found)`);
          continue;
        }

        await fs.copy(srcPath, destPath, {
          overwrite: options.force || !targetExists,
          errorOnExist: false
        });

        console.log(`   ✅ ${item.label}`);
      }

      console.log(`\n🎉 Successfully synced ${PACKAGE_NAME} to ${SOURCE_DIR}/`);
      console.log('\n📖 Quick Start:');
      console.log('   • Use agents: "Act as the shopify-developer agent"');
      console.log('   • Use commands: /git-cm, /test, /review, /changelog');
      console.log('   • View all: ls .claude/skills/\n');

    } catch (err) {
      console.error('\n❌ Error during sync:', err.message);
      process.exit(1);
    }
  });

program.parse();
