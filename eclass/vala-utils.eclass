# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# @ECLASS: vala-utils.eclass
# @MAINTAINER:
# Gavrilov Maksim <ulltor@gmail.com>
#
# @CODE
# Original Author: Gavrilov Maksim <ulltor@gmail.com>
# @CODE
# @BLURB: Automatic management of Vala dependencies and environmental variables.
# @DESCRIPTION:
# The vala-utils eclass automaticly manages Vala dependencies and sets VALAC
# environmental variable to required version.

inherit versionator

case ${EAPI:-0} in
	4|3) EXPORT_FUNCTIONS pkg_setup ;;
	*) die "EAPI=${EAPI} is not supported" ;;
esac

# @ECLASS-VARIABLE: VALAC_REQ_SLOT
# @DESCRIPTION:
# Should be set if package depends on special valac slot,
# i.e. VALAC_REQ_SLOT=0.14
# This overrides all VALAC_*_VERSION.

# @ECLASS-VARIABLE: VALAC_REQ_VERSION
# @DESCRIPTION:
# Should be set if package depends on special version of valac,
# i.e. VALAC_REQ_VERSION=0.13.4
# This overrides VALAC_MIN_VERSION and VALAC_MAX_VERSION.

# @ECLASS-VARIABLE: VALAC_MIN_VERSION
# @DESCRIPTION:
# The minimum version of valac that package can be built with,
# i.e. VALAC_MIN_VERSION=0.11.7

# @ECLASS-VARIABLE: VALAC_MAX_VERSION
# @DESCRIPTION:
# The maximum version of valac that package can be built with,
# i.e. VALAC_MAX_VERSION=0.13.2


# Dealing with dependencies
if [[ -n "${VALAC_REQ_SLOT}" ]]; then
	DEPEND="${DEPEND}
		dev-lang/vala:${VALAC_REQ_SLOT}"
else
	if [[ -n "${VALAC_REQ_VERSION}" ]]; then
		DEPEND="${DEPEND}
			=dev-lang/vala-${VALAC_REQ_VERSION}"
	else
		if [[ -n "${VALAC_MIN_VERSION}" ]]; then
			DEPEND="${DEPEND}
			>=dev-lang/vala-${VALAC_MIN_VERSION}"
		fi

		if [[ -n "${VALAC_MAX_VERSION}" ]]; then
			DEPEND="${DEPEND}
			<=dev-lang/vala-${VALAC_MAX_VERSION}"
		fi
	fi
fi

########################
### HELPER FUNCTIONS ###
########################

# Gets the version of the valac which filename was passed
_get_valac_version() {
	if [[ "$#" -ne 1 ]]; then
		die "${FUNCNAME}() accepts exactly one argument"
	fi

	echo "$(${1} --version | awk '{print $2}')"
}

# Gets the slot of the valac which filename was passed
_get_valac_slot() {
	if [[ "$#" -ne 1 ]]; then
		die "${FUNCNAME}() accepts exactly one argument"
	fi

	echo "${1##*-}"
}

##########################
### EXPORTED FUNCTIONS ###
##########################

vala-utils_pkg_setup() {
	# Array for storing all valacs (by path)
	valacs=( $(find "${ROOT}/usr/bin/" -name "valac-*" -print | sort) )

	# Array for all valac slots
	declare -a valac_slots

	for v in ${valacs[@]}; do
		valac_slots=( ${valac_slots[@]} $(_get_valac_slot "${v}") )
	done

	# Array for all valac versions
	declare -a valac_versions

	for v in ${valacs[@]}; do
		valac_versions=( ${valac_versions[@]} $(_get_valac_version "${v}") )
	done

	for i in $(seq 0 $((${#valacs[@]} - 1))); do
		# slot == VALAC_REQ_SLOT
		if [[ -n "${VALAC_REQ_SLOT}" && "${VALAC_REQ_SLOT}" == "${valac_slots[i]}" ]]; then
			VALAC="${valacs[i]}"
			break
		else
			# version == VALAC_REQ_VERSION
			if [[ -n "${VALAC_REQ_VERSION}" && "${VALAC_REQ_VERSION}" == "${valac_versions[i]}" ]]; then
				VALAC="${valacs[i]}"
				break
			else
				# VALAC_MIN_VERSION <= version
				if [[ -n "${VALAC_MIN_VERSION}" && -z "${VALAC_MAX_VERSION}" ]]; then
					if version_is_at_least "${VALAC_MIN_VERSION}" "${valac_versions[i]}"; then
						VALAC="${valacs[i]}"
					fi
				else
					# version <= VALAC_MAX_VERSION
					if [[ -z "${VALAC_MIN_VERSION}" && -n "${VALAC_MAX_VERSION}" ]]; then
						if version_is_at_least "${valac_versions[i]}" "${VALAC_MAX_VERSION}"; then
							VALAC="${valacs[i]}"
						fi
					else
						# VALAC_MIN_VERSION <= version <= VALAC_MAX_VERSION
						if [[ -n "${VALAC_MIN_VERSION}" && -n "${VALAC_MAX_VERSION}" ]]; then
							if version_is_at_least "${VALAC_MIN_VERSION}" "${valac_versions[i]}" \
							  && version_is_at_least "${valac_versions[i]}" "${VALAC_MAX_VERSION}"; then
								VALAC="${valacs[i]}"
							fi
						fi # VALAC_MIN_VERSION <= version <= VALAC_MAX_VERSION
					fi # version <= VALAC_MAX_VERSION
				fi # VALAC_MIN_VERSION <= version
			fi # version == VALAC_REQ_VERSION
		fi # slot == VALAC_REQ_SLOT
	done

	if [[ -n "${VALAC}" ]]; then
		export VALAC
	else
		die "No sutable version of dev-lang/vala found!"
	fi
}
