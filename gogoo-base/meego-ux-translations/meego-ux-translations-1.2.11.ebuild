# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit gnome2-utils 

DESCRIPTION="Translation files for meego-ux"
HOMEPAGE="https://launchpad.net/indicator-session"
#EBZR_REPO_URI="lp:indicator-session"
SRC_URI="${P}.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="nls"

#BuildRequires:  pkgconfig(QtCore)

RDEPEND="
	dev-qt/qtcore
	"
DEPEND="${RDEPEND}
	dev-util/intltool
	dev-util/pkgconfig
	nls? ( sys-devel/gettext )"

