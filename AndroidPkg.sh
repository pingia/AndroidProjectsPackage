#!/bin/bash 
echo "Android package script prepared to run..."

echo "step 1. Checking if the Git command is installed"
#first step: check if git is installed, if not,  install git.
if command -v git >/dev/null 2>&1 ; then
  echo "Git is installed"
else
  echo "Git is not installed,prepared to install..."
  sudo apt-get install git
fi

 if [ $? -eq 0 ];then
	 echo "Git install succeed for script"

         mkdir -p android_pkg
         cd android_pkg

	 echo "step 2.checking if powershell is installed"

	 if command -v pwsh >/dev/null 2>&1 ; then
 		 echo "powershell has be installed"
	else
  		echo "powershell has not be installed,prepared to download it..."
		      #second step: download && install powershell
             # Install the downloaded package
                wget -N https://github.com/PowerShell/PowerShell/releases/download/v7.3.6/powershell_7.3.6-1.deb_amd64.deb
                sudo dpkg -i powershell_7.3.6-1.deb_amd64.deb
	fi


	if [ $? -eq 0 ];then 
		echo "step3. download powershell script from github raw..."
                 wget -N https://raw.githubusercontent.com/pingia/AndroidProjectsPackage/main/AndroidPkg.ps1

	       if [ $? -eq 0 ];then
		       echo "step4. download powershell script succeed,prepared to execute ..."
			pwsh AndroidPkg.ps1
		else
			echo -e "powershell script download failed,exit"
		
	       fi
	else
		echo -e "powershell install failed,exit"
	fi
else
	echo -e "git install failed, exit"
fi
