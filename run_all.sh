#!/bin/sh
# (c) 2024 Contentwise Tech
# https://contentwise.tech
# MIT License

# Generate config
./scripts/gen-settings.sh

# Run tests
./nench.sh
./osbench.sh
./ipc-bench.sh
./stress-ng.sh
