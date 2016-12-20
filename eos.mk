$(call inherit-product, device/zte/draconis/full_draconis.mk)

# Inherit some common Euphoria OS stuff.
$(call inherit-product, vendor/eos/config/common_full_phone.mk)

PRODUCT_RELEASE_NAME := draconis
PRODUCT_NAME := eos_draconis
