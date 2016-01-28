# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := prodcon-sc-disconn-ms
### Rules for final target.
LDFLAGS_Debug := \
	-Wl,--as-needed

LDFLAGS_Release := \
	-Wl,--as-needed

LIBS := \
	-lpthread \
	-lgflags

$(builddir)/prodcon-sc-disconn-ms: GYP_LDFLAGS := $(LDFLAGS_$(BUILDTYPE))
$(builddir)/prodcon-sc-disconn-ms: LIBS := $(LIBS)
$(builddir)/prodcon-sc-disconn-ms: LD_INPUTS := $(obj).target/libscal.a $(obj).target/libprodcon-base.a $(obj).target/libsc-disconn-ms.a
$(builddir)/prodcon-sc-disconn-ms: TOOLSET := $(TOOLSET)
$(builddir)/prodcon-sc-disconn-ms: $(obj).target/libscal.a $(obj).target/libprodcon-base.a $(obj).target/libsc-disconn-ms.a FORCE_DO_CMD
	$(call do_cmd,link)

all_deps += $(builddir)/prodcon-sc-disconn-ms
# Add target alias
.PHONY: prodcon-sc-disconn-ms
prodcon-sc-disconn-ms: $(builddir)/prodcon-sc-disconn-ms

# Add executable to "all" target.
.PHONY: all
all: $(builddir)/prodcon-sc-disconn-ms

