#!/usr/bin/env bash
# Exit on error
set -eEuo pipefail

# shellcheck source=/dev/null
source .env

bld_cmd="docker build"

if [[ "${VERBOSE:?}" == "yes" ]]; then
	bld_cmd+=" --progress=plain"
fi

if [[ "${USE_CACHE:?}" == "no" ]]; then
	bld_cmd+=" --no-cache"
fi
bld_cmd+=" --build-arg BASE_IMAGE=${DKR_FW_BASE_IMAGE:?}"
bld_cmd+=" --build-arg ARM_NONE_EABI_PATH=${DKR_ARM_NONE_EABI_PATH:?}"
bld_cmd+=" --build-arg ARM_NONE_EABI_TARBALL=${DKR_ARM_NONE_EABI_TARBALL:?}"
bld_cmd+=" -t ${DKR_IMAGE_NAME:?}"
# build context
bld_cmd+=" ."


#echo "${bld_cmd}"
eval "${bld_cmd}"
