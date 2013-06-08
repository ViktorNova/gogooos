# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit gnome2-utils cmake-utils git-2

DESCRIPTION="Gala Window Manager"
HOMEPAGE="https://github.com/dudochkin-victor/${PN}"
EGIT_REPO_URI="https://github.com/dudochkin-victor/${PN}"
#SRC_URI="https://github.com/dudochkin-victor/${PN}/tarball/${PV} -> ${P}.tar.gz"
#S="${WORKDIR}/dudochkin-victor-${PN}-eff4b3c"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	dev-libs/libgee
	media-libs/clutter
	media-libs/clutter-gtk
	x11-libs/granite
	x11-libs/bamf
	x11-libs/libXfixes
	pantheon-base/plank
	>=x11-wm/mutter-3.5.3"
DEPEND="${RDEPEND}
	dev-lang/vala:0.18
	virtual/pkgconfig"

src_configure() {
	local mycmakeargs=(
		-DGSETTINGS_COMPILE=OFF
		-DVALA_EXECUTABLE="$(type -p valac-0.18)"
	)

	cmake-utils_src_configure
}

pkg_preinst() {
	gnome2_schemas_savelist
}

pkg_postinst() {
	gnome2_schemas_update
}

pkg_postrm() {
	gnome2_schemas_update
}

