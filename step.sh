#!/bin/bash

set -e

mussel_url="https://github.com/UrbanCompass/Mussel/releases/download/$mussel_version/release.zip"
temp=$(mktemp -d)

echo "Downloading Mussel server from $mussel_url"
curl -L --progress-bar $mussel_url > $temp/release.zip
unzip -o $temp/release.zip -d $temp
mkdir -p .mussel
mv $temp/MusselServer $temp/run_server.sh .mussel
./.mussel/run_server.sh
