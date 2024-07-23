#!/bin/bash


source /usr/share/ai-assistant/venv/bin/activate

python /usr/share/ai-assistant/ai "$@"

deactivate