# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
EGO_PN="github.com/exercism/cli"

KEYWORDS="~x86 ~amd64"
EGIT_COMMIT=v${PV}
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"

DESCRIPTION="Command-Line-Tool for the exercism.io website."
HOMEPAGE="http://exercism.io/"

inherit golang-vcs-snapshot
inherit golang-build

src_compile() {
	ego_pn_check
	set -- env GOPATH="${S}:$(get_golibdir_gopath)" \
		go build -v -work -x ${EGO_BUILD_FLAGS} "${EGO_PN}/exercism"
	echo "$@"
	"$@" || die
}

src_install() {
	ego_pn_check
	set -- env GOPATH="${S}:$(get_golibdir_gopath)" \
		go install -v -work -x "${EGO_PN}/exercism"
	echo "$@"
	"$@" || die
	golang_install_pkgs
}