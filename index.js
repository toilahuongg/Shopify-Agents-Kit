#!/usr/bin/env node
const fs = require('fs-extra');
const path = require('path');

const args = process.argv.slice(2);

async function setup() {
  const source = path.resolve(__dirname, '.claude'); // thư mục trong package
  const destination = process.cwd(); // thư mục đang chạy lệnh
  // make folder .claude if not exist
  try {
    await fs.ensureDir(path.join(destination, '.claude'));
    await fs.copy(source, path.join(destination, '.claude'), { overwrite: true, errorOnExist: true });
    console.log('Finished setup for Shopify Agents Kit');
  } catch (err) {
    if (err.code === 'EEXIST') {
      console.error('Some files already exist in the destination folder.');
    } else {
      console.error('Error copying files:', err);
    }
  }
}

if (args[0] === 'setup') {
  setup();
} else {
  console.log("command not found. Use 'setup'.");
}
