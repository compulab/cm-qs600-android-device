DEVICE_PACKAGE_OVERLAYS := device/qcom/bellatrix/overlay

TARGET_USES_QCOM_BSP := true
ifeq ($(TARGET_USES_QCOM_BSP),true)
    TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
#media
PRODUCT_COPY_FILES += \
                      device/qcom/bellatrix/media/media_profiles_8960.xml:system/etc/media_profiles.xml
PRODUCT_COPY_FILES += \
                      device/qcom/bellatrix/media/media_codecs_8960.xml:system/etc/media_codecs.xml
else
    TARGET_ENABLE_QC_AV_ENHANCEMENTS := false
endif #TARGET_USES_QCOM_BSP

$(call inherit-product, device/qcom/common/common.mk)

PRODUCT_NAME := bellatrix
PRODUCT_DEVICE := bellatrix
PRODUCT_MANUFACTURER := CompuLab

PRODUCT_BOOT_JARS += qcom.fmradio:qcmediaplayer:WfdCommon:org.codeaurora.Performance

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \

# Bluetooth configuration files
#PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf \

# Audio configuration file
PRODUCT_COPY_FILES += \
    device/qcom/bellatrix/audio_policy.conf:system/etc/audio_policy.conf \

# audio UCM files
PRODUCT_COPY_FILES += device/qcom/bellatrix/snd_soc_msm/snd_soc_msm_2x:system/etc/snd_soc_msm/snd_soc_msm_2x \
                      device/qcom/bellatrix/snd_soc_msm/snd_soc_msm_2x_Fusion3:system/etc/snd_soc_msm/snd_soc_msm_2x_Fusion3 \
                      device/qcom/bellatrix/snd_soc_msm/snd_soc_msm_2x_Fusion3_auxpcm:system/etc/snd_soc_msm/snd_soc_msm_2x_Fusion3_auxpcm \
                      device/qcom/bellatrix/snd_soc_msm/snd_soc_msm_2x_auxpcm:system/etc/snd_soc_msm/snd_soc_msm_2x_auxpcm \
                      device/qcom/bellatrix/snd_soc_msm/snd_soc_msm_I2S:system/etc/snd_soc_msm/snd_soc_msm_I2S \
                      device/qcom/bellatrix/snd_soc_msm/snd_soc_msm_I2SFusion:system/etc/snd_soc_msm/snd_soc_msm_I2SFusion \
                      device/qcom/bellatrix/snd_soc_msm/snd_soc_msm_Sitar:system/etc/snd_soc_msm/snd_soc_msm_Sitar \
                      device/qcom/bellatrix/snd_soc_msm/snd_soc_msm_Sitar_Sglte:system/etc/snd_soc_msm/snd_soc_msm_Sitar_Sglte \
                      device/qcom/bellatrix/snd_soc_msm/snd_soc_msm_Sitar_auxpcm:system/etc/snd_soc_msm/snd_soc_msm_Sitar_auxpcm \
                      device/qcom/bellatrix/snd_soc_msm/snd_soc_msm_auxpcm:system/etc/snd_soc_msm/snd_soc_msm_auxpcm \

# gps/location secuity configuration file
PRODUCT_COPY_FILES += \
    device/qcom/bellatrix/sec_config:system/etc/sec_config

# init.<device>.rc
PRODUCT_COPY_FILES += \
    device/qcom/bellatrix/init.qcom.rc:root/init.qcom.rc

PRODUCT_PACKAGES += \
    battery_monitor \
    battery_shutdown

# Wallpapers
PRODUCT_PACKAGES += Galaxy4
PRODUCT_PACKAGES += HoloSpiralWallpaper
PRODUCT_PACKAGES += MagicSmokeWallpapers
PRODUCT_PACKAGES += NoiseField
PRODUCT_PACKAGES += PhaseBeam

#fstab.qcom
PRODUCT_PACKAGES += fstab.qcom

#wlan driver
PRODUCT_COPY_FILES += \
    device/qcom/bellatrix/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    device/qcom/bellatrix/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    device/qcom/bellatrix/WCNSS_qcom_wlan_nv.bin:persist/WCNSS_qcom_wlan_nv.bin

PRODUCT_PACKAGES += \
    wpa_supplicant_overlay.conf \
    p2p_supplicant_overlay.conf

PRODUCT_PACKAGES += wcnss_service

#ANT+ stack
PRODUCT_PACKAGES += \
AntHalService \
libantradio \
antradio_app
