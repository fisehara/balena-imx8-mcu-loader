/*
 * Copyright 2017 NXP
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 */

#ifndef __M4CTRL_H__
#define __M4CTRL_H__ 1

#include <asm/ioctl.h>

#if !defined(__KERNEL__)
#include <fcntl.h>
#include <getopt.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <fcntl.h>
#endif /* !defined(__KERNEL__) */

#include "platform.h"

#if !defined(__KERNEL__)
/* M4 Control API */
void m4_start();
void m4_stop();
void m4_reset();
void m4_deploy(char *filename);
void m4_enable();
void m4_disable();

/* Versioning Convention:
 * 0.1.<release_number> - Alpha Version
 * 0.2.<release_number> - Beta Version
 * 1.0.<release_number> - Release Version
 *
 * Release candidates:
 * 0.1.<release_number>_rc<build_number> - Alpha Version
 * 0.2.<release_number>_rc<build_number> - Beta Version
 * 1.0.<release_number>_rc<build_number> - Release Version
 */
#define M4CTRL_VERSION "mctrl rev. 0.1.0_rc1"
#endif

#endif
