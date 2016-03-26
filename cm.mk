$(call inherit-product, device/zte/draconis/full_draconis.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_RELEASE_NAME := ZTE ZMAX

    PRODUCT_PROPERTY_OVERRIDES += \
        ro.ota.romname=CyanogenMod-draconis \
        ro.ota.version=$(shell date +%Y%m%d)
    PRODUCT_NAME := cm_draconis
    PRODUCT_COPY_FILES += \
        vendor/cm/prebuilt/common/bootanimation/720.zip:system/media/bootanimation.zip


PRODUCT_PACKAGES += OTAUpdates
