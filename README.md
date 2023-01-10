# AndroidProjectsPackage
A powershell script for packaging the android SDK project. 
The project needs to support direct access using the git username and password. The ndk project is not supported for the time being. NDK projects are not currently supported, and github projects are also not supported for the time being

The main logical steps of packaging are as follows:
1. Ask the user the address of the git project to be packaged, the git username and password, and the branch to be packaged
2. Download the git zip installation package from npmmirror, and configure the environment variables at the same time after decompression
2. Through the git information saved in the first step, execute the git clone command to download the android git project
3. Analyze the AGP file to determine whether JDK8 or JDK11 compilation is required
4. Download the JDK8 or JDK11 zip installation package from zulu, and configure the environment variables at the same time after decompression
5. Download the Android SDK zip installation package from the google developer website, and unzip it
6. In the root directory of the android project, create a local.properties file and write it into the decompressed Android SDK path
7. Scan the build.gradle file of each module under the android project, and install the compileSdk and buildTools components of the corresponding version in the build.gradle through the command line
8. Switch to the root directory of the project, execute gradlew.bat assembleRelease or gradlew.bat bundleRelease to make apk or aab package respectively
9. After packaging, copy apk or aab to the packages directory under the packaging directory
10. After the copy is completed, a dialog box will pop up to prompt that the packaging is successful. The user can copy the packages path in the dialog box, so that the subsequent quick positioning to the packaged product directory
