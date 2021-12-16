HOME="/home/vagrant"
USR_APP_FOLDER_PATH="/usr/app"
JAVA_HOME_PATH="$USR_APP_FOLDER_PATH/java"
GRADLE_HOME_PATH="$USR_APP_FOLDER_PATH/gradle"
MAVEN_HOME_PATH="$USR_APP_FOLDER_PATH/maven"
JAVA_HOME_JDK_11_PATH="$JAVA_HOME_PATH/jdk-11"
JAVA_HOME_JDK_17_PATH="$JAVA_HOME_PATH/jdk-17.0.1"
EXERCISM_HOME_PATH="$USR_APP_FOLDER_PATH/exercism"


#java folder
creation_of_java_folder(){
	if [ ! -d "$JAVA_HOME_PATH" ]; then
		sudo mkdir $JAVA_HOME_PATH
		sudo chown -R vagrant:vagrant $JAVA_HOME_PATH
		echo "Created $JAVA_HOME_PATH folder"
	else
		echo "$JAVA_HOME_PATH folder already present"	
	fi
}

# Download java jdk-11
# DEPRECATED AND NOT DEFAULT VERSION OF JAVA (Interesting to have it)
installation_of_java_11(){
	if [ ! -d "$JAVA_HOME_JDK_11_PATH" ]; then
		wget --no-verbose -P $JAVA_HOME_PATH https://download.java.net/openjdk/jdk11/ri/openjdk-11+28_linux-x64_bin.tar.gz
		tar xzf $JAVA_HOME_PATH/openjdk-11+28_linux-x64_bin.tar.gz -C $JAVA_HOME_PATH
		rm -rf $JAVA_HOME_PATH/openjdk-11+28_linux-x64_bin.tar.gz
		#echo 'export JAVA_HOME='$JAVA_HOME_JDK_11_PATH >> $HOME/.bashrc
		echo "openjdk11 extracted in $JAVA_HOME_JDK_11_PATH"
	else
		echo "$JAVA_HOME_JDK_11_PATH folder already present"
	fi
}

# Download java jdk-17
installation_of_java_17(){
	if [ ! -d "$JAVA_HOME_JDK_17_PATH" ]; then
		wget --no-verbose -P $JAVA_HOME_PATH https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.tar.gz
		tar xzf $JAVA_HOME_PATH/jdk-17_linux-x64_bin.tar.gz -C $JAVA_HOME_PATH
		rm -rf $JAVA_HOME_PATH/jdk-17_linux-x64_bin.tar.gz
		echo 'export JAVA_HOME='$JAVA_HOME_JDK_17_PATH >> $HOME/.bashrc
		echo "openjdk17 extracted in $JAVA_HOME_JDK_17_PATH"
	else
		echo "$JAVA_HOME_JDK_17_PATH folder already present"
	fi
}

# Installation of gradle
# DEPRECATED AND NOT DEFAULT VERSION OF GRADLE (Interesting to have it)
installation_of_gradle_6_3(){
	if [ ! -d "$GRADLE_HOME_PATH" ]; then
		wget --no-verbose -P $GRADLE_HOME_PATH https://services.gradle.org/distributions/gradle-6.3-bin.zip
		unzip -q -d $GRADLE_HOME_PATH $GRADLE_HOME_PATH/gradle-6.3-bin.zip 
		rm -rf $GRADLE_HOME_PATH/gradle-6.3-bin.zip
		#echo 'export GRADLE_HOME='$GRADLE_HOME_PATH/gradle-6.3 >> $HOME/.bashrc
		echo "gradle 6.3 extracted in $GRADLE_HOME_PATH"
	else
		echo "$GRADLE_HOME_PATH folder already present"
	fi
}

# Installation of gradle
installation_of_gradle_7_3(){
	if [ ! -d "$GRADLE_HOME_PATH" ]; then
		wget --no-verbose -P $GRADLE_HOME_PATH https://services.gradle.org/distributions/gradle-7.3-bin.zip
		unzip -q -d $GRADLE_HOME_PATH $GRADLE_HOME_PATH/gradle-7.3-bin.zip 
		rm -rf $GRADLE_HOME_PATH/gradle-7.3-bin.zip
		echo 'export GRADLE_HOME='$GRADLE_HOME_PATH/gradle-7.3 >> $HOME/.bashrc
		echo "gradle 7.3 extracted in $GRADLE_HOME_PATH"
	else
		echo "$GRADLE_HOME_PATH folder already present"
	fi
}

# Download exercism
installation_of_exercism(){
	if [ ! -d "$EXERCISM_HOME_PATH" ]; then
		wget --no-verbose -P $EXERCISM_HOME_PATH https://github.com/exercism/cli/releases/download/v3.0.13/exercism-3.0.13-linux-x86_64.tar.gz
		tar xzf $EXERCISM_HOME_PATH/exercism-3.0.13-linux-x86_64.tar.gz -C $EXERCISM_HOME_PATH
		rm -rf $EXERCISM_HOME_PATH/exercism-3.0.13-linux-x86_64.tar.gz
		echo 'export EXERCISM_HOME='$EXERCISM_HOME_PATH >> $HOME/.bashrc
		echo "exercism extracted in $EXERCISM_HOME_PATH"
	else
		echo "$EXERCISM_HOME_PATH folder already present"
	fi
}

# installation of bazelisk
installation_of_bazelisk(){
	if [ `which bazel | grep "usr"` ]; then
		echo 'Bazel already installed'
	else
		sudo npm install -g @bazel/bazelisk
		echo 'Bazel installation performed<	'
	fi
}

# Download exercism
installation_of_maven(){
	if [ ! -d "$MAVEN_HOME_PATH" ]; then
		wget --no-verbose -P $MAVEN_HOME_PATH https://dlcdn.apache.org/maven/maven-3/3.8.4/binaries/apache-maven-3.8.4-bin.tar.gz
		tar xzf $MAVEN_HOME_PATH/apache-maven-3.8.4-bin.tar.gz -C $MAVEN_HOME_PATH
		rm -rf $MAVEN_HOME_PATH/apache-maven-3.8.4-bin.tar.gz
		echo 'export MAVEN_HOME='$MAVEN_HOME_PATH/apache-maven-3.8.4 >> $HOME/.bashrc
		echo "maven 3.8.4 extracted in $MAVEN_HOME_PATH"
	else
		echo "$MAVEN_HOME_PATH folder already present"
	fi
}

creation_of_java_folder
installation_of_java_11
installation_of_java_17
installation_of_gradle_7_3
installation_of_bazelisk
installation_of_exercism
installation_of_maven
