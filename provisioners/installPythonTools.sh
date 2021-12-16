HOME="/home/vagrant"
USR_APP_FOLDER_PATH="/usr/app"
PYTHON_HOME_PATH="$USR_APP_FOLDER_PATH/python"
PYTHON_INSTALLATION_PATH="$USR_APP_FOLDER_PATH/python/python-3.9.1"
PYTHON_3_HOME_PATH="$PYTHON_HOME_PATH/Python-3.9.1"

# installation of packages
installation_of_packages(){
	sudo apt-get update
	sudo apt-get install -y python3-pip build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev curl libbz2-dev scons
}

#python folder
creation_of_python_folder(){
	if [ ! -d "$PYTHON_HOME_PATH" ]; then
		sudo mkdir $PYTHON_HOME_PATH
		sudo chown -R vagrant:vagrant $PYTHON_HOME_PATH
		echo "Created $PYTHON_HOME_PATH folder"
	else
		echo "$PYTHON_HOME_PATH folder already present"	
	fi
}

install_python_3(){

	if [ ! -d "$PYTHON_INSTALLATION_PATH" ]; then
		wget --no-verbose -P $PYTHON_HOME_PATH https://www.python.org/ftp/python/3.9.1/Python-3.9.1.tgz
		tar xzf $PYTHON_HOME_PATH/Python-3.9.1.tgz -C $PYTHON_HOME_PATH
		rm -rf $PYTHON_HOME_PATH/Python-3.9.1.tgz
		cd $PYTHON_3_HOME_PATH
		./configure --prefix=$PYTHON_INSTALLATION_PATH --enable-optimizations
		make
		make install
		rm -rf $PYTHON_3_HOME_PATH
		ln -s $PYTHON_INSTALLATION_PATH/bin/python $PYTHON_INSTALLATION_PATH/bin/python3
		echo 'export PYTHON_HOME='$PYTHON_INSTALLATION_PATH >> $HOME/.bashrc
		echo "python 3.9 extracted in $PYTHON_3_HOME_PATH"
	else
		echo "$PYTHON_3_HOME_PATH folder already present"
	fi
}

installation_of_packages
creation_of_python_folder
install_python_3