#!/bin/bash

flutter pub get
flutter build web --release --source-maps
ssh paul@www.paulmin.nl 'rm -rf /var/www/html/lipl.paulmin.nl/*'
rsync -avz build/web/* paul@www.paulmin.nl:/var/www/html/lipl.paulmin.nl/
