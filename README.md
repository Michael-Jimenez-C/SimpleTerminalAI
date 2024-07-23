# SimpleTerminalAssistant
Simple assistant for the linux terminal using gemini


## Instalation
requeriments
- python>=3.10
- python3-venv
- make

clone the repo and use make to install it or move to any directory and add to the path

### Make
```sh
make clean
make install
```
this will create a symbolic link to the ai.sh into /usr/local/bin

## Use

when you install it you must configure your API_KEY from gemini, https://aistudio.google.com/app/pro
then type
```
ai -i
ai -t
```
-i flag will create a preferences file and -t is used to configure the API_KEY

To configure the behavior of gemini
```
ai -c
```

to a normal use is
```
ai <prompt>
```

# Uninstall

use

```sh
make uninstall
```
or
```
rm /usr/local/bin/ai
rm -r /usr/share/ai-assistant
```