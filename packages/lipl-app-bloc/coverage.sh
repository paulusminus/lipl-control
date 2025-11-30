#!/bin/bash

dart test --coverage=coverage -r expanded
format_coverage --lcov --in=coverage --out=coverage/coverage.lcov --packages=.packages --report-on=lib
genhtml coverage/coverage.lcov -o coverage/

echo 'open coverage/index.html to view result'
