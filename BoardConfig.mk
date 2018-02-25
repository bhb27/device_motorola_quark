#
# Copyright (C) 2015 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

QUARK_PATH := device/motorola/quark

BOARD_VENDOR := motorola-qcom

TARGET_SPECIFIC_HEADER_PATH := $(QUARK_PATH)/include

# Assert
TARGET_OTA_ASSERT_DEVICE := quark,quark_lra,quark_umts,quark_verizon,xt1225,xt1250,xt1254
BOARD_USES_QCOM_HARDWARE := true

# Platform
TARGET_BOARD_PLATFORM := apq8084
TARGET_BOARD_PLATFORM_GPU := qcom-adreno420

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := APQ8084
TARGET_NO_BOOTLOADER := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := krait

# Kernel
BOARD_KERNEL_CMDLINE := console=none androidboot.hardware=qcom msm_rtb.filter=0x37 ehci-hcd.park=3 vmalloc=400M androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_LZ4C_DT := true
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_SEPARATED_DT := true
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01000000 --tags_offset 0x00000100
LZMA_RAMDISK_TARGETS := boot,recovery
TARGET_KERNEL_SOURCE := kernel/motorola/apq8084
TARGET_KERNEL_CONFIG := twrp_defconfig
# if toolchain is not available, use stock one but may be need to change Kernel branch to N
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/arm/uber_arm-eabi-4.9/bin
# stock toolchain
#KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/arm/arm-eabi-4.8/bin
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-eabi-

# Init
TARGET_INIT_VENDOR_LIB := libinit_quark
TARGET_RECOVERY_DEVICE_MODULES := libinit_quark
TARGET_NR_SVC_SUPP_GIDS := 28

# Audio
AUDIO_FEATURE_ENABLED_ANC_HEADSET := true
AUDIO_FEATURE_ENABLED_EXTERNAL_SPEAKER := true
AUDIO_FEATURE_ENABLED_FLUENCE := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_NEW_SAMPLE_RATE := true
AUDIO_FEATURE_ENABLED_USBAUDIO := true
AUDIO_FEATURE_LOW_LATENCY_PRIMARY := true
BOARD_USES_ALSA_AUDIO := true
USE_CUSTOM_AUDIO_POLICY := 1
AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE := true
AUDIO_FEATURE_ENABLED_LOW_LATENCY_CAPTURE := true
AUDIO_FEATURE_ENABLED_HWDEP_CAL := true

#blobs
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(QUARK_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH_QCOM := true
BOARD_HAS_QCA_BT_ROME := true

# Camera
BOARD_GLOBAL_CFLAGS += -DCAMERA_VENDOR_L_COMPAT
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
USE_DEVICE_SPECIFIC_CAMERA := true

# CMHW
BOARD_HARDWARE_CLASS += hardware/cyanogen/cmhw

# Display
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
USE_OPENGL_RENDERER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
TARGET_USE_COMPAT_GRALLOC_ALIGN := true
HAVE_ADRENO_SOURCE := false

# Motorola
TARGET_USES_MOTOROLA_LOG := true

# Power
BOARD_CHARGER_ENABLE_SUSPEND := true
TARGET_POWERHAL_VARIANT := qcom

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Media
TARGET_USES_ION := true
# Fix video autoscaling on old OMX decoders
TARGET_OMX_LEGACY_RESCALING := true

# Radio
BOARD_USES_CUTBACK_IN_RILD := true
TARGET_RIL_VARIANT := caf
TARGET_NEEDS_GCC_LIBC := true
TARGET_NEEDS_GCC_LIBRIL := true
BOARD_GLOBAL_CFLAGS += -DUSE_RIL_VERSION_10
BOARD_GLOBAL_CPPFLAGS += -DUSE_RIL_VERSION_10

# Recovery
TARGET_RECOVERY_FSTAB := $(QUARK_PATH)/rootdir/etc/fstab.qcom
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_RECOVERY_DENSITY := xhdpi

# SELinux
-include device/qcom/sepolicy/sepolicy.mk

BOARD_SEPOLICY_DIRS += \
    device/motorola/quark/sepolicy

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_HAS_QCOM_WLAN_SDK := true
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_MODULE_NAME := "wlan"
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
WPA_SUPPLICANT_VERSION := VER_0_8_X

# Vold
TARGET_HW_DISK_ENCRYPTION := false
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 40

# Partitions (set for 64 GB)
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16793600
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648
BOARD_USERDATAIMAGE_PARTITION_SIZE := 57185009664
BOARD_CACHEIMAGE_PARTITION_SIZE := 3539992576
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072

# Enable real time lockscreen charging current values
BOARD_GLOBAL_CFLAGS += -DBATTERY_REAL_INFO

# Compile libhwui in performance mode
HWUI_COMPILE_FOR_PERF := true

# Qualcomm support
TARGET_USES_QCOM_BSP := true
TARGET_GLOBAL_CFLAGS += -DQCOM_BSP
TARGET_GLOBAL_CPPFLAGS += -DQCOM_BSP

# Snapdragon LLVM Compiler
#TARGET_USE_SDCLANG := true

# TWRP
TW_THEME := portrait_hdpi
RECOVERY_GRAPHICS_USE_LINELENGTH := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_SCREEN_BLANK_ON_BOOT := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_SUPPRESS_EMMC_WIPE := true
#BOARD_NO_SECURE_DISCARD := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/f9200000.ssusb/f9200000.dwc3/gadget/lun%d/file"
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 63
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_NO_EXFAT := true
TW_NO_EXFAT_FUSE := true
#TW_EXTRA_LANGUAGES := true
TW_EXCLUDE_SUPERSU := true
TW_INCLUDE_NTFS_3G := true
TW_IGNORE_MISC_WIPE_DATA := true

# Encryption
TARGET_CRYPTFS_HW_PATH := vendor/qcom/opensource/cryptfs_hw
TARGET_HW_DISK_ENCRYPTION := true
TW_INCLUDE_CRYPTO := true
TARGET_KEYMASTER_WAIT_FOR_QSEE := true

# MultiROM config. MultiROM also uses parts of TWRP config
#MR_INPUT_TYPE := type_b
MR_INIT_DEVICES := device/motorola/quark/multirom/mr_init_devices.c
MR_DEVICE_HOOKS := device/motorola/quark/multirom/mr_hooks.c
MR_DEVICE_HOOKS_VER := 4
MR_DPI := xxhdpi
MR_DPI_FONT := 500
MR_FSTAB := device/motorola/quark/rootdir/etc/fstab.qcom
MR_ENCRYPTION := true
TARGET_RECOVERY_IS_MULTIROM := true
MR_NO_KEXEC := forced
MR_ALLOW_NKK71_NOKEXEC_WORKAROUND := true
MR_DEVICE_VARIANTS := quark quark_umts quark_lra
MR_CONTINUOUS_FB_UPDATE := true
MR_USE_MROM_FSTAB := true
MR_KEXEC_MEM_MIN := 0x20000000

#MultiROM encryption
MR_ENCRYPTION := true
MR_ENCRYPTION_SETUP_SCRIPT := device/motorola/quark/multirom/mr_cp_crypto.sh

# MultiROM display
MR_QCOM_OVERLAY_HEADER := device/motorola/quark/multirom/mr_qcom_overlay.h
MR_QCOM_OVERLAY_CUSTOM_PIXEL_FORMAT := MDP_ABGR_8888

include device/motorola/quark/multirom/MR_REC_VERSION.mk
MR_REC_VERSION := $(shell date -u +%Y%m%d)-01
BOARD_MKBOOTIMG_ARGS += --board mrom$(MR_REC_VERSION)
