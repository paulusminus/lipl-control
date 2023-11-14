#!/bin/bash

flutter test --coverage -r expanded
genhtml coverage/lcov.info -o coverage/

echo 'use open coverage/index.html to view results'
