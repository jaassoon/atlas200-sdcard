#!/bin/bash
apt-get update;\
apt-get install -y --no-install-recommends qemu-user-static binfmt-support python3-yaml gcc-aarch64-linux-gnu g++-aarch64-linux-gnu;\
rm -rf /var/lib/apt/lists/*
