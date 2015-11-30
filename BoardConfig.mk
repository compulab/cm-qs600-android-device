# config.mk
#
# Product-specific compile-time definitions.
#

ifeq ($(TARGET_ARCH),)
TARGET_ARCH := arm
endif

USE_CAMERA_STUB := true

ifeq ($(USE_PROPRIETARY_SOURCECODE), true)
# proprietary source code
-include vendor/qcom/proprietary/common/msm8960/BoardConfigVendor.mk
endif
-include vendor/qcom/proprietary/common/build/utils.mk
include device/qcom/bellatrix/build_id.mk

# BOARD_USES_ALSA_AUDIO is implied
BOARD_USES_LEGACY_ALSA_AUDIO := true
TARGET_USES_OVERLAY := true
TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := false
TARGET_NO_RADIOIMAGE := true
TARGET_NO_RPC := true
TARGET_CPU_VARIANT=krait
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_CPU_ABI  := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_PROVIDES_INIT_RC := true

TARGET_INIT_VENDOR_LIB := libinit_msm

TARGET_HARDWARE_3D := false
TARGET_BOARD_PLATFORM := msm8960
TARGET_BOOTLOADER_BOARD_NAME := BELLATRIX

BOARD_KERNEL_BASE    := 0x80200000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x02000000
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3 maxcpus=2 prim_display=hdmi_msm no_console_suspend
BOARD_EGL_CFG := device/qcom/$(TARGET_PRODUCT)/egl.cfg

BOARD_BOOTIMAGE_PARTITION_SIZE := 23068672 # 22M
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 23068672 # 22M
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 536870912 # 512M
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1073741824 # 1G

BOARD_CACHEIMAGE_PARTITION_SIZE := 33554432
BOARD_PERSISTIMAGE_PARTITION_SIZE := 5242880
BOARD_TOMBSTONESIMAGE_PARTITION_SIZE := 268435456
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

# Qualcomm proprietary GPS API: OFF
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE :=

# Qualcomm proprietary Connectivity Engine: OFF
BOARD_USES_QCNE := false

# WLAN / BLUETOOTH
BOARD_WLAN_VENDOR := ATHEROS_QCA6234
BOARD_BLUETOOTH_VENDOR := ATHEROS_QCA6234

ifeq ($(BOARD_WLAN_VENDOR),ATHEROS_QCA6234)
	BOARD_HAS_QCOM_WLAN := true
	BOARD_HAS_ATH_WLAN_AR6004 := true

	BOARD_WLAN_DEVICE := qcwcn
	BOARD_WPA_SUPPLICANT_DRIVER := NL80211
	BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
	BOARD_HOSTAPD_DRIVER := NL80211
	BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
	BOARD_HAS_CFG80211_KERNEL3_4 := true
	WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/ath6kl-3.5/ath6kl_sdio.ko"
	WIFI_DRIVER_MODULE_NAME := "wlan"
	WIFI_DRIVER_MODULE_ARG := ""
	WPA_SUPPLICANT_VERSION := VER_0_8_X
	HOSTAPD_VERSION := VER_0_8_X
	# fool wifi.c into switching driver modes
	# instead of reloading firmware
	WIFI_DRIVER_FW_PATH_STA := "sta"
	WIFI_DRIVER_FW_PATH_AP  := "ap"
	WIFI_DRIVER_FW_PATH_P2P := "p2p"
endif

ifeq ($(BOARD_BLUETOOTH_VENDOR), ATHEROS_QCA6234)
	BOARD_HAVE_BLUETOOTH := true
	BOARD_HAS_QCA_BT_AR3002 := true
	BOARD_HAVE_BLUETOOTH_QCOM := true
	BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/qcom/bellatrix/bluetooth
	AUDIO_FEATURE_ENABLED_AUXPCM_BT := false
endif

# Use signed boot and recovery image
TARGET_BOOTIMG_SIGNED := true

TARGET_USE_KRAIT_BIONIC_OPTIMIZATION := true
TARGET_USE_KRAIT_PLD_SET := true
TARGET_KRAIT_BIONIC_PLDOFFS := 10
TARGET_KRAIT_BIONIC_PLDTHRESH := 10
TARGET_KRAIT_BIONIC_BBTHRESH := 64
TARGET_KRAIT_BIONIC_PLDSIZE := 64

HAVE_CYTTSP_FW_UPGRADE := false
HAVE_MXT_CFG := false

# Add NON-HLOS files for ota upgrade
ADD_RADIO_FILES ?= false

# Added to indicate that protobuf-c is supported in this build
PROTOBUF_SUPPORTED := true

TARGET_USES_ION := true

# Board specific SELinux policy variable definitions
BOARD_SEPOLICY_DIRS := \
       device/qcom/common/sepolicy

BOARD_SEPOLICY_UNION := \
       app.te \
       bluetooth.te \
       compatibility.te \
       device.te \
       domain.te \
       drmserver.te \
       file.te \
       file_contexts \
       hci_init.te \
       init_shell.te \
       keystore.te \
       mediaserver.te \
       kickstart.te \
       netd.te \
       nfc.te \
       rild.te \
       surfaceflinger.te \
       system.te \
       ueventd.te \
       wpa.te

PRODUCT_BOOT_JARS := $(subst $(space),:,$(PRODUCT_BOOT_JARS))
