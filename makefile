DIR=/usr/share/ai-assistant
SYMLINK=/usr/local/bin/ai
HOMEDIR=/home/$(SUDO_USER)

all:
	@echo si no se ejecuta, usa make clean, make install

clean:
	@if [ -f $(SYMLINK) ]; then rm $(SYMLINK); fi

install:
	mkdir -p $(DIR)
	cp -r . $(DIR)/
	chmod +x $(DIR)/ai.sh
	ln -s $(DIR)/ai.sh $(SYMLINK)
	python3 -m venv $(DIR)/venv

	echo "source $(DIR)/venv/bin/activate" > $(DIR)/config
	echo "pip install -r requirements.txt" >> $(DIR)/config
	echo "deactivate" >> $(DIR)/config

	chmod +x $(DIR)/config
	/bin/bash $(DIR)/config

	rm $(DIR)/config

uninstall:
	if sudo -n true 2>/dev/null ; then
		echo "El usuario es sudoer."
	else
		echo "El usuario NO es sudoer."
	fi
	#echo removing dir
	#@if [ -d $(DIR) ]; then rm -r $(DIR); fi
	#echo removing configs $(HOMEDIR)/.config/ai-assistant/
	#@if [ -d $(HOMEDIR)/.config/ai-assistant ]; then rm -r $(HOMEDIR)/.config/ai-assistant/; fi
	#echo removing symlink $(SYMLINK)
	#@if [ -f $(SYMLINK) ]; then rm $(SYMLINK); fi
.PHONY: clean install
