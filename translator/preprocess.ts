import {sync} from 'globby';
import * as path from 'path';
import {readFileSync, writeFileSync} from 'fs';

function processAll(): void {
  const files = sync(path.join(__dirname, '../src/**/*.md'));

  files.forEach(file => {
    const content = readFileSync(file, 'utf-8');
    const result = preprocess(content);
    writeFileSync(file, result, 'utf-8');
  });
}

processAll();

export function preprocess(content: string): string {
  // 处理多行表头：把前面那句去掉
  return content.replace(/^\|.*\|.*\|\n(\|.*\|.*\|)\n(\| *-+ *\| *-+ *\|.*)/gm, '$1\n$2');
}

function containsChinese(text: string): boolean {
  return text && text.search(/[\u4e00-\u9fa5]/gm) !== -1;
}

