#!/usr/bin/env bash


# Update the list of packages
sudo apt-get update

# Install pre-requisite packages.
sudo apt-get install -y wget apt-transport-https software-properties-common


# Get the version of Ubuntu
source /etc/os-release

# Download the Microsoft repository keys
wget -q https://packages.microsoft.com/config/ubuntu/$VERSION_ID/packages-microsoft-prod.deb

# Register the Microsoft repository keys
sudo dpkg -i packages-microsoft-prod.deb

# Delete the Microsoft repository keys file
rm packages-microsoft-prod.deb

# Update the list of packages after we added packages.microsoft.com
sudo apt-get update

###################################
# Install PowerShell
sudo apt-get install -y powershell

# Start PowerShell
pwsh

# https://docs.aws.amazon.com/powershell/latest/userguide/pstools-getting-set-up-linux-mac.html
# install module for the AWS tools
Install-Module -Name AWS.Tools.Installer -A

# install require module for AWS (In our case we only need S3 at the moment)
Install-AWSToolsModule AWS.Tools.S3 -CleanUp -A

# https://docs.aws.amazon.com/powershell/latest/reference/
