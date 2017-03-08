#ADDITIONAL_DEFAULT_PROPERTIES += \
#	ro.adb.secure=0 \
#	persist.sys.usb.config=adb \
#	ro.debuggable=1

# Add proprietary binary files
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,$(LOCAL_PATH)/system,system)

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
                    GoogleTTS \
                    GoogleHome \
                    CalendarGooglePrebuilt \
                    LatinImeGoogle \
                    Chrome \
                    Velvet

GAPPS_EXCLUDED_PACKAGES := \
	Video \
	Videos \
	GooglePackageInstaller

#	SetupWizard \

$(call inherit-product-if-exists, vendor/google/build/opengapps-packages.mk)


