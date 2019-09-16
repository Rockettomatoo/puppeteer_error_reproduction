const puppeteer = require('puppeteer');

puppeteer
  .launch({ executablePath: process.env.CHROME_BIN || null, args: ['--no-sandbox', '--headless', '--disable-gpu'] })
  .then(browser => {
    console.log('puppeteer successfully launched!!!');
    browser.close();
  })
  .catch(err => console.error(err));
