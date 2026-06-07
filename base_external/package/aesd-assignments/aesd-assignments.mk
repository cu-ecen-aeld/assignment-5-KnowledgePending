
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

AESD_ASSIGNMENTS_VERSION = 'ec9e8d1affdb50f5fd74b43788a112f7e5e3fbd1'
AESD_ASSIGNMENTS_SITE = 'git@github.com:cu-ecen-aeld/assignments-3-and-later-KnowledgePending.git'
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -d $(TARGET_DIR)/etc/finder-app/conf

	$(INSTALL) -m 0755 $(@D)/conf/* \
		$(TARGET_DIR)/etc/finder-app/conf/

	$(INSTALL) -m 0755 $(@D)/finder-app/writer \
		$(TARGET_DIR)/usr/bin/

	$(INSTALL) -m 0755 $(@D)/finder-app/finder.sh \
		$(TARGET_DIR)/usr/bin/

	$(INSTALL) -m 0755 $(@D)/finder-app/finder-test.sh \
		$(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))
