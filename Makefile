
include env


GIT_CONFIG_PATH=$(WORKSPACE_PATH)/git/config


SSH_DIR=$(WORKSPACE_PATH)/ssh
SSH_KEY_PATH=$(SSH_DIR)/id_rsa


git_config:
	mkdir -p $(WORKSPACE_PATH)/git
	echo "[user]" > $(GIT_CONFIG_PATH)
	echo "	name = $(USER_NAME)" >> $(GIT_CONFIG_PATH)
	echo "	email = $(USER_EMAIL)" >> $(GIT_CONFIG_PATH)


ssh_keys:
	mkdir -p $(SSH_DIR)
	ssh-keygen -t rsa -b 4096 -f $(SSH_KEY_PATH) -N "" -C "$(USER_EMAIL)"

show_git_config:
	cat $(GIT_CONFIG_PATH)


all: git_config ssh_keys
