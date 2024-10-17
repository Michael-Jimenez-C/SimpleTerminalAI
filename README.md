# SimpleTerminalAssistant
Simple assistant for the linux terminal using gemini, this is a simple program that use the gemini API and a history file or a role string to make the gemini LLM configurable


## Instalation
Requirements
- python>=3.10
- python3-venv
- make

Clone the repo and use make to install it or move to any directory and add to the path
### Install
```sh
chmod +x install.sh
sudo ./install.sh
```
### Make
```sh
sudo make clean
sudo make install
```
this will create a symbolic link to the ai.sh into /usr/local/bin

## Use

when you install it you must configure your API_KEY from gemini, https://aistudio.google.com/app/pro
then type
```sh
ai -i
ai -t
```
-i flag will create a preferences file and -t is used to configure the API_KEY

To configure the behavior of gemini
```sh
ai -c
```

to a normal use is
```sh
ai <prompt>
```


If you want to clear the history:
```sh
ai --clean
```
And to disable the history file:
```sh
ai --toggle_hist
```
# Uninstall

use

```sh
make uninstall
```

```sh
chmod +x uninstall.sh
./uninstall.sh
```
or
```
rm /usr/local/bin/ai
rm -r /usr/share/ai-assistant
```
