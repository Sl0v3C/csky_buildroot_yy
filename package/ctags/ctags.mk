################################################################################
#
# ctags
#
################################################################################

CTAGS_VERSION = 5.8
CTAGS_SOURCE = ctags-$(CTAGS_VERSION).tar.gz
CTAGS_SITE = https://nchc.dl.sourceforge.net/project/ctags/ctags/5.8


define CTAGS_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
                     exec_prefix=$(TARGET_DIR) prefix=$(TARGET_DIR) install
endef

$(eval $(autotools-package))
