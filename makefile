DIR=/usr/share/ai-assistant
SYMLINK=/usr/local/bin/ai


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
	echo "pip install -r requeriments.txt" >> $(DIR)/config
	echo "deactivate" >> $(DIR)/config
	
	chmod +x $(DIR)/config
	/bin/bash $(DIR)/config
	
	rm $(DIR)/config

uninstall:
	
	HOMEDIR=/home/$(SUDO_USER)
	@if [ -d $(DIR) ]; then rm -r $(DIR); fi
	@if [ -d $(HOMEDIR)/.config/ai-assistant ]; then rm -r $(HOMEDIR)/.config/ai-assistant; fi
	@if [ -f $(SYMLINK) ]; then rm $(SYMLINK); fi
.PHONY: clean install
