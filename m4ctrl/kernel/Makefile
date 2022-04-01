#
# Copyright 2017 NXP
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
kbuild:
	$(info Building m4ctrl_dev for $(SOC))
	$(info kernel dir $(KDIR))
	make SOC=$(SOC) ARCH=$(ARCH) -C $(KDIR) M=`pwd`

clean:
	make ARCH=$(ARCH) -C $(KDIR) M=`pwd` clean
	-rm -f *~ Module.symvers Module.markers modules.order
