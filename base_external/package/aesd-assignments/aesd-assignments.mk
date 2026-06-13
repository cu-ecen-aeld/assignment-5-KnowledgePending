
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

AESD_ASSIGNMENTS_VERSION = '9f1c270eafdf5188bff11b40b029be0ee75a729d'
AESD_ASSIGNMENTS_SITE = 'git@github.com:cu-ecen-aeld/assignments-3-and-later-KnowledgePending.git'
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server all
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

	$(INSTALL) -m 0755 $(@D)/server/aesdsocket-start-stop \
		$(TARGET_DIR)/etc/init.d/S99aesdsocket

	$(INSTALL) -m 0755 $(@D)/server/aesdsocket \
		$(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))
