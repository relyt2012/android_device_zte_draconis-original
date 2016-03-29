$(call inherit-product, device/zte/draconis/full_draconis.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_RELEASE_NAME := ZTE ZMAX
PRODUCT_NAME := cm_draconis
PRODUCT_PACKAGES += OTAUpdates
