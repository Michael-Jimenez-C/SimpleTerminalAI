echo "
  ____  ____  ____  __  __  ____  _  _    __    __        __    ___  ____  ___  ____   __    _  _  ____
 (_  _)( ___)(  _ \(  \/  )(_  _)( \( )  /__\  (  )      /__\  / __)(_  _)/ __)(_  _) /__\  ( \( )(_  _)
   )(   )__)  )   / )    (  _)(_  )  (  /(__)\  )(__    /(__)\ \__ \ _)(_ \__ \  )(  /(__)\  )  (   )(
  (__) (____)(_)\_)(_/\/\_)(____)(_)\_)(__)(__)(____)  (__)(__)(___/(____)(___/ (__)(__)(__)(_)\_) (__)
"

echo 'Instalation script'

USUARIO=${SUDO_USER:-$(whoami)}
HOMEDIR=/home/$USUARIO
if [ $EUID -eq 0 ]; then
    HOMEDIR=/root
fi
echo $HOMEDIR
echo "Running as $USUARIO"

read -p "¿Install Terminal Asistant? (S/N)" response
response=${response:-"s"}
response=$(echo "$respuesta" | tr '[:upper:]' '[:lower:]')
DIR=$HOMEDIR/.local/ai-assistant
SYMLINK=$HOMEDIR/.local/bin/ai
if [ "$response" == "n" ];then
    exit 0
fi

echo "Creating $DIR"
mkdir -p $DIR

echo "Installing in $DIR"
cp -r . $DIR

chmod +x $DIR/ai.sh
echo "SYMBOLIC LINK TO $SYMLINK"

ln -s $DIR/ai.sh $SYMLINK
echo 'Installing dependencies'

python3 -m venv $DIR/venv

echo "source $DIR/venv/bin/activate" > $DIR/config
echo "pip install -r requirements.txt" >> $DIR/config
echo "deactivate" >> $DIR/config

chmod +x $DIR/config
/bin/bash $DIR/config

rm $DIR/config
echo 'Done!'
