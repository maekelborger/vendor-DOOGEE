#ADDITIONAL_DEFAULT_PROPERTIES += \
#	ro.adb.secure=0 \
#	persist.sys.usb.config=adb \
#	ro.debuggable=1

# Add proprietary binary files
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,$(LOCAL_PATH)/system/common,system)

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/twrp.fstab:recovery/root/etc/twrp.fstab

PRODUCT_PACKAGES += \
	busybox

########################################################
# GAPPS apps
GAPPS_VARIANT := pico
GAPPS_FORCE_PACKAGE_OVERRIDES := true
#GAPPS_FORCE_MATCHING_DPI := true
DONT_DEXPREOPT_PREBUILTS := true
GAPPS_FORCE_WEBVIEW_OVERRIDES := true
GAPPS_FORCE_BROWSER_OVERRIDES := true

PRODUCT_PACKAGES += \
        Chrome \
	CalendarGoogle \
	Gmail \
	Drive

GAPPS_EXCLUDED_PACKAGES := \
	Video \
	Videos \
	GooglePackageInstaller

ifneq ($(MTK_K64_SUPPORT), yes)
WITH_DEXPREOPT := true
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,$(LOCAL_PATH)/system/x32,system)
else
WITH_DEXPREOPT := false
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,$(LOCAL_PATH)/system/x64,system)
endif

$(call inherit-product-if-exists, vendor/opengapps/build/opengapps-packages.mk)

