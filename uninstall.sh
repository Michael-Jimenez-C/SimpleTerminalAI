echo 'Uninstall script'

USUARIO=${SUDO_USER:-$(whoami)}
HOMEDIR=/home/$USUARIO
if [ $EUID -eq 0 ]; then
    HOMEDIR=/root
fi
echo $HOMEDIR
echo "Running as $USUARIO"

read -p "¿Remove Terminal Asistant? (S/N)" response
response=${response:-"s"}
response=$(echo "$respuesta" | tr '[:upper:]' '[:lower:]')
DIR=$HOMEDIR/.local/ai-assistant
SYMLINK=$HOMEDIR/.local/bin/ai
if [ "$response" == "n" ];then
    exit 0
fi

echo "Removing $DIR"
rm -rf $DIR
echo "Removing $SYMLINK"
rm $SYMLINK
