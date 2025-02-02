#
# Copyright (C) 2013 The Android Open-Source Project
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
#

PRODUCT_COPY_FILES += \
    device/khadas/common/products/mbox/init.amlogic.system.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.amlogic.rc \
    device/khadas/$(PRODUCT_DIR)/init.amlogic.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.amlogic.usb.rc \
    device/khadas/$(PRODUCT_DIR)/init.amlogic.board.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.amlogic.board.rc

ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    device/khadas/common/cppreopts_amlogic.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/cppreopts_amlogic.rc
endif

PRODUCT_COPY_FILES += \
    device/khadas/common/products/mbox/ueventd.amlogic.rc:$(TARGET_COPY_OUT_VENDOR)/ueventd.rc

PRODUCT_COPY_FILES += \
    device/khadas/$(PRODUCT_DIR)/files/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles.xml \
    device/khadas/$(PRODUCT_DIR)/files/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml \
    device/khadas/$(PRODUCT_DIR)/files/audio_effects.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.conf \
    device/khadas/$(PRODUCT_DIR)/files/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    device/khadas/$(PRODUCT_DIR)/files/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    device/khadas/$(PRODUCT_DIR)/files/mesondisplay.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/mesondisplay.cfg \
    device/khadas/$(PRODUCT_DIR)/files/remote.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/remote.cfg \
    device/khadas/$(PRODUCT_DIR)/files/remote.tab1:$(TARGET_COPY_OUT_VENDOR)/etc/remote.tab1 \
    device/khadas/$(PRODUCT_DIR)/files/remote.tab2:$(TARGET_COPY_OUT_VENDOR)/etc/remote.tab2 \
    device/khadas/$(PRODUCT_DIR)/files/remote.tab3:$(TARGET_COPY_OUT_VENDOR)/etc/remote.tab3 \
    device/khadas/$(PRODUCT_DIR)/files/PQ/pq.db:$(TARGET_COPY_OUT_VENDOR)/etc/tvconfig/pq/pq.db \
    device/khadas/$(PRODUCT_DIR)/files/PQ/pq_default.ini:$(TARGET_COPY_OUT_VENDOR)/etc/tvconfig/pq/pq_default.ini

ifeq ($(BOARD_COMPILE_ATV),true)
PRODUCT_COPY_FILES += \
    device/khadas/$(PRODUCT_DIR)/files/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml
else
PRODUCT_COPY_FILES += \
    device/khadas/$(PRODUCT_DIR)/aosp/files/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml
endif

ifeq ($(USE_XML_AUDIO_POLICY_CONF), 1)
PRODUCT_COPY_FILES += \
    device/khadas/$(PRODUCT_DIR)/files/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    device/khadas/$(PRODUCT_DIR)/files/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml
else
PRODUCT_COPY_FILES += \
    device/khadas/$(PRODUCT_DIR)/files/audio_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy.conf
endif

ifeq ($(TARGET_WITH_MEDIA_EXT), true)
PRODUCT_COPY_FILES += \
    device/khadas/$(PRODUCT_DIR)/files/media_codecs_ext.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_ext.xml
endif

PRODUCT_COPY_FILES += \
    device/khadas/$(PRODUCT_DIR)/recovery/init.recovery.amlogic.rc:root/init.recovery.amlogic.rc \
    device/khadas/$(PRODUCT_DIR)/recovery/recovery.kl:recovery/root/etc/recovery.kl \
    device/khadas/$(PRODUCT_DIR)/files/mesondisplay.cfg:recovery/root/etc/mesondisplay.cfg \
    device/khadas/common/recovery/busybox:recovery/root/sbin/busybox \
    device/khadas/common/recovery/resize2fs:recovery/root/sbin/resize2fs \
    device/khadas/$(PRODUCT_DIR)/recovery/remotecfg:recovery/root/sbin/remotecfg \
    device/khadas/$(PRODUCT_DIR)/files/remote.cfg:recovery/root/etc/remote.cfg \
    device/khadas/$(PRODUCT_DIR)/files/remote.tab1:recovery/root/etc/remote.tab1 \
    device/khadas/$(PRODUCT_DIR)/files/remote.tab2:recovery/root/etc/remote.tab2 \
    device/khadas/$(PRODUCT_DIR)/files/remote.tab3:recovery/root/etc/remote.tab3 \
    device/khadas/$(PRODUCT_DIR)/recovery/sh:recovery/root/sbin/sh

$(shell python $(LOCAL_PATH)/auto_generator.py preinstall)
-include device/khadas/kvim3/preinstall/preinstall.mk
PRODUCT_COPY_FILES += \
    device/khadas/kvim3/preinstall/preinstall.sh:system/bin/preinstall.sh

# remote IME config file
PRODUCT_COPY_FILES += \
    device/khadas/common/products/mbox/Vendor_0001_Product_0001.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/Vendor_0001_Product_0001.kl \
    device/khadas/common/products/mbox/Vendor_1915_Product_0001.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/Vendor_1915_Product_0001.kl
ifneq ($(TARGET_BUILD_GOOGLE_ATV), true)
PRODUCT_COPY_FILES += \
    device/khadas/$(PRODUCT_DIR)/files/Generic.kl:/$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/Generic.kl
else
PRODUCT_COPY_FILES += \
    device/khadas/common/Generic.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/Generic.kl
endif

PRODUCT_AAPT_CONFIG := xlarge hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_CHARACTERISTICS := mbx,nosdcard

ifneq ($(TARGET_BUILD_GOOGLE_ATV), true)
DEVICE_PACKAGE_OVERLAYS := \
    device/khadas/$(PRODUCT_DIR)/overlay
endif
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += \
    dhcptool \
    rild    \
    TeleService

PRODUCT_COPY_FILES += \
    device/khadas/common/ril/libquectel-ril/chat:system/bin/chat \
    device/khadas/common/ril/libquectel-ril/libquectel-ril.so:vendor/lib/libquectel-ril.so \
    device/khadas/common/ril/libquectel-ril/ip-up:system/etc/ppp/ip-up \
    device/khadas/common/ril/libquectel-ril/ip-down:system/etc/ppp/ip-down \
    device/khadas/common/ril/apns-conf.xml:system/etc/apns-conf.xml \
    device/khadas/common/ril/ql-ril.conf:system/etc/ql-ril.conf

# Light HAL
PRODUCT_PACKAGES += \
    lights.amlogic

# GPS HAL
PRODUCT_PACKAGES += \
    gps.amlogic

# setup dalvik vm configs.
$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)



#To remove healthd from the build
PRODUCT_PACKAGES += android.hardware.health@2.0-service.override
DEVICE_FRAMEWORK_MANIFEST_FILE += \
	system/libhidl/vintfdata/manifest_healthd_exclude.xml

#To keep healthd in the build
PRODUCT_PACKAGES += android.hardware.health@2.0-service
