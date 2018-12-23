import {sync} from 'globby';
import {readFileSync, writeFileSync} from 'fs';
import * as path from 'path';
import {postprocess} from './postprocessor';

const files = sync(path.join(__dirname, '../dist/docs/**/*.html'));

files.forEach(file => {
  const content = readFileSync(file, 'utf-8');
  const result = postprocess(content);
  writeFileSync(file, result, 'utf-8');
});
