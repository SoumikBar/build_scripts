#!/bin/bash

rm -rf .repo/local_manifests/

# repo init rom
repo init -u https://github.com/euclidTeam/manifest.git -b qpr3 --git-lfs --depth=1
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/SoumikBar/local_manifests -b EuclidOS-14 .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# build
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# Export
export BUILD_USERNAME=DEV•BeingEuclid
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

# Set up build environment
. build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
lunch lineage_Mi439_4_19-ap2a-userdebug
make installclean
echo "============="

# Build ROM
mka everest -j$(nproc --all)
