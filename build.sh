# sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/SuperiorOS/manifest.git -b thirteen -g default,-mips,-darwin,-notdefault
git clone https://github.com/azberto/local_manifest --depth 1 -b superior .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8


# build rom
. build/envsetup.sh
lunch superior_X00TD-userdebug
export SELINUX_IGNORE_NEVERALLOWS=true #put before last build command
m bacon -j$(nproc --all)
#end
