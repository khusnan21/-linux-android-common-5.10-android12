########################################################################
# Kernel settings
########################################################################

# Kernel variant. This is currently used only on the Source package name.
# Use 'android' for Android kernels ("downstream") or 'mainline' for upstream
# kernels.
VARIANT = android

# Kernel base version
KERNEL_BASE_VERSION = $(VERSION).$(PATCHLEVEL).$(SUBLEVEL)-android12-9

# The kernel cmdline to use
KERNEL_BOOTIMAGE_CMDLINE = 

# Slug for the device vendor. This is going to be used in the KERNELRELASE
# and package names.
DEVICE_VENDOR = common

# Slug for the device model. Like above.
DEVICE_MODEL = 5.10-android12

# Slug for the device platform. If unsure, keep this commented.
#DEVICE_PLATFORM =

# Marketing-friendly full-name. This will be used inside package descriptions
DEVICE_FULL_NAME = Android Generic Kernel Image ($(DEVICE_MODEL))

# Whether to use configuration fragments to augment the kernel configuration.
# If unsure, keep this to 0.
KERNEL_CONFIG_USE_FRAGMENTS = 1

# Whether to use diffconfig to generate the device-specific configuration.
# If you enable this, you should set KERNEL_CONFIG_USE_FRAGMENTS to 1.
# If unsure, keep this to 0.
KERNEL_CONFIG_USE_DIFFCONFIG = 0

# The diffconfig to apply. Only used when KERNEL_CONFIG_USE_DIFFCONFIG is
# enabled.
#KERNEL_PRODUCT_DIFFCONFIG =

# Defconfig to use
KERNEL_DEFCONFIG = gki_defconfig

# Whether to include DTBs with the image. Use 0 (no) or 1.
KERNEL_IMAGE_WITH_DTB = 0

# Path to the DTB
# If you leave this undefined, an attempt to find it automatically
# will be made.
# KERNEL_IMAGE_DTB = arch/arm64/boot/dts/qcom/my_dtb.dtb

# Whether to include a DTB Overlay. Use 0 (no) or 1.
KERNEL_IMAGE_WITH_DTB_OVERLAY = 0

# Path to the DTB overlay.
# If you leave this undefined, an attempt to find it automatically
# will be made.
# KERNEL_IMAGE_DTB_OVERLAY = arch/arm64/boot/dts/qcom/my_overlay.dtbo

# Whether to include the DTB Overlay into the kernel image
# Use 0 (no, default) or 1.
# dtbo.img will always be shipped in the linux-bootimage- package.
KERNEL_IMAGE_WITH_DTB_OVERLAY_IN_KERNEL = 0

# Path to a specifc configuration file for mkdtboimg.
# The default is to leave it undefined.
#KERNEL_IMAGE_DTB_OVERLAY_CONFIGURATION = debian/custom_dtbo_config.cfg

# Path to the DTB directory. Only define if KERNEL_IMAGE_DTB_OVERLAY_CONFIGURATION
# is defined too.
#KERNEL_IMAGE_DTB_OVERLAY_DTB_DIRECTORY = arch/arm64/boot/dts/qcom

# Path to the prebuilt DT image. should only be defined on header version 1 and below. 
# mostly used on samsung devices. default is to leave it undefined
# KERNEL_PREBUILT_DT = debian/dt.img

# Various other settings that will be passed straight to mkbootimg
KERNEL_BOOTIMAGE_PAGE_SIZE = 4096
KERNEL_BOOTIMAGE_BASE_OFFSET = 
KERNEL_BOOTIMAGE_KERNEL_OFFSET = 
KERNEL_BOOTIMAGE_INITRAMFS_OFFSET = 
KERNEL_BOOTIMAGE_SECONDIMAGE_OFFSET = 
KERNEL_BOOTIMAGE_TAGS_OFFSET = 

# Specify boot image security patch level if needed
KERNEL_BOOTIMAGE_PATCH_LEVEL = 2023-08

# Specify boot image OS version if needed
KERNEL_BOOTIMAGE_OS_VERSION = 12.0.0

# Required for header version 2, ignore otherwise
KERNEL_BOOTIMAGE_DTB_OFFSET = 

# Kernel bootimage version. Defaults to 0 (legacy header).
# As a rule of thumb:
# Devices launched with Android 8 and lower: version 0
# Devices launched with Android 9: version 1
# Devices launched with Android 10: version 2
# Devices launched with Android 11: version 2 or 3 (GKI)
KERNEL_BOOTIMAGE_VERSION = 4

# Kernel initramfs compression. Defaults to gzip.
# All non-gki devices need a gzip (gz) initramfs
# For devices launched with a GKI kernel it can be either gzip (gz) or lz4 (lz4)
KERNEL_INITRAMFS_COMPRESSION = lz4

########################################################################
# Android verified boot
########################################################################

# Whether to build a flashable vbmeta.img. Please note that currently
# only empty vbmeta images (disabling verified boot) can be generated.
# Use 0 (no) or 1 (default).
DEVICE_VBMETA_REQUIRED = 0

# Samsung devices require a special flag. Enable the following if your
# device is a Samsung device that requires flag 0 to be present
# Use 0 (no, default) or 1.
DEVICE_VBMETA_IS_SAMSUNG = 0

########################################################################
# Automatic flashing on package upgrades
########################################################################

# Whether to enable kernel upgrades on package upgrades. Use 0 (no) or 1.
FLASH_ENABLED = 0

# If your device is treble-ized, but aonly, you should set the following to
# 1 (yes).
FLASH_IS_AONLY = 0

# `flash-bootimage` defaults are enough for most recent devices, but legacy
# devices won't work out of the box.
# If you set the following to 1, this package will set `flash-bootimage`'s
# DEVICE_IS_AB and BOOTIMAGE_SLOT_A accordingly, thus enabling flashing
# on older devices.
#
# Do not enable if you don't know what you're doing
FLASH_IS_LEGACY_DEVICE = 0

# On some exynos devices partition names are capitalized (boot is BOOT and so on)
# This flag makes the kernel to get flashed to the correct partition on updates.
FLASH_IS_EXYNOS = 0

# Device manufacturer. This must match the `ro.product.vendor.manufacturer`
# Android property. If you don't want to specify this, leave it undefined,
# FLASH_INFO_CPU will be checked instead.
#FLASH_INFO_MANUFACTURER = Vendor

# Device model. This must match the `ro.product.vendor.model`
# Android property. If you don't want to specify this, leave it undefined,
# FLASH_INFO_CPU will be checked instead.
#FLASH_INFO_MODEL = Device1

# Device CPU. This will be grepped against /proc/cpuinfo to check if
# we're running on the specific device. Note this is a last-resort
# method, specifying FLASH_INFO_MANUFACTURER and FLASH_INFO_MODEL is
# recommended.
#FLASH_INFO_CPU = My Fictional System-on-a-Chip

# Space-separated list of supported device ids as reported by fastboot
FLASH_INFO_DEVICE_IDS = model1 model2

########################################################################
# Kernel build settings
########################################################################

# Whether to cross-build. Use 0 (no) or 1.
BUILD_CROSS = 1

# (Cross-build only) The build triplet to use. You'll probably want to
# use aarch64-linux-android- if building Android kernels.
BUILD_TRIPLET = aarch64-linux-gnu-

# (Cross-build only) The build triplet to use with clang. You'll probably
# want to use aarch64-linux-gnu- here.
BUILD_CLANG_TRIPLET = aarch64-linux-gnu-

# The compiler to use. Recent Android kernels are built with clang.
BUILD_CC = clang

# Use llvm instead of gcc. Recent Android kernels (past android 12) need llvm.
BUILD_LLVM = 1

# Extra paths to prepend to the PATH variable. You'll probably want
# to specify the clang path here (the default).
BUILD_PATH = /usr/lib/llvm-android-12.0-r416183b/bin

# Extra packages to add to the Build-Depends section. Mainline builds
# can have this section empty, unless cross-building.
# The default is enough to install the Android toolchain, including clang.
DEB_TOOLCHAIN = linux-initramfs-halium-generic:arm64, binutils-aarch64-linux-gnu, clang-android-12.0-r416183b, gcc-4.9-aarch64-linux-android, g++-4.9-aarch64-linux-android, libgcc-4.9-dev-aarch64-linux-android-cross, lz4

# Where we're building on
DEB_BUILD_ON = amd64

# Where we're going to run this kernel on
DEB_BUILD_FOR = arm64

# Target kernel architecture
KERNEL_ARCH = arm64

# Kernel target to build
KERNEL_BUILD_TARGET = Image
