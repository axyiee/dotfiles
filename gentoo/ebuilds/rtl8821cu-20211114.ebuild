# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit linux-mod

COMMIT="121ee81893e5ee20e5ae6e6ed9f519552527743f"

DESCRIPTION="Realtek 8821(*U)/8811CU/8812A/8192E/8814A/8822B/8723(*U)/8188E(**) module for Linux kernel"
HOMEPAGE="https://github.com/eltonlika/rtl8821CU"
SRC_URI="https://github.com/eltonlika/rtl8821CU/archive/${COMMIT}.tar.gz -> rtl8821cu-${PV}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~amd64"

DEPEND="virtual/linux-sources"

S="${WORKDIR}/rtl8821CU-${COMMIT}"

MODULE_NAMES="8821cu(net/wireless)"
BUILD_TARGETS="all"
BUILD_TARGET_ARCH="${ARCH}"

pkg_setup() {
	linux-mod_pkg_setup
	BUILD_PARAMS="KERN_DIR=${KV_DIR} ARCH=x86_64 KSRC=${KV_DIR} KERN_VER=${KV_FULL} O=${KV_OUT_DIR} V=1 KBUILD_VERBOSE=1"
}

src_compile(){
	linux-mod_src_compile
}

src_install() {
	linux-mod_src_install
}

pkg_postinst() {
	linux-mod_pkg_postinst
}

