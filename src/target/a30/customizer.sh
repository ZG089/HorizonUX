#!/usr/bin/env bash
#
# Copyright (C) 2025 Luna
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

# device blob path and etc...
BUILD_TARGET_BLOB_PATH="./target/a30/patches/stock_blobs"
soundBoosterBlob=$(ls ${SYSTEM_DIR}/lib/ | grep lib_SoundBooster_ver)
soundBooster64Blob=$(ls ${SYSTEM_DIR}/lib64/ | grep lib_SoundBooster_ver)
stockCameraLibPath="${VENDOR_DIR}/lib/libexynoscamera3.so"
selected_lib="$BUILD_TARGET_BLOB_PATH/vendor/lib/libexynoscamera3_apr17.so"
REGEX="^(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) (([[:digit:]]| )[[:digit:]]) ([[:digit:]][[:digit:]][[:digit:]][[:digit:]])$"
declare -A months=(
    [Jan]="01" [Feb]="02" [Mar]="03" [Apr]="04"
    [May]="05" [Jun]="06" [Jul]="07" [Aug]="08"
    [Sep]="09" [Oct]="10" [Nov]="11" [Dec]="12"
)

# adds fstab configs if the ROM fstab doesn't have f2fs configurations.
function mkfstab() {
    cat ${VENDOR_DIR}/etc/fstab.exynos7904 | grep -q f2fs || {
        console_print "Vendor doesn't have f2fs mount configuaration, trying to add it..."
        echo -e "\n\n# ${BUILD_USERNAME} - ${BUILD_TARGET_CUSTOM_BRAND_NAME}\n/dev/block/platform/13500000.dwmmc0/by-name/cache /cache f2fs nosuid,nodev,noatime,inline_xattr wait,check,formattable\n/dev/block/platform/13500000.dwmmc0/by-name/userdata /data f2fs nosuid,nodev,noatime,inline_xattr,data_flush,fsync_mode=nobarrier latemount,wait,check,encryptable=footer,quota" >> ${VENDOR_DIR}/etc/fstab.exynos7904 && console_print "Added f2fs mount configs"
    }
    #abort "Failed to add mount configs, this may due to the vendor have came with mount configs"
}

# takes backup of the blob, restores only if they were not copied properly.
function copyDeviceBlobsSafely() {
    local blobFromSource="$1"
    local blobInROM="$2"
    local backupBlob="../local_build/tmp/hux/${blobInROM}.bak"
    console_print "Trying to copy ${blobFromSource} to ${blobInROM}"
    if [ -f "$blobInROM" ]; then
        cp -af "$blobInROM" "$backupBlob"
    fi
    if [ ! -f "$blobInROM" ] && ask "${blobFromSource} is not found on the ROM, do you wanna copy this blob to the device?"; then
        if ! cp -af "${blobFromSource}" "${blobInROM}" 2>${thisConsoleTempLogFile}; then
            warns "Failed to copy ${blobFromSource}, this might cause a bootloop, attempting to restore original blob." "copyDeviceBlobsSafely()"
            [ -f "$backupBlob" ] && cp -af "$backupBlob" "$blobInROM"
        fi
    else
        if ! cp -af "${blobFromSource}" "${blobInROM}" 2>"${thisConsoleTempLogFile}"; then
            warns "Failed to copy ${blobFromSource}, this might cause a bootloop, attempting to restore original blob." "copyDeviceBlobsSafely()"
            [ -f "$backupBlob" ] && cp -af "$backupBlob" "$blobInROM"
        fi
    fi
    console_print "Finished copying given blobs!"
    return 0
}

if [[ "$(grep_prop "ro.product.vendor.device" "$HORIZON_VENDOR_PROPERTY_FILE")" == *"a30"* && -f "${VENDOR_DIR}/etc/fstab.exynos7904" ]]; then
    console_print "Customizing experience for Galaxy A30..."
    setprop --vendor ro.config.pageboost.io_prefetch.enabled "false"
    setprop --vendor ro.config.pageboost.io_prefetch.level '2'
    setprop --vendor ro.frp.pst " "
    mkfstab
    setprop --custom "${VENDOR_DIR}/default.prop" "log.tag.stats_log" "D"
    setprop --custom "${VENDOR_DIR}/default.prop" "persist.sys.usb.config" "mtp,adb"
    if boolReturn "${BUILD_TARGET_ADD_PATCHED_C2API_LIBRARY_FILE}"; then
        console_print "Copying patched camera2api library file..."
        if [ -z "$(grep_prop "ro.vendor.build.date.utc" "$HORIZON_VENDOR_PROPERTY_FILE")" ]; then
            lib_date=$(strings $stockCameraLibPath | grep -o -E "$REGEX")
            year=${lib_date: -4}
            month_abbr=${lib_date:0:3}
            month="${months[$month_abbr]}"
            day=${lib_date:4:2}
            day="${day/ /0}"
            timestamp=$(date -d "$year-$month-$day" +%s)
        fi
        [ "$timestamp" -gt 1630458000 ] && selected_lib="$BUILD_TARGET_BLOB_PATH/vendor/lib/libexynoscamera3_oct15.so"
        if [ -z $timestamp ]; then
            warns "Failed to get timestamp from libexynoscamera3.so, please check the file." "timestampFromLib()"
        else
            copyDeviceBlobsSafely "$selected_lib" "$VENDOR_DIR/lib64/libexynoscamera3.so" && debugPrint "Brought camera2api!!!"
        fi
    fi
    boolReturn "${BUILD_TARGET_ADD_FRAMEWORK_OVERLAY_TO_FIX_CUTOUT}" && build_and_sign "./target/a30/overlay/framework-res/" "${VENDOR_DIR}"
    if boolReturn "${BUILD_TARGET_ADD_EXTRA_CAMERA_MODE}"; then
        console_print "Removing Pro Lite Mode and replacing with Pro mode.."
        manageCameraFeatures --remove "SHOOTING_MODE_PRO_LITE" "${SYSTEM_DIR}/cameradata/camera-feature.xml"
        manageCameraFeatures --add "SHOOTING_MODE_PRO" "value=\"true\"" "SHOOTING_MODE_" "${SYSTEM_DIR}/cameradata/camera-feature.xml"
        manageCameraFeatures --add "SUPPORT_SUPER_RESOLUTION" "value=\"true\"" "SUPPORT_" "${SYSTEM_DIR}/cameradata/camera-feature.xml"
        console_print "Adding support for super resolution.."
        manageCameraFeatures --add "SUPPORT_DYNAMIC_RANGE_CONTROL" "value=\"true\"" "SUPPORT_" "${SYSTEM_DIR}/cameradata/camera-feature.xml"
        manageCameraFeatures --add "SUPPORT_BACK_MF_HDR" "value=\"true\"" "SUPPORT_" "${SYSTEM_DIR}/cameradata/camera-feature.xml"
        manageCameraFeatures --add "SUPPORT_BACK_RT_HDR" "value=\"true\"" "SUPPORT_" "${SYSTEM_DIR}/cameradata/camera-feature.xml"
        manageCameraFeatures --add "SUPPORT_FRONT_MF_HDR" "value=\"true\"" "SUPPORT_" "${SYSTEM_DIR}/cameradata/camera-feature.xml"
        manageCameraFeatures --add "SUPPORT_FRONT_RT_HDR" "value=\"true\"" "SUPPORT_" "${SYSTEM_DIR}/cameradata/camera-feature.xml"
        manageCameraFeatures --add "SUPPORT_POST_PROCESSING_MOTION_PHOTO" "value=\"true\"" "SUPPORT_" "${SYSTEM_DIR}/cameradata/camera-feature.xml"
        manageCameraFeatures --add "SUPPORT_FLASH_IN_WIDE_LENS" "value=\"true\"" "SUPPORT_" "${SYSTEM_DIR}/cameradata/camera-feature.xml"
        manageCameraFeatures --add "SUPPORT_FLASH_IN_ULTRA_WIDE_LENS" "value=\"true\"" "SUPPORT_" "${SYSTEM_DIR}/cameradata/camera-feature.xml"
        console_print "Adding support for HDR.."
        manageCameraFeatures --remove "SUPPORT_VIDEO_HDR" "${SYSTEM_DIR}/cameradata/camera-feature.xml"
        manageCameraFeatures --add "SUPPORT_VIDEO_HDR" "value=\"true\"" "SUPPORT_" "${SYSTEM_DIR}/cameradata/camera-feature.xml"
        console_print "Finished tweaking camera features"
    fi
fi