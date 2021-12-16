# Constants
HOME="/home/vagrant"
NVIM_CONFIG_FILE_PATH="$HOME/.config/nvim/init.vim"
COC_CONFIG_FILE_PATH="$HOME/.config/nvim/coc-settings.json"
ULTISNIPS_FOLDER_PATH="$HOME/.config/nvim/UltiSnips"
VIM_PLUG_PATH="$HOME/.local/share/nvim/site/autoload/plug.vim"
USR_APP_FOLDER_PATH="/usr/app"

# installation of packages
installation_of_packages(){
	sudo apt-get update
	sudo apt-get -y install git curl dos2unix unzip neovim nodejs npm 
}

# neovim
installation_of_neovim(){
	# Download nvim
	if [ ! -f "$VIM_PLUG_PATH" ]; then
		curl -fLo $VIM_PLUG_PATH --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	else	
		echo "$VIM_PLUG_PATH file already present"
	fi
	
	#set configuration file
	if [ ! -f "$NVIM_CONFIG_FILE_PATH" ]; then
		mkdir $HOME/.config
		mkdir $HOME/.config/nvim
		cp $HOME/conf/init.vim $NVIM_CONFIG_FILE_PATH
		cp $HOME/conf/coc-settings.json $NVIM_CONFIG_FILE_PATH
		cp -rf $HOME/conf/UltiSnips $ULTISNIPS_FOLDER_PATH
		dos2unix $NVIM_CONFIG_FILE_PATH
		dos2unix $COC_CONFIG_FILE_PATH
		echo "Neovim configuration file (init.vim) installed"
	else
		echo "configuration file (init.vim) already exists"
	fi
}

# application folder
creation_of_application_folder(){
	if [ ! -d "$USR_APP_FOLDER_PATH" ]; then
		sudo mkdir $USR_APP_FOLDER_PATH
		sudo chown -R vagrant:vagrant $USR_APP_FOLDER_PATH  
		echo "Created $USR_APP_FOLDER_PATH folder"
	else
		echo "$USR_APP_FOLDER_PATH folder already present"
	fi
}

installation_of_packages
installation_of_neovim
creation_of_application_folder

