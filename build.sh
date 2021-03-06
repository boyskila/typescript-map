#!/bin/bash

./node_modules/.bin/tsc
cp dist/index.js index.js
cd dist
./../node_modules/.bin/webpack -p --output-library-target 'umd' index.js tsmap.min.js
rm index.js
./../node_modules/.bin/uglifyjs -o tsmap.min.js tsmap.min.js
echo "$(cat tsmap.min.js)" | gzip -9f | wc -c;