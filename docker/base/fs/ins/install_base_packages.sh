#!/bin/bash
set -e

echo "====================BASE PACKAGES1 START===================="

apt-get update && apt-get upgrade -y

apt-get install -y --no-install-recommends \
    sudo curl wget git cron \
    openssh-server ffmpeg supervisor \
    nodejs npm \
    tesseract-ocr tesseract-ocr-script-latn poppler-utils


echo "====================BASE PACKAGES1 END===================="
