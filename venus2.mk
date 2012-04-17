# This is the product configuration for a full venus2
DEVICE_PREBUILT := device/motorola/venus2/prebuilt

# high-density artwork where available
PRODUCT_AAPT_CONFIG := normal mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

# Camera
PRODUCT_PACKAGES := \
	Camera

# Audio
PRODUCT_COPY_FILES += \
    device/motorola/venus2/audio/libaudio.so:/system/lib/libaudio.so \
    device/motorola/venus2/audio/liba2dp.so:/system/lib/liba2dp.so

PRODUCT_PACKAGES += \
    audio.primary.omap3 \
    libaudiohw_legacy \
    audio.a2dp.default \
    libaudioutils

PRODUCT_PACKAGES += \
    hijack-boot.zip

# Hijack files
PRODUCT_COPY_FILES += \
	$(DEVICE_PREBUILT)/etc/hijack-boot.zip:system/etc/hijack-boot.zip

# Kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/motorola/venus2/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# copy all kernel modules under the "modules" directory to system/lib/modules
PRODUCT_COPY_FILES += $(shell \
    find device/motorola/venus2/modules -name '*.ko' \
    | sed -r 's/^\/?(.*\/)([^/ ]+)$$/\1\2:system\/lib\/modules\/\2/' \
    | tr '\n' ' ')

PRODUCT_PROPERTY_OVERRIDES += \
	persist.ril.features=0x0E \
	persist.ril.modem.ttydevice=/dev/usb/tty1-3:1.4 \
	persist.ril.mux.noofchannels=8 \
	ro.ril.ntmodeglobal=true

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Inherit from maguro device
$(call inherit-product, device/motorola/venus2/device.mk)

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := full_venus2
PRODUCT_DEVICE := venus2
PRODUCT_BRAND := verizon
PRODUCT_MODEL := DROID Pro
