# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := prodcon-ll-dds-ms
### Rules for final target.
LDFLAGS_Debug := \
	-Wl,--as-needed

LDFLAGS_Release := \
	-Wl,--as-needed

LIBS := \
	-lpthread \
	-lgflags

$(builddir)/prodcon-ll-dds-ms: GYP_LDFLAGS := $(LDFLAGS_$(BUILDTYPE))
$(builddir)/prodcon-ll-dds-ms: LIBS := $(LIBS)
$(builddir)/prodcon-ll-dds-ms: LD_INPUTS := $(obj).target/libscal.a $(obj).target/libprodcon-base.a $(obj).target/libll-dds-ms.a
$(builddir)/prodcon-ll-dds-ms: TOOLSET := $(TOOLSET)
$(builddir)/prodcon-ll-dds-ms: $(obj).target/libscal.a $(obj).target/libprodcon-base.a $(obj).target/libll-dds-ms.a FORCE_DO_CMD
	$(call do_cmd,link)

all_deps += $(builddir)/prodcon-ll-dds-ms
# Add target alias
.PHONY: prodcon-ll-dds-ms
prodcon-ll-dds-ms: $(builddir)/prodcon-ll-dds-ms

# Add executable to "all" target.
.PHONY: all
all: $(builddir)/prodcon-ll-dds-ms

