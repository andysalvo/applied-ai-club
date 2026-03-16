const puppeteer = require('/Users/andysalvo_1/claude/node_modules/puppeteer');
const path = require('path');

const OUT = path.join(__dirname);

const pages = [
  { url: 'https://ajs10845.wixsite.com/student-ai-hub-1', name: 'home' },
  { url: 'https://ajs10845.wixsite.com/student-ai-hub-1/ai-by-smeal-major', name: 'ai-by-smeal-major' },
  { url: 'https://ajs10845.wixsite.com/student-ai-hub-1/major-accounting', name: 'major-accounting' },
  { url: 'https://ajs10845.wixsite.com/student-ai-hub-1/copy-of-accounting', name: 'major-actuarial-science' },
  { url: 'https://ajs10845.wixsite.com/student-ai-hub-1/copy-of-accounting-1', name: 'major-corp-innovation' },
  { url: 'https://ajs10845.wixsite.com/student-ai-hub-1/copy-of-accounting-2', name: 'major-finance' },
  { url: 'https://ajs10845.wixsite.com/student-ai-hub-1/copy-of-accounting-3', name: 'major-management' },
  { url: 'https://ajs10845.wixsite.com/student-ai-hub-1/copy-of-accounting-4', name: 'major-mis' },
  { url: 'https://ajs10845.wixsite.com/student-ai-hub-1/copy-of-accounting-5', name: 'major-marketing' },
  { url: 'https://ajs10845.wixsite.com/student-ai-hub-1/copy-of-marketing', name: 'major-real-estate' },
  { url: 'https://ajs10845.wixsite.com/student-ai-hub-1/copy-of-accounting-7', name: 'major-risk-mgmt' },
  { url: 'https://ajs10845.wixsite.com/student-ai-hub-1/copy-of-accounting-6', name: 'major-supply-chain' },
  { url: 'https://ajs10845.wixsite.com/student-ai-hub-1/ai-news-that-matters', name: 'ai-news-that-matters' },
];

(async () => {
  const browser = await puppeteer.launch({ headless: true });
  const page = await browser.newPage();
  await page.setViewport({ width: 1440, height: 900 });

  for (const { url, name } of pages) {
    console.log(`Capturing ${name}...`);
    try {
      await page.goto(url, { waitUntil: 'networkidle2', timeout: 30000 });
      await new Promise(r => setTimeout(r, 2500));
      await page.screenshot({ path: path.join(OUT, `${name}.png`), fullPage: true });
      console.log(`  Saved ${name}.png`);
    } catch (e) {
      console.log(`  Error: ${e.message}`);
    }
  }

  await browser.close();
  console.log('\nDone!');
})();
