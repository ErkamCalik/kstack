#!/bin/sh
set -eu

cd "$(dirname "$0")/.."

version=0.24.2
if ! command -v lychee >/dev/null 2>&1; then
	echo "lychee $version is required" >&2
	exit 1
fi

installed=$(lychee --version)
if [ "$installed" != "lychee $version" ]; then
	echo "warning: expected lychee $version; found $installed" >&2
fi

git ls-files '*.md' | lychee --config .github/ci-config/lychee.toml --files-from -
