DIR=/usr/share/ai-assistant
SYMLINK=/usr/local/bin/ai


all:
	@echo si no se ejecuta, usa make clean, make install

clean:
	@if [ -f $(SYMLINK) ]; then rm $(SYMLINK); fi

install:
	@echo Instalando
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
	@rm $(SYMLINK)
	@rm -r $(DIR)

.PHONY: clean install
