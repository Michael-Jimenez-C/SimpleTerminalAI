#!/bin/bash


source $HOME/.local/ai-assistant/venv/bin/activate

python $HOME/.local/ai-assistant/ai "$@"

deactivate
