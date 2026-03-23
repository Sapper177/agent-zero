#!/bin/bash
set -e

# clean up apt cache
sudo apt-get clean
sudo apt autoremove --purge -y
