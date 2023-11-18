#!/bin/bash

flutter gen-l10n \
    --arb-dir lib/l10n \
    --template-arb-file lib_en.arb \
    --output-class BluetoothAppLocalizations \
    --output-localization-file lipl_bluetooth_localizations.dart \
    --output-dir lib/l10n \
    --no-synthetic-package
