#!/usr/bin/env bash

set -euo pipefail

info() {
    echo "[INFO] $1"
}

warn() {
    echo "[WARN] $1"
}

fatal() {
    echo "[FATAL] $1"
    tail -f /dev/null
}

do_insmod() {

	if lsmod | grep m4ctrl_dev >/dev/null 2>&1
	then
		return 0
	fi

    if [ ! -f "${module_path}" ]
    then
        return 1
    fi

    modinfo "${module_path}"

	if ! insmod "${module_path}"
	then
		dmesg | grep m4ctrl_dev
		return 1
	else
		dmesg | grep m4ctrl_dev
		return 0
	fi
}


# buildmod_cmd=/usr/src/app/buildmod.sh
module_path=/usr/src/app/m4ctrl/kernel/m4ctrl_dev.ko


# # if ! do_insmod
# # then
# # 	"${buildmod_cmd}" || warn "Failed to build m4ctrl kernel module!"
# # fi

# if ! do_insmod && [ -n "${DISABLE_USERSPACE:-}" ]
# then
#     fatal "Failed to load kernel module and userspace is disabled!"
#     info "Check your Device Type and OS Version or unset DISABLE_USERSPACE."
# fi

# if do_insmod
# then
#     info "Using m4ctrl kernel module for loading firmware into cortex-m4f co-microprocessor!"
# fi

# # restrict default file creation permissions
# umask 077


if do_insmod
then
    info "Using m4ctrl kernel module for loading firmware into cortex-m4f co-microprocessor!"
fi

sleep infinity
