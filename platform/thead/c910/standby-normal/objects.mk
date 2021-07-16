#
# SPDX-License-Identifier: BSD-2-Clause
#

.DEFAULT_GOAL := all

platform-objs-y += standby-normal/standby.o standby-normal/loadelf.o

$(platform_build_dir)/standby-normal/standby.o: $(platform_build_dir)/standby-normal/standby.bin

$(platform_build_dir)/standby-normal/standby.bin: FORCE
	$(CMD_PREFIX)echo " CLEAN     (standby)"
	$(CMD_PREFIX)make -C $(platform_src_dir)/standby-normal/sunxi-standby clean
	$(CMD_PREFIX)make -C $(platform_src_dir)/standby-normal/sunxi-standby OUT=$@ CROSS_COMPILE=$(CROSS_COMPILE)

.PHONY:FORCE
FORCE:
