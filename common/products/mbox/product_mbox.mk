$(call inherit-product, device/khadas/common/core_amlogic.mk)
ifeq ($(BUILD_WITH_GAPPS_CONFIG),true)
$(call inherit-product-if-exists, vendor/amlogic/google/gapps.mk)
endif

ifeq ($(TARGET_BUILD_LIVETV),true)
#TV input HAL
PRODUCT_PACKAGES += \
    android.hardware.tv.input@1.0-impl \
    android.hardware.tv.input@1.0-service \
    vendor.amlogic.hardware.tvserver@1.0_vendor \
    tv_input.amlogic

# TV
PRODUCT_PACKAGES += \
    libtv \
    libtv_linker \
    libtvbinder \
    tvserver \
    libtvplay \
    libvendorfont \
    libTVaudio \
    libntsc_decode \
    libtinyxml \
    libzvbi \
    TvProvider \
    DroidLogicTvInput \
    DroidLogicFactoryMenu \
    libjnidtvsubtitle \
    libfbc

# CTC subtitle
PRODUCT_PACKAGES += \
    libsubtitlebinder

# DTV
PRODUCT_PACKAGES += \
    libam_adp \
    libam_mw \
    libam_ver \
    libam_sysfs

# LiveTv
PRODUCT_PACKAGES += \
    DroidLiveTv

# DTVKit
ifeq ($(PRODUCT_SUPPORT_DTVKIT), true)
PRODUCT_PACKAGES += \
    inputsource \
    libdtvkit_jni \
    libdtvkitserver \
    droidlogic-dtvkit \
    droidlogic.dtvkit.software.core.xml

    PRODUCT_SUPPORT_CIPLUS := false
endif

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.live_tv.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.live_tv.xml
endif

# DLNA
ifneq ($(TARGET_BUILD_GOOGLE_ATV), true)
PRODUCT_PACKAGES += \
    imageserver \
    DLNA
endif

PRODUCT_PACKAGES += \
    remotecfg

ifneq ($(TARGET_BUILD_GOOGLE_ATV), true)
# NativeImagePlayer
PRODUCT_PACKAGES += \
    NativeImagePlayer

#Launcher3
PRODUCT_PACKAGES += \
    Launcher3
endif

PRODUCT_PACKAGES += \
    FactoryTest

PRODUCT_PACKAGES += \
    setbootenv \
    getbootenv

#screencontrol
PRODUCT_PACKAGES += \
    screencontrol \
    libscreencontrolservice \
    libscreencontrol_jni \

#droid vold
PRODUCT_PACKAGES += \
    droidvold

# Camera Hal
PRODUCT_PACKAGES += \
    camera.amlogic

PRODUCT_PROPERTY_OVERRIDES += ro.hdmi.device_type=4


PRODUCT_PACKAGES += \
    OTAUpgrade

ifeq ($(BUILD_WITH_MIRACAST), true)
PRODUCT_PACKAGES += \
    Miracast
endif

#Tvsettings
PRODUCT_PACKAGES += \
    TvSettings \
    DroidTvSettings \
    SchPwrOnOff

#Browser
PRODUCT_PACKAGES += \
    Lightning

#USB PM
PRODUCT_PACKAGES += \
    usbtestpm \
    usbpower

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.app_widgets.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.app_widgets.xml \
    frameworks/native/data/etc/android.software.backup.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.backup.xml \
    frameworks/native/data/etc/android.hardware.audio.output.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.output.xml \
    frameworks/native/data/etc/android.hardware.location.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.hdmi.cec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.hdmi.cec.xml \

#copy lowmemorykiller.txt
ifeq ($(BUILD_WITH_LOWMEM_COMMON_CONFIG),true)
PRODUCT_COPY_FILES += \
	device/khadas/common/config/lowmemorykiller_2G.txt:$(TARGET_COPY_OUT_VENDOR)/etc/lowmemorykiller_2G.txt \
	device/khadas/common/config/lowmemorykiller.txt:$(TARGET_COPY_OUT_VENDOR)/etc/lowmemorykiller.txt \
	device/khadas/common/config/lowmemorykiller_512M.txt:$(TARGET_COPY_OUT_VENDOR)/etc/lowmemorykiller_512M.txt
endif

#DDR LOG
PRODUCT_COPY_FILES += \
    device/khadas/common/ddrtest.sh:$(TARGET_COPY_OUT_VENDOR)/bin/ddrtest.sh

# USB
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml

#usb accessory donnot need in atv
ifneq ($(TARGET_BUILD_GOOGLE_ATV), true)
PRODUCT_COPY_FILES += \
     frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml
endif

# Bluetooth idc config file
PRODUCT_COPY_FILES += \
    device/khadas/common/products/mbox/Vendor_1915_Product_0001.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/Vendor_1915_Product_0001.idc \
    device/khadas/common/products/mbox/Vendor_1d5a_Product_c082.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/Vendor_1d5a_Product_c082.idc

# USB HID Multitouch
PRODUCT_COPY_FILES += \
    device/khadas/common/products/mbox/Vendor_0eef_Product_0005.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/Vendor_0eef_Product_0005.idc \
    device/khadas/common/products/mbox/Vendor_03fc_Product_05d8.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/Vendor_03fc_Product_05d8.idc \
    device/khadas/common/products/mbox/Vendor_1870_Product_0119.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/Vendor_1870_Product_0119.idc \
    device/khadas/common/products/mbox/Vendor_1870_Product_0100.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/Vendor_1870_Product_0100.idc \
    device/khadas/common/products/mbox/Vendor_2808_Product_81c9.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/Vendor_2808_Product_81c9.idc \
    device/khadas/common/products/mbox/Vendor_16b4_Product_0704.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/Vendor_16b4_Product_0704.idc \
    device/khadas/common/products/mbox/Vendor_16b4_Product_0705.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/Vendor_16b4_Product_0705.idc \
    device/khadas/common/products/mbox/Vendor_04d8_Product_0c03.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/Vendor_04d8_Product_0c03.idc

custom_keylayouts := $(wildcard device/khadas/common/keyboards/*.kl)
PRODUCT_COPY_FILES += $(foreach file,$(custom_keylayouts),\
    $(file):$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/$(notdir $(file)))


# bootanimation
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bootanimation.zip:system/media/bootanimation.zip

#bootvideo
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bootvideo.zip:$(TARGET_COPY_OUT_VENDOR)/etc/bootvideo.zip

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/mbox.mp4:$(TARGET_COPY_OUT_VENDOR)/etc/bootvideo

# default wallpaper for mbox to fix bug 106225
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/default_wallpaper.png:$(TARGET_COPY_OUT_VENDOR)/etc/default_wallpaper.png

# Include BUILD_NUMBER if defined
VERSION_ID=$(shell find device/*/$(TARGET_PRODUCT) -name version_id.mk)
ifeq ($(VERSION_ID),)
export BUILD_NUMBER := $(shell date +%Y%m%d)
else
$(call inherit-product, $(VERSION_ID))
endif

DISPLAY_BUILD_NUMBER := true

#BOX project,set omx to video layer
PRODUCT_PROPERTY_OVERRIDES += \
        media.omx.display_mode=1

BOARD_HAVE_CEC_HIDL_SERVICE := true
