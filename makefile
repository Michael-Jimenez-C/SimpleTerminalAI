install:
        mkdir -p /usr/share/ai-assistant
        cp -r . /usr/share/ai-assistant/
        chmod +x /usr/share/ai-assistant/ai.sh
        ln -s /usr/share/ai-assistant/ai.sh /usr/local/bin/ai
        python3 -m venv /usr/share/ai-assistant/venv
        
        echo "source /usr/share/ai-assistant/venv/bin/activate" > /usr/share/ai-assistant/config
        echo "pip install -r requeriments.txt" >> /usr/share/ai-assistant/config
        echo "deactivate" >> /usr/share/ai-assistant/config
        
        chmod +x /usr/share/ai-assistant/config

        /bin/bash /usr/share/ai-assistant/config

        rm /usr/share/ai-assistant/config

.PHONY: install
