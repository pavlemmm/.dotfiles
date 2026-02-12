#!/usr/bin/env bash

set -e

cache_fonts() {
  fc-cache -f
  echo "Fonts have been successfully cached"
}

cache_fonts

