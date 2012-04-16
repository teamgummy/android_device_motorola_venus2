# Droid Pro Board Config

# Use the non-open-source part, if present
-include vendor/motorola/droid2we/BoardConfigVendor.mk

# Use the part that is common between all tunas
include device/motorola/omap34com/BoardConfig.mk

# Processor
TARGET_BOOTLOADER_BOARD_NAME := venus2

# Command line
TARGET_PREBUILT_KERNEL := device/motorola/venus2/kernel
BOARD_KERNEL_CMDLINE := console=ttyS2,115200n8 rw mem=498M@0x80C00000 init=/init ip=off brdrev=P3A androidboot.bootloader=0x0000 mmcparts=mmcblk1:p7(pds),p15(boot),p16(recovery),p17(cdrom),p18(misc),p19(cid),p20(kpanic),p21(system),p22(cache),p23(preinstall),p24(userdata) androidboot.mode=reboot androidboot.bootloader=D011 androidboot.serialno=0A3A94CF0602D02

# Audio
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_AUDIO_LEGACY := true
ifdef BOARD_USES_AUDIO_LEGACY
COMMON_GLOBAL_CFLAGS += -DBOARD_USES_AUDIO_LEGACY
endif
TARGET_PROVIDES_LIBAUDIO := true

# Camera
BOARD_OVERLAY_BASED_CAMERA_HAL := true

# Recovery
TARGET_PREBUILT_RECOVERY_KERNEL := device/motorola/venus2/kernel
BOARD_MKE2FS := device/motorola/droid2we/releaseutils/mke2fs

TARGET_PROVIDES_INIT_RC := true

# UMS
BOARD_MASS_STORAGE_FILE_PATH := "/sys/devices/platform/usb_mass_storage/lun0/file"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/usb_mass_storage/lun0/file"
BOARD_USE_USB_MASS_STORAGE_SWITCH := true
BOARD_CUSTOM_USB_CONTROLLER := ../../device/motorola/droid2we/UsbController.cpp
BOARD_MTP_DEVICE := "/dev/mtp"
