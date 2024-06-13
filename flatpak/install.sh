#!/bin/bash

set -e
set -x

PROJECT_NAME=lipl
PROJECT_ID=nl.paulmin.LiplControl
EXECUTABLE_NAME=lipl_control
ICON_DIR=/app/share/icons/hicolor/scalable/apps
DESKTOP_FILE_DIR=/app/share/applications
METADATA_DIR=/app/share/metainfo

# Copy binaries
mkdir -p $PROJECT_NAME
cp -r lipl-control/* $PROJECT_NAME

# Make link to binary that is to be executed
cp -r $PROJECT_NAME /app/
mkdir -p /app/bin
ln -s /app/$PROJECT_NAME/$EXECUTABLE_NAME /app/bin/$EXECUTABLE_NAME

mkdir -p $ICON_DIR
cp -r nl.paulmin.LiplControl.svg $ICON_DIR/

mkdir -p $DESKTOP_FILE_DIR
cp -r nl.paulmin.LiplControl.desktop $DESKTOP_FILE_DIR/

mkdir -p $METADATA_DIR
cp -r nl.paulmin.LiplControl.metainfo.xml $METADATA_DIR/
