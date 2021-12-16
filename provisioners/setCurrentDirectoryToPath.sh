HOME="/home/vagrant"
USR_APP_FOLDER_PATH="/usr/app"
JAVA_HOME_PATH="$USR_APP_FOLDER_PATH/java"
JAVA_HOME_JDK_17_PATH="$JAVA_HOME_PATH/jdk-17.0.1"
GRADLE_HOME_PATH="$USR_APP_FOLDER_PATH/gradle"
EXERCISM_HOME_PATH="$USR_APP_FOLDER_PATH/exercism"
PYTHON_HOME_PATH="$USR_APP_FOLDER_PATH/python"
PYTHON_HOME="$USR_APP_FOLDER_PATH/python/python-3.9.1"
MAVEN_HOME="$USR_APP_FOLDER_PATH/maven"


# Export actual directory ('.') to path
export_current_directory_to_path(){
	if grep -q "export PATH=.:" $HOME/.bashrc; then
		echo "Current directory already included in PATH environment variable"
	else
		echo 'export PATH=.:$JAVA_HOME/bin:$PYTHON_HOME/bin:$GRADLE_HOME/bin:$MAVEN_HOME/bin:$EXERCISM_HOME:$PATH' >> $HOME/.bashrc
		source $HOME/.bashrc 
		echo "Added current directory to PATH environment variable"
	fi
}

export_current_directory_to_path