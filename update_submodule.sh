#!/bin/bash
#
# Updates common kernel submodule without fetching it
#

set -e

usage() {
	echo "USAGE ${0} <commit-sha>"
	exit 1
}

[ -n "${1}" ] || usage

MAKEFILE="https://raw.githubusercontent.com/xiaomi_diting_devs/android_kernel_xiaomi_sm8450/${1}/Makefile"

if ! curl -L --silent --head --fail "${MAKEFILE}" &>/dev/null; then
	echo "${1}: commit not found" >&2
	exit 1
fi

git update-index --add --cacheinfo 160000,${1},android_kernel_xiaomi_sm8450

# Fetch kernel info
cat > debian/android-kernel-info.mk <<EOF
# Do not modify! These values have been extracted from the current
# android common kernel sources. See ../update_submodule.sh

EOF
# head -n 6 is rather ugly, maybe replace with something more clean in future
curl -L "${MAKEFILE}" 2>/dev/null | head -n 6 >> debian/android-kernel-info.mk

echo "Please check the changes, rebuild debian/control and commit"
