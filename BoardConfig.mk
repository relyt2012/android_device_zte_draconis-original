#
# Copyright (C) 2014 The CyanogenMod Project
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

LOCAL_PATH := device/zte/draconis

BOARD_VENDOR := zte-qcom

TARGET_SPECIFIC_HEADER_PATH := device/zte/draconis/include

# Platform
TARGET_BOARD_PLATFORM := msm8226
TARGET_BOARD_PLATFORM_GPU := qcom-adreno305

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_MEMCPY_BASE_OPT_DISABLE := true
TARGET_CPU_VARIANT := krait

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8226
TARGET_NO_BOOTLOADER := true

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_MKBOOTIMG_ARGS := --dt device/zte/draconis/dt.img --ramdisk_offset 0x01000000 --tags_offset 0x00000100
TARGET_KERNEL_SOURCE := kernel/zte/draconis
TARGET_KERNEL_CONFIG := draconis_defconfig

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true

# GPS definitions for Qualcomm solution
#BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
#TARGET_NO_RPC := true

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true

# Charger
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/mmi_lpm/lpm_mode

# CMHW
BOARD_HARDWARE_CLASS := $(LOCAL_PATH)/cmhw/

# Display
BOARD_EGL_CFG := $(LOCAL_PATH)/configs/egl.cfg
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
USE_OPENGL_RENDERER := true
TARGET_DISPLAY_INSECURE_MM_HEAP := true
TARGET_DISPLAY_USE_RETIRE_FENCE := true
TARGET_QCOM_DISPLAY_VARIANT := caf
USE_SET_METADATA := false
HAVE_ADRENO_SOURCE:= false
#OVERRIDE_RS_DRIVER:= libRSDriver_adreno.so
#TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true

# Audio
BOARD_USES_ALSA_AUDIO := true
#BOARD_USES_LEGACY_ALSA_AUDIO := false
#AUDIO_FEATURE_DISABLED_DTS_EAGLE := false
#AUDIO_FEATURE_ENABLED_ACDB_LICENSE
#AUDIO_FEATURE_ENABLED_ANC_HEADSET
#AUDIO_FEATURE_ENABLED_AUXPCM_BT
#AUDIO_FEATURE_ENABLED_COMPRESS_CAPTURE := false
#AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := true
#AUDIO_FEATURE_ENABLED_CUSTOMSTEREO
#AUDIO_FEATURE_ENABLED_DEV_ARBI := false
#AUDIO_FEATURE_ENABLED_DS2_DOLBY_DAP := false
#AUDIO_FEATURE_ENABLED_DTS_EAGLE := false
#AUDIO_FEATURE_ENABLED_EXTN_FLAC_DECODER := false
#AUDIO_FEATURE_ENABLED_EXTN_FORMATS
#AUDIO_FEATURE_ENABLED_FLUENCE := true
#AUDIO_FEATURE_ENABLED_FM := true
#AUDIO_FEATURE_ENABLED_HDMI_PASSTHROUGH
#AUDIO_FEATURE_ENABLED_HFP := true
#AUDIO_FEATURE_ENABLED_HW_ACCELERATED_EFFECTS
#AUDIO_FEATURE_ENABLED_INCALL_MUSIC
#AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE := false
#####AUDIO_FEATURE_ENABLED_LISTEN := true
#AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
#AUDIO_FEATURE_ENABLED_MULTIPLE_TUNNEL
#AUDIO_FEATURE_ENABLED_PCM_OFFLOAD := true
#AUDIO_FEATURE_ENABLED_PCM_OFFLOAD_24
#AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
#AUDIO_FEATURE_ENABLED_RECORD_PLAY_CONCURRENCY
#AUDIO_FEATURE_ENABLED_SPKR_PROTECTION := false
#####AUDIO_FEATURE_ENABLED_SSR := true
#AUDIO_FEATURE_ENABLED_USBAUDIO := true
#AUDIO_FEATURE_ENABLED_VOICE_CONCURRENCY
#AUDIO_FEATURE_ENABLED_WFD_CONCURRENCY
#BOARD_SUPPORTS_SOUND_TRIGGER := false
#DOLBY_DAP := true
#DOLBY_DDP := true
#DOLBY_UDC
#MULTIPLE_HW_VARIANTS_ENABLED := true

#Media
COMMON_GLOBAL_CFLAGS += -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL
TARGET_QCOM_MEDIA_VARIANT := caf

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Memory
MALLOC_IMPL := dlmalloc

# Power
TARGET_POWERHAL_VARIANT := qcom

# Qualcomm support
BOARD_USES_QCOM_HARDWARE := true

# SELinux
-include device/qcom/sepolicy/sepolicy.mk

BOARD_SEPOLICY_DIRS += \
    device/zte/draconis/sepolicy

BOARD_SEPOLICY_UNION += \
    app.te \
    bluetooth.te \
    bluetooth_loader.te \
    bootanim.te \
    bridge.te \
    domain.te \
    file.te \
    healthd.te \
    hostapd.te \
    mediaserver.te \
    mm-qcamerad.te \
    mpdecision.te \
    netmgrd.te \
    platform_app.te \
    qmuxd.te \
    qseecomd.te \
    radio.te \
    rild.te \
    rmt_storage.te \
    sensors.te \
    subsystem_ramdump.te \
    system_app.te \
    system_server.te \
    thermal-engine.te \
    ueventd.te \
    untrusted_app.te \
    vold.te \
    vss.te \
    wpa.te \
    file_contexts \
    genfs_contexts \
    wcnss_service.te

#does not exist
#    gsiff_daemon.te \
#    location_mq.te \
#    lowi-server.te \
#    ppd.te \
#    qcamerasvr.te \
#    qrngd.te \
#    quipc_igsn.te \
#    quipc_main.te \
#    xtwifi_client.te \
#    xtwifi_inet.te \

# Vold
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 40
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Wifi
BOARD_HAS_QCOM_WLAN              := true
BOARD_HAS_QCOM_WLAN_SDK          := true
BOARD_WLAN_DEVICE                := qcwcn
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
TARGET_USES_WCNSS_CTRL           := true
WPA_SUPPLICANT_VERSION           := VER_0_8_X
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME          := "wlan"

WLAN_MODULES:
	mkdir -p $(KERNEL_MODULES_OUT)/pronto
	mv $(KERNEL_MODULES_OUT)/wlan.ko $(KERNEL_MODULES_OUT)/pronto/pronto_wlan.ko
	ln -sf /system/lib/modules/pronto/pronto_wlan.ko $(TARGET_OUT)/lib/modules/wlan.ko

TARGET_KERNEL_MODULES += WLAN_MODULES

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610612736
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5930598400

# Recovery
TARGET_RECOVERY_FSTAB := device/zte/draconis/recovery.fstab
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_USERIMAGES_USE_EXT4 := true

# Create Odex Files
WITH_DEXPREOPT := true

# Releasetools
TARGET_PROVIDES_RELEASETOOLS := true
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := ./device/zte/draconis/releasetools/ota_from_target_files
