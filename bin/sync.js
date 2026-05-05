#!/usr/bin/env node

const fs = require('fs-extra');
const path = require('path');
const { execSync } = require('child_process');
const { program } = require('commander');

const PACKAGE_NAME = 'shopify-cc-kit';
const SOURCE_DIR = '.claude';

program
  .name('shopify-cc-kit')
  .description('Sync Shopify Claude Code Kit skills to your project')
  .version('1.4.0')
  .option('-f, --force', 'Overwrite existing files without prompting')
  .option('--dry-run', 'Show what would be synced without making changes')
  .option('--no-external', 'Skip installing external skills from Shopify and Matt Pocock')
  .action(async (options) => {
    try {
      const sourceDir = path.join(__dirname, '..', SOURCE_DIR);
      const targetDir = path.join(process.cwd(), SOURCE_DIR);

      console.log(`\n📦 ${PACKAGE_NAME} - Sync Tool\n`);

      if (!fs.existsSync(sourceDir)) {
        console.error(`❌ Error: Could not find source ${SOURCE_DIR} directory in the package.`);
        process.exit(1);
      }

      const targetExists = fs.existsSync(targetDir);

      if (options.dryRun) {
        console.log('🔍 Dry run mode - no changes will be made\n');
      }

      if (targetExists && !options.force && !options.dryRun) {
        console.log(`⚠️  Warning: ${SOURCE_DIR}/ already exists in your project.`);
        console.log('   Use --force to overwrite existing files.\n');
      }

      const skillsDir = path.join(sourceDir, 'skills');
      const skillCount = fs.existsSync(skillsDir)
        ? fs.readdirSync(skillsDir).filter(f => fs.statSync(path.join(skillsDir, f)).isDirectory()).length
        : 0;

      console.log(`📊 Package contents:`);
      console.log(`   • ${skillCount} Skills\n`);

      if (options.dryRun) {
        console.log(`📁 Would sync to: ${targetDir}\n`);
        console.log('   ✓ Skills');
        console.log('\n✅ Dry run complete. Use without --dry-run to apply changes.');
        return;
      }

      console.log(`📁 Syncing to: ${targetDir}\n`);

      await fs.ensureDir(targetDir);

      const srcPath = path.join(sourceDir, 'skills');
      const destPath = path.join(targetDir, 'skills');

      if (fs.existsSync(srcPath)) {
        await fs.copy(srcPath, destPath, {
          overwrite: options.force || !targetExists,
          errorOnExist: false
        });
        console.log('   ✅ Skills');
      } else {
        console.log('   ⏭️  Skipping Skills (not found)');
      }

      console.log(`\n🎉 Successfully synced ${PACKAGE_NAME} to ${SOURCE_DIR}/`);

      // Install external skills
      if (options.external !== false) {
        console.log('\n📦 Installing external skills...\n');
        const externalSkills = [
          { name: 'Shopify AI Toolkit', source: 'Shopify/shopify-ai-toolkit' },
          { name: 'Matt Pocock Skills', source: 'mattpocock/skills' }
        ];

        for (const { name, source } of externalSkills) {
          try {
            console.log(`   Installing ${name}...`);
            execSync(`npx skills@latest add ${source}`, {
              cwd: process.cwd(),
              stdio: 'inherit'
            });
            console.log(`   ✅ ${name}`);
          } catch (err) {
            console.log(`   ⚠️  ${name} installation failed: ${err.message}`);
          }
        }
        console.log('');
      }

      console.log('\n📖 Quick Start:');
      console.log('   • Use commands: /git-cm, /changelog');
      console.log('   • View all: ls .claude/skills/\n');

    } catch (err) {
      console.error('\n❌ Error during sync:', err.message);
      process.exit(1);
    }
  });

program.parse();
