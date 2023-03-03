# Copyright (C) 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Platform Path
PLATFORM_COMMON_PATH := device/motorola/sm4250-common

# Platform
BENGAL := bengal
TARGET_KERNEL_VERSION := 4.19
PRODUCT_PLATFORM_MOT := true
TARGET_BOARD_PLATFORM := $(BENGAL)

# A/B support
AB_OTA_UPDATER := true
PRODUCT_SHIPPING_API_LEVEL := 29

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    product \
    system \
    vendor \
    vbmeta \
    vbmeta_system

# Audio
PRODUCT_COPY_FILES += \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/firmware/aw882xx_pid_1852_acf.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/aw882xx_pid_1852_acf.bin \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/firmware/aw882xx_pid_2113_acf.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/aw882xx_pid_2113_acf.bin

# Dynamic Partitions
TARGET_USES_DYNAMIC_PARTITIONS := true

# Fingerprint
PRODUCT_COPY_FILES += \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/usr/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-fpc.kl \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/usr/idc/uinput-fpc.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/uinput-fpc.idc

TARGET_USES_FPC_FINGERPRINT := true

# Gatekeeper
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.gatekeeper.disable_spu=true

# Media
PRODUCT_COPY_FILES += \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/media_profiles_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_vendor.xml

# MSM IRQ Balancer configuration file
PRODUCT_COPY_FILES += \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

# Power
PRODUCT_COPY_FILES += \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json

PRODUCT_USES_PIXEL_POWER_HAL := true

# QCOM Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.qcom.bluetooth.soc=cherokee

# Qualcomm WiFi Configuration
PRODUCT_COPY_FILES += \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(PLATFORM_COMMON_PATH)/rootdir/vendor/firmware/wlan/qca_cld/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/qca_cld/WCNSS_qcom_cfg.ini

# Telephony
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=10,10

$(call inherit-product, device/motorola/common/common.mk)
$(call inherit-product, vendor/motorola/sm4250-common/sm4250-common-vendor.mk)
