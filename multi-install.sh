!/bin/bash

# Function to check if a package is installed
check_and_install() {
    PACKAGE_NAME=$1
    if dpkg -l | grep -q "$PACKAGE_NAME"; then
        echo "$PACKAGE_NAME is already installed."
    else
        echo"$PACKAGE_NAME is not installed. Installing..."
        sudo apt-get update -y
        sudo apt-get install -y "$PACKAGE_NAME"
        if [ $? -eq 0 ]; then
            echo "$PACKAGE_NAME installation completed."
        else
            echo "Failed to install $PACKAGE_NAME."
        fi
    fi
}

if [ $# -eq 0 ]; then
   echo "you have not provided the name of the name of the package. Try ./myclasswork2 <package_one> <package_Two>..."
   exit 1
fi

for package in "$@"
do
    check_and_install "$package"
done