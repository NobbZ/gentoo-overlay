# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
SLOT=0

KEYWORDS="~x86 ~amd64"
LICENSE="Apache-2.0"

SRC_URI="https://github.com/erlang/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

DESCRIPTION="Erlang build tool."
HOMEPAGE="http://www.rebar3.org/"

DEPEND=">=dev-lang/erlang-18.0"

src_unpack() {
	unpack ${A}
}

src_compile() {
	./bootstrap || die "Couldn't compile rebar3"
}

src_install() {
	dobin rebar3
}
