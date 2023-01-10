$DebugPreference = "Continue"   #配置debug输出显示

#====弹出一个输入框，返回输入框输入的文本====#
Function showInputDialog([String]$dialogTitle, [String]$dialogText){

    Add-Type -AssemblyName System.Windows.Forms
    Add-Type -AssemblyName System.Drawing

    $form = New-Object System.Windows.Forms.Form
    $form.Text = $dialogTitle
    $form.Size = New-Object System.Drawing.Size(300,200)
    $form.StartPosition = 'CenterScreen'

    $okButton = New-Object System.Windows.Forms.Button
    $okButton.Location = New-Object System.Drawing.Point(75,120)
    $okButton.Size = New-Object System.Drawing.Size(75,23)
    $okButton.Text = 'OK'
    $okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
    $form.AcceptButton = $okButton
    $form.Controls.Add($okButton)

    $cancelButton = New-Object System.Windows.Forms.Button
    $cancelButton.Location = New-Object System.Drawing.Point(150,120)
    $cancelButton.Size = New-Object System.Drawing.Size(75,23)
    $cancelButton.Text = 'Cancel'
    $cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
    $form.CancelButton = $cancelButton
    $form.Controls.Add($cancelButton)

    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(10,20)
    $label.Size = New-Object System.Drawing.Size(280,40)
    $label.Text = $dialogText
    $form.Controls.Add($label)

    $textBox = New-Object System.Windows.Forms.TextBox
    $textBox.Location = New-Object System.Drawing.Point(10,60)
    $textBox.Size = New-Object System.Drawing.Size(260,20)
    $form.Controls.Add($textBox)

    $form.Topmost = $true

    $form.Add_Shown({$textBox.Select()})
    $AGP_VERSION = $form.ShowDialog()

    if ($AGP_VERSION -eq [System.Windows.Forms.DialogResult]::OK)
    {
        $x = $textBox.Text
    }

    return $x
}


#====两行输入文本对话框====#
Function showTwoLineInputDialog([String]$dialogTitle, [String]$dialogText, [String]$line1_label_text, [String]$line2_label_text){

    Add-Type -AssemblyName System.Windows.Forms
    Add-Type -AssemblyName System.Drawing

    $form = New-Object System.Windows.Forms.Form
    $form.Text = $dialogTitle
    $form.Size = New-Object System.Drawing.Size(400,200)
    $form.StartPosition = 'CenterScreen'

    $okButton = New-Object System.Windows.Forms.Button
    $okButton.Location = New-Object System.Drawing.Point(75,120)
    $okButton.Size = New-Object System.Drawing.Size(75,23)
    $okButton.Text = 'OK'
    $okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
    $form.AcceptButton = $okButton
    $form.Controls.Add($okButton)

    $cancelButton = New-Object System.Windows.Forms.Button
    $cancelButton.Location = New-Object System.Drawing.Point(150,120)
    $cancelButton.Size = New-Object System.Drawing.Size(75,23)
    $cancelButton.Text = 'Cancel'
    $cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
    $form.CancelButton = $cancelButton
    $form.Controls.Add($cancelButton)

    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(10,20)
    $label.Size = New-Object System.Drawing.Size(280,40)
    $label.Text = $dialogText
    $form.Controls.Add($label)

    $line1_label = New-Object System.Windows.Forms.Label
    $line1_label.Location = New-Object System.Drawing.Point(10,60)
    $line1_label.Size = New-Object System.Drawing.Size(60,20)
    $line1_label.Text = $line1_label_text
    $form.Controls.Add($line1_label)

    $textBox = New-Object System.Windows.Forms.TextBox
    $textBox.Location = New-Object System.Drawing.Point(70,60)
    $textBox.Size = New-Object System.Drawing.Size(260,40)
    $form.Controls.Add($textBox)

    $line2_label = New-Object System.Windows.Forms.Label
    $line2_label.Location = New-Object System.Drawing.Point(10,90)
    $line2_label.Size = New-Object System.Drawing.Size(60,20)
    $line2_label.Text = $line2_label_text
    $form.Controls.Add($line2_label)

    $textBox2 = New-Object System.Windows.Forms.TextBox
    $textBox2.Location = New-Object System.Drawing.Point(70,90)
    $textBox2.Size = New-Object System.Drawing.Size(260,40)
    $form.Controls.Add($textBox2)

    $form.Topmost = $true

    $form.Add_Shown({$textBox.Select()})
    $form.Add_Shown({$textBox2.Select()})
    $AGP_VERSION = $form.ShowDialog()

    if ($AGP_VERSION -eq [System.Windows.Forms.DialogResult]::OK)
    {
        $textbox1_s = $textBox.Text
        $textbox2_s = $textBox2.Text
    }

    return $textbox1_s, $textbox2_s
}

#====弹出一个简单的列表项选择框，返回选中并确定的列表项====#
Function showSelectDialog([String]$dialogTitle,[String]$dialogText, [string[]]$items){
    Add-Type -AssemblyName System.Windows.Forms
    Add-Type -AssemblyName System.Drawing

    $form = New-Object System.Windows.Forms.Form
    $form.Text = $dialogTitle
    $form.Size = New-Object System.Drawing.Size(300,200)
    $form.StartPosition = 'CenterScreen'

    $okButton = New-Object System.Windows.Forms.Button
    $okButton.Location = New-Object System.Drawing.Point(75,120)
    $okButton.Size = New-Object System.Drawing.Size(75,23)
    $okButton.Text = 'OK'
    $okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
    $form.AcceptButton = $okButton
    $form.Controls.Add($okButton)

    $cancelButton = New-Object System.Windows.Forms.Button
    $cancelButton.Location = New-Object System.Drawing.Point(150,120)
    $cancelButton.Size = New-Object System.Drawing.Size(75,23)
    $cancelButton.Text = 'Cancel'
    $cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
    $form.CancelButton = $cancelButton
    $form.Controls.Add($cancelButton)

    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(10,20)
    $label.Size = New-Object System.Drawing.Size(280,20)
    $label.Text = $dialogText
    $form.Controls.Add($label)

    $listBox = New-Object System.Windows.Forms.ListBox
    $listBox.Location = New-Object System.Drawing.Point(10,40)
    $listBox.Size = New-Object System.Drawing.Size(260,20)
    $listBox.Height = 80

    foreach ($str in $items){
        [void] $listBox.Items.Add($str)
    }

    $form.Controls.Add($listBox)

    $form.Topmost = $true

    $AGP_VERSION = $form.ShowDialog()

    if ($AGP_VERSION -eq [System.Windows.Forms.DialogResult]::OK)
    {
        $x = $listBox.SelectedItem
    }

    return $x
}

#多选列表
Function showMultiSelectDialog([String]$dialogTitle,[String]$dialogText, [string[]]$items){
    Add-Type -AssemblyName System.Windows.Forms
    Add-Type -AssemblyName System.Drawing

    $form = New-Object System.Windows.Forms.Form
    $form.Text = $dialogTitle
    $form.Size = New-Object System.Drawing.Size(300,200)
    $form.StartPosition = 'CenterScreen'

    $OKButton = New-Object System.Windows.Forms.Button
    $OKButton.Location = New-Object System.Drawing.Point(75,120)
    $OKButton.Size = New-Object System.Drawing.Size(75,23)
    $OKButton.Text = 'OK'
    $OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
    $form.AcceptButton = $OKButton
    $form.Controls.Add($OKButton)

    $CancelButton = New-Object System.Windows.Forms.Button
    $CancelButton.Location = New-Object System.Drawing.Point(150,120)
    $CancelButton.Size = New-Object System.Drawing.Size(75,23)
    $CancelButton.Text = 'Cancel'
    $CancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
    $form.CancelButton = $CancelButton
    $form.Controls.Add($CancelButton)

    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(10,10)
    $label.Size = New-Object System.Drawing.Size(280,20)
    $label.Text = $dialogText
    $form.Controls.Add($label)

    $listBox = New-Object System.Windows.Forms.Listbox
    $listBox.Location = New-Object System.Drawing.Point(10,30)
    $listBox.Size = New-Object System.Drawing.Size(260,20)

    $listBox.SelectionMode = 'MultiExtended'
  

    foreach ($str in $items){
        [void] $listBox.Items.Add($str)
    }

    $listBox.Height = 70
    $form.Controls.Add($listBox)
    $form.Topmost = $true

    $result = $form.ShowDialog()

    if ($result -eq [System.Windows.Forms.DialogResult]::OK)
    {
        $x = $listBox.SelectedItems
        $x
    }
}


[bool]$isDownloaded=$False
 
#==============================下载函数===========================#
Function Download([String]$url, [String]$fullFileName)
{
    if([String]::IsNullOrEmpty($url) -or [String]::IsNullOrEmpty($fullFileName))
    {
        return $False;
    }
    try
    {
        $client = New-Object System.Net.WebClient 
        $client.UseDefaultCredentials = $True
 
        #监视WebClient 的下载完成事件 
         Register-ObjectEvent -InputObject $client -EventName DownloadFileCompleted `
        -SourceIdentifier Web.DownloadFileCompleted -Action {   
            #下载完成，结束下载
            $Global:isDownloaded = $True
        }
        #监视WebClient 的进度事件
        Register-ObjectEvent -InputObject $client -EventName DownloadProgressChanged `
        -SourceIdentifier Web.DownloadProgressChanged -Action {
            #将下载的进度信息记录到全局的Data对象中
            $Global:Data = $event
        }
 
        $Global:isDownloaded =$False
 
        #监视PowerShell退出事件
        Register-EngineEvent -SourceIdentifier ([System.Management.Automation.PSEngineEvent]::Exiting) -Action {
            #PowerShell 结束事件
            Get-EventSubscriber | Unregister-Event
            Get-Job | Remove-Job -Force
           }
           
         #启用定时器，设置1秒一次输出下载进度
        $timer = New-Object timers.timer
        # 1 second interval
        $timer.Interval = 1000
        #Create the event subscription
        Register-ObjectEvent -InputObject $timer -EventName Elapsed -SourceIdentifier Timer.Output -Action {
            $percent = $Global:Data.SourceArgs.ProgressPercentage
            $totalBytes = $Global:Data.SourceArgs.TotalBytesToReceive
            $receivedBytes = $Global:Data.SourceArgs.BytesReceived
           
            If ($percent -ne 100) {
                 #这里你可以选择将进度显示到命令行 也可以选择将进度写到文件，具体看自己需求
                 #我这里选择将进度输出到命令行
                    Write-Host "当前下载进度:$percent  已下载:$receivedBytes 总大小:$totalBytes"
                    
            }
           
        }
        $timer.Enabled = $True
 
        #使用异步方式下载文件
         $client.DownloadFileAsync($url, $fullFileName)
          While (-Not $isDownloaded)
           {
                #等待下载线程结束
                Start-Sleep -m 100
           }
 
         $timer.Enabled = $False
         
        #清除监视
        Get-EventSubscriber | Unregister-Event
        Get-Job | Remove-Job -Force
        #关闭下载线程
        $client.Dispose()
        Remove-Variable client
      
         Write-Host "Finish "
    }
    catch
    {
       
        return $False;  
    }
    return $true;
}
 
#==============================业务代码执行区=========================#

$project_android_git = showInputDialog "输入项目git仓库地址" "Please Input your android project's remote git repository url: "
Write-Output "输出:  你输入的打包git仓库地址是: $project_android_git"

 if([Uri]::IsWellFormedUriString($project_android_git, 'Absolute')){
   
}else{
    Write-Error "你输入的git仓库地址语法错误，请重新输入"

    $ws = New-Object -ComObject WScript.Shell  
    $wsr = $ws.popup("你没有输入正确的git地址,请重新输入",0,"提示",0)
    return;
}

$project_android_git_branch = showInputDialog "输入打包分支名" "请输入您要进行打包的分支名，注意大小写 "
Write-Output "输出:  你输入的打包分支是: $project_android_git_branch"


#后续会判断打包分支是否存在，若存在，那么就不弹出分支选择对话框了，否则会弹出
if([String]::IsNullOrEmpty( $project_android_git_branch )){
    #如果分支输入为空或直接取消对话框
    Write-Debug "你没有输入分支.在后续会弹出对话框让你选择分支打包..."
    $ws = New-Object -ComObject WScript.Shell  
    $wsr = $ws.popup("你没有输入要打包的git分支,后续会弹出对话框让你选择分支打包",0,"提示",0)
}else{
    #输入了分支，后续需要判断
    Write-Debug "你选择打包分支$project_android_git_branch，后续会判断你输入的分支是否存在，若不存在，会弹出对话框，让你选择；若存在，将会直接开始打包..."
    $ws = New-Object -ComObject WScript.Shell  
    $wsr = $ws.popup("你输入了打包分支，若分支存在，后续将直接打包该分支",0,"提示",0)
}

#获取仓库地址对应的user_info，如果有,
$uri_project_git = [System.Uri]::new($project_android_git)
$user_info_str = $uri_project_git.UserInfo;

if([String]::IsNullOrEmpty($user_info_str)){
   #如果用户名为空，说明git仓库没有用户信息，此时需要弹出git用户名和密码输入
   $user_name_pwd = showTwoLineInputDialog -dialogTitle:"git用户鉴权" -dialogText:"请输入git仓库的用户名和密码" -line1_label_text:"Username:" -line2_label_text:"Password:";     
   if($user_name_pwd){
        Write-debug "对话框确定后的用户信息是: $user_name_pwd"
        #如果用户名和密码输入不为空，那么获取用户名和密码
       $git_name = $user_name_pwd[0];
       $git_pwd = $user_name_pwd[1];
       $name_info_str = $git_name.replace("@","%40");
       $pwd_info_str = $git_pwd.replace("@","%40");

       $user_info_str = $name_info_str + ":" + $pwd_info_str;

       Write-Debug "你输入的用户名和密码，拼接到url的是: $user_info_str "
   }else{
        Write-Debug "你没有输入用户名和密码,后续可能无法执行git操作"   
   }
}else{
   Write-Debug "你输入的git仓库地址中已带有用户信息: $user_info_str ，可以直接进行git操作"    
}

Write-Output "输出:  你输入的用户信息是: $user_info_str "


#选择打包类型，默认打aar,
$package_types = "aab","apk"
$selected_package_types = showMultiSelectDialog -dialogTitle:"选择打包类型" -dialogText:"请选择打包aab或apk，默认打aab" -items:$package_types
if($selected_package_types) {
    Write-Debug "你选择的打包类型是: $selected_package_types"
}else{
    $selected_package_types += "aab";
}

Write-Output "输出:  您选择的打包类型是: $selected_package_types "


$Is64BitOS = [Environment]::Is64BitOperatingSystem


#下载 minGit 地址 
If($Is64BitOS -eq $true) {   
    $min_git_win_url="https://registry.npmmirror.com/-/binary/git-for-windows/v2.38.1.windows.1/MinGit-2.38.1-64-bit.zip"
}else{
    $min_git_win_url="https://registry.npmmirror.com/-/binary/git-for-windows/v2.38.1.windows.1/MinGit-2.38.1-32-bit.zip"
}


#下载 openjdk8 地址
If($Is64BitOS -eq $true) { 
    $open_win_jdk8_url="https://cdn.azul.com/zulu/bin/zulu8.66.0.15-ca-jdk8.0.352-win_x64.zip";
}else{
    $open_win_jdk8_url="https://cdn.azul.com/zulu/bin/zulu8.66.0.15-ca-jdk8.0.352-win_i686.zip";
}

#下载 open_jdk11 地址
If($Is64BitOS -eq $true) { 
    $open_win_jdk11_url="https://cdn.azul.com/zulu/bin/zulu11.60.19-ca-jdk11.0.17-win_x64.zip";
}else{
    $open_win_jdk11_url="https://cdn.azul.com/zulu/bin/zulu11.60.19-ca-jdk11.0.17-win_i686.zip";
}

              
#下载android sdk地址，common-cmdline-tools
$android_sdk_url="https://dl.google.com/android/repository/commandlinetools-win-8512546_latest.zip"


$script_dir = Split-Path -Parent $MyInvocation.MyCommand.Definition # 获取脚本执行目录
$zip_download_dir=Join-Path $script_dir "AndroidPkgInstall";
Write-Output "输出:  打包需要的软件安装包下载目录是: $zip_download_dir"

$open_jdk_save_path=Join-Path $zip_download_dir "jdk.zip";
$min_git_save_path=Join-Path $zip_download_dir "mingit_2.38.1.zip";
$android_sdk_save_path=Join-Path $zip_download_dir "android_sdk.zip";

$TRUE_FALSE=(Test-Path $zip_download_dir)
if($TRUE_FALSE -eq $False){     #目录不存在，先创建目录
    mkdir $zip_download_dir
}


$expand_zip_home=Join-Path $zip_download_dir "zip_home";
$expand_mingit_zip_home=Join-Path $expand_zip_home "minGit";
if(Test-Path $expand_mingit_zip_home){
    #若git目录已存在，则不下载
    Write-Debug "Git目录已存在，不需要重复下载"
}else{
    Write-Debug "先下载git,jdk受项目影响需要下不同版本，后续再开启下载..."

    $start_time=Get-Date
    Write-Debug "开始下载mingit,开始时间: $start_time"
    Download $min_git_win_url $min_git_save_path

    if($?){
        Write-Output "输出:  下载minGit成功，准备解压Mingit压缩包..."
        $finish_time=Get-Date
        Write-Debug "结束下载mingit,结束时间: $finish_time"
    }else{
        Write-Error "下载minGit失败，脚本退出"
        return;
    }


    #开始解压mingit
    Expand-Archive -Path $min_git_save_path -DestinationPath $expand_mingit_zip_home -Force
    if($?){
        Write-Output "输出:  解压minGit压缩包成功，准备配置git环境变量..."
    }else{
        Write-Error "解压minGit压缩包失败，脚本退出"
        return;
    }

    Write-Debug "git解压完毕，开始配置环境变量..."
}

#配置git的环境变量
$PATH_GIT_EXECUTABLE = [io.path]::combine($expand_mingit_zip_home ,"cmd"); # git executable

#将git和android sdk的可执行路径 增加到path环境变量
if($Env:Path.contains($PATH_GIT_EXECUTABLE)){
    Write-Output "your env path contains git executable, remove first, then add git executable to env_path at beginning"
    $Env:Path = $Env:Path.Replace($PATH_GIT_EXECUTABLE+";", '');
}

$Env:Path=$PATH_GIT_EXECUTABLE +";" +  $Env:Path


Write-Debug "当前环境变量path是: $Env:Path"

#列出git仓库的所有分支，交互式窗口提示用户选择一个分支进行打包
#https://stackoverflow.com/questions/54372601/running-git-clone-from-powershell-giving-errors-even-when-it-seems-to-work
#https://stackoverflow.com/questions/34820975/git-clone-redirect-stderr-to-stdout-but-keep-errors-being-written-to-stderr/47232450#47232450
$env:GIT_REDIRECT_STDERR = '2>&1'   #解决git执行成功，但是控制台报错的问题

#列出git repository的全部远端分支
Set-Location $PATH_GIT_EXECUTABLE
$project_android_git_withuserinfo = $uri_project_git.Scheme + "://" + $user_info_str + "@" +  $uri_project_git.Host + ":" +   $uri_project_git.Port + $uri_project_git.PathAndQuery + $uri_project_git.Fragment;
Write-Output "输出:  带用户信息的git仓库地址为: $project_android_git_withuserinfo" 
$ls_remote_git_return = (git ls-remote -h $project_android_git_withuserinfo);
$remote_branch_array =  ($ls_remote_git_return )  2>&1 | ForEach-Object ToString
Write-Debug "测试,git ls-remote命令返回: $remote_branch_array"
$remote_branch_names = @()   #远端分支名，有前缀"refs/heads/"
foreach ($line in $remote_branch_array){
    $branch_name_versions = -split $line;
    $branch_name= $branch_name_versions[1]
    $remote_branch_names += $branch_name
}

Write-Output "输出:  你指定的仓库有这些分支: $remote_branch_names"

$remote_branch_prefix = 'refs/heads/';
if($remote_branch_names  -ccontains ($remote_branch_prefix + $project_android_git_branch)){
    Write-Output "输出:  精确匹配到你输入的分支: $project_android_git_branch，准备克隆分支"
    $selected_branch_name = $project_android_git_branch;
}else{
    $selected_branch = showSelectDialog -dialogTitle:"选择分支" -dialogText:"请选择一个远程分支进行下载" -items:$remote_branch_names
    if([String]::IsNullOrEmpty($selected_branch)){
        Write-Error "您没有选择任何分支，脚本退出"
        return    
    }else{
        $selected_branch_name = $selected_branch.Substring($selected_branch.IndexOf($remote_branch_prefix) + $remote_branch_prefix.Length);
        Write-Output "输出:  您选择了分支: $selected_branch_name，准备克隆分支"
    }
}

#git clone 待打包项目，如果已存在项目目录，先进行删除
$android_project_dir=Join-Path $script_dir $selected_branch_name
if(Test-Path $android_project_dir){
    Remove-Item -Path $android_project_dir -Recurse -force
}

if($?){
    git clone -b $selected_branch_name $project_android_git_withuserinfo $android_project_dir
}else{
    Write-Error "无法删除旧项目目录，脚本退出"
    return
}

if($?){
    Write-Output "输出:  克隆git分支: $selected_branch_name 命令执行成功"
}else{
    Write-Error "克隆git分支: $selected_branch_name 命令执行失败,脚本退出"
    return;
}

$TRUE_FALSE_PROJECT_DIR=(Test-Path $android_project_dir )
if($TRUE_FALSE_PROJECT_DIR -eq $False){
    Write-Error "克隆的git项目目录不存在，脚本退出"
    return;
}

$project_build_file = Join-Path $android_project_dir "build.gradle"
$TRUE_FALSE_PROJECT_BUILD_FILE =(Test-Path $project_build_file )
if($TRUE_FALSE_PROJECT_BUILD_FILE -eq $False){
    Write-Error "项目根目录下不存在build.gradle,无法编译，脚本退出"
    return;
}


#
#获取所有工程子目录的文件名
$sub_folders_names = (Get-ChildItem -Directory -Path $android_project_dir)  2>&1 | ForEach-Object ToString

$wait_install_components = @()
$wait_install_components += "platform-tools";

Write-Debug "正在遍历工程目录下的子模块";
foreach ($sub_folder_name in $sub_folders_names){
    $sub_module_buildfile_path = [io.path]::combine( $android_project_dir,  $sub_folder_name, "build.gradle");
    Write-Debug "子模块build.gradle路径: $sub_module_buildfile_path"

    $module_build_exist = Test-Path ($sub_module_buildfile_path);
    if($module_build_exist){
         Write-Debug "当前子模块: $sub_folder_name 的buildfile存在,路径是$sub_module_buildfile_path "
    }else{
         Write-Debug "当前子模块: $sub_folder_name 的buildfile不存在，处理下一个子模块"
         continue;
    }

    #获取子模块下所有build.gradle中的buildToolsVersion和compileSdkVersion版本号
    #1、获取compile sdk version
    $complileSdkVersionEntry = 'compileSdkVersion\s*\d+';  #匹配如: compileSdkVersion 29
    $module_compilesdk_version_line =  Select-String -path $sub_module_buildfile_path -Pattern  $complileSdkVersionEntry -AllMatches | ForEach-Object { $_.Matches } | ForEach-Object { $_.Value }
    if([String]::IsNullOrEmpty($module_compilesdk_version_line)){        
        Write-Error "没有获取到模块: $sub_folder_name 的 compile sdk version，脚本退出"
        return; 
    }else{ 
        $complileSdkVersion_split= -split $module_compilesdk_version_line
        $complileSdkVersion = $complileSdkVersion_split[1]
        Write-Output "输出:  模块: $sub_folder_name 的 compileSDK版本号是: $complileSdkVersion"

        $sdk_compile_component="platforms;android-" + $complileSdkVersion;
        $wait_install_components += $sdk_compile_component;
    }

    #2、获取buildtools version
    $buildToolsVersionEntry = "buildToolsVersion\s*""\d+.\d+.\d+""";   #匹配如: buildToolsVersion 29.0.2
    $module_buildtools_version_line =  Select-String -path $sub_module_buildfile_path -Pattern  $buildToolsVersionEntry -AllMatches | ForEach-Object { $_.Matches } | ForEach-Object { $_.Value }
    if([String]::IsNullOrEmpty($module_buildtools_version_line)){        
        Write-Debug "没有获取到模块: $sub_folder_name 的buildToolsVersion，不需要下载build tools"
    }else{
        $build_tools_split= -split $module_buildtools_version_line
        $buildToolsVersion = $build_tools_split[1].replace("""","") 
        Write-Debug "模块: $sub_folder_name 的 buildTools版本号是: $buildToolsVersion"

        $build_tools_version_component="build-tools;" + $buildToolsVersion;
        $wait_install_components += $build_tools_version_component;
    }
}

$wait_install_components +="--licenses";

#获取项目根目录build.gradle文件内容，判断是要下载jdk8还是11
Write-Debug "工程根目录下build.gradle路径是：$project_build_file "
$AGPToolsVersionEntry = 'com.android.tools.build:gradle:\s*\d+.\d+.\d+'; #匹配如:  com.android.tools.build:gradle:3.2.0
$AGPToolsVersionLine = Select-String -path $project_build_file  -Pattern $AGPToolsVersionEntry -AllMatches | ForEach-Object { $_.Matches } | ForEach-Object { $_.Value }

if([String]::IsNullOrEmpty($AGPToolsVersionLine)){
    Write-Error "在项目根目录下的build.gradle文件中，没有找到AGPToolsVersion行，无法进行编译打包，脚本退出"
    return;
}else{
    Write-Debug "搜索到的AGPTools 行内容是: $AGPToolsVersionLine"
}

$AGPVersion_startIndex = $AGPToolsVersionLine.LastIndexOf(":")+1;
$AGP_VERSION = $AGPToolsVersionLine.Substring($AGPVersion_startIndex) -replace '\s+', ''
# $AGP_VERSION='7.0.2'

Write-Output "输出:  工程根目录build.gradle文件中AGP版本:$AGP_VERSION"

Write-Output "输出:  待安装的sdk组件是: $wait_install_components"

$IntAGPVer = [int]$AGP_VERSION.replace(".","")
Write-Debug "AGP版本整数为: $IntAGPVer"
$is_jdk_11_need = $False
if($IntAGPVer -gt 700){     #android 开发官网指引，AGP大于7.0时，需要jdk11兼容
    Write-Debug "AGP版本大于7.0.0,需要配合jdk 11,后续需要下载JDK11"
    $is_jdk_11_need = $True
}else{
    Write-Debug "AGP版本小于7.0.0,配合jdk-8即可,后续需要下载JDK8"
    $is_jdk_11_need = $False
}   


If($Is64BitOS -eq $true) { 
    $JDK_8_HOME = Join-Path $expand_zip_home "zulu8.66.0.15-ca-jdk8.0.352-win_x64";   #jdk home 8
}else{
    $JDK_8_HOME = Join-Path $expand_zip_home "zulu8.66.0.15-ca-jdk8.0.352-win_i686";   #jdk home 8
}
If($Is64BitOS -eq $true) { 
    $JDK_11_HOME = Join-Path $expand_zip_home "zulu11.60.19-ca-jdk11.0.17-win_x64";   #jdk home 11
}else{
    $JDK_11_HOME = Join-Path $expand_zip_home "zulu11.60.19-ca-jdk11.0.17-win_i686";   #jdk home 11
}

if($is_jdk_11_need){
    $JDK_HOME= $JDK_11_HOME;
}else{
    $JDK_HOME= $JDK_8_HOME;
}

# 开始进行项目需要JDK的下载
if(Test-Path $JDK_HOME){ 
    #若jdkhome存在，则不需要再次下载
    Write-Debug "输出:  jdk home 目录: $JDK_HOME 存在，无需再次下载，可直接使用..."
}else{
    if($is_jdk_11_need){
        $start_time = Get-Date
        Write-Output "输出:  开始下载jdk,开始时间:$start_time"
        Write-Output "输出:  需要jdk11,正在从openjdk 11地址下载"
        Download $open_win_jdk11_url $open_jdk_save_path
    }else{
        $start_time = Get-Date
        Write-Output "输出:  开始下载jdk,开始时间:$start_time"
        Write-Output "输出:  需要jdk8,正在从openjdk 8地址下载"
         Download $open_win_jdk8_url $open_jdk_save_path
    }


    if($?){
        $finish_time=Get-Date
        Write-Output "输出:  结束下载jdk, 结束时间:$finish_time"
    }else{
        Write-Error "下载jdk失败，脚本退出"
        return
    }

    #jdk下载完毕，准备解压jdk zip,使用强制覆盖命令
    Write-Output "输出:  下载jdk完成，准备进行解压..."
    Expand-Archive -Path $open_jdk_save_path -DestinationPath $expand_zip_home -Force

    if($?){
        Write-Output "输出:  JDK解压完成，解压后的jdk根目录是: $JDK_HOME"
    }else{
        Write-Error "解压jdk压缩包失败，脚本退出"
        return;
    }
}

$Env:JAVA_HOME=$JDK_HOME
$JAVA_HOME_BIN_PATH=Join-Path $JDK_HOME "bin"
if($Env:Path.contains($JAVA_HOME_BIN_PATH)){
    Write-Output "your env path contains java home bin, remove first ,then add java home bin to env_path at beginning"
    $Env:Path = $Env:Path.Replace($JAVA_HOME_BIN_PATH+";",'')
}

$Env:Path= $JAVA_HOME_BIN_PATH + ";" +  $Env:Path


Write-Debug "配置Java环境变量后，当前Path环境变量: $Env:Path ,当前JAVA_HOME环境变量: $Env:JAVA_HOME"

$expand_android_sdk_zip_home=Join-Path $expand_zip_home "AndroidSdk";
if(Test-Path $expand_android_sdk_zip_home){
    Write-Debug "输出:  android sdk目录: $expand_android_sdk_zip_home 存在，无需再次下载，可直接使用..."
}else{
    Write-Debug "开始下载android sdk,开始时间: $start_time"
    Download $android_sdk_url $android_sdk_save_path

    if($?){
        $finish_time=Get-Date
        Write-Debug "结束下载android sdk,结束时间: $finish_time"
    }else{
        Write-Error "下载android sdk错误，脚本退出"
        return
    }

    Write-Output "输出:  android sdk 下载完毕，准备解压..."
    Expand-Archive -Path $android_sdk_save_path -DestinationPath $expand_android_sdk_zip_home -Force

    if($?){
        Write-Output "输出:  SDK压缩包解压成功，解压路径是: $expand_android_sdk_zip_home"
    }else{
        Write-Error "解压android sdk 压缩包错误，脚本退出"
        return
    }
}

$ANDROID_SDK_EXECUTABLE = [io.path]::combine($expand_android_sdk_zip_home, "cmdline-tools", "bin"); # android sdk executable path
if($Env:Path.contains($ANDROID_SDK_EXECUTABLE)){
    Write-Debug "Android SDK可执行文件已配置到PATH环境变量，首先删除，然后将它添加到起始位置"
    $Env:Path = $Env:Path.Replace($ANDROID_SDK_EXECUTABLE+";", '')
}
$Env:Path=$ANDROID_SDK_EXECUTABLE + ";" +  $Env:Path

Write-Debug "配置Android SDK环境变量后，当前Path环境变量:$Env:Path"

Write-Output "输出:  Android SDK环境变量配置成功，准备通过命令行安装Android SDK组件..."

Set-Location $ANDROID_SDK_EXECUTABLE
foreach ($component in $wait_install_components){
    Write-Debug "正在安装Android SDK组件: $component"
    Write-Output y | sdkmanager.bat --no_https --sdk_root=$expand_android_sdk_zip_home $component

    if($?){
        Write-Debug "安装Android SDK组件: $component 成功"
    }else{
        Write-Debug "安装Android SDK组件: $component 失败"
    }
}

if($?){
    Write-Output "输出:  安装全部Android SDK组件成功,准备执行gradle打包任务..."
}else{
    Write-Error "安装部分Android SDK组件时发生了错误，脚本退出"
    return;
}

#1\切换到项目根目录
#2\创建local.properties文件，文件中指定sdk路径
#3\执行gradlew assembleRelease或bundleRelease任务，前面已指定临时变量java_home

Set-Location $android_project_dir
$write_local_properties_content = "sdk.dir=$expand_android_sdk_zip_home" -replace "\\", "\\"    #如果是windows, 则必须将反斜杠\替换成\\
Set-Content -Path .\local.properties -Value $write_local_properties_content    #将sdk路径写进local.properties，格式  sdk.dir=c:\\dirname1\\dirname2

$package_start_time = Get-Date
foreach ($pkg_type in $selected_package_types){
    if($pkg_type -eq "aab"){
        Write-Debug "正在打包aab..."
        .\gradlew.bat bundleRelease
    }elseif($pkg_type -eq "apk"){
        Write-Debug "正在打包apk..."
        .\gradlew.bat assembleRelease
    }

    Get-Process -Name 'java' | Stop-Process -Force
    if($?){
        Write-Debug "Zulu进程成功被结束"   
    }else{
        Write-Debug "Zulu进程不能被结束，错误码:$lastexitcode"
    }
}




#过滤项目目录下，最后写入时间在打包开始后，且文件大小大于1mb字节的apk或aab文件
$filter_android_pkg_files = (Get-ChildItem -Path $android_project_dir  -Recurse -Include *.apk ,*.aab | Where-Object -FilterScript {($_.LastWriteTime -gt $package_start_time) -and ($_.Length -ge 1mb)}) 2>&1 | ForEach-Object ToString
if($filter_android_pkg_files){
    Write-Output "项目: $android_project_dir 生成apk或aab成功，准备拷贝到目标目录..."
}else{
    Write-Error "项目: $android_project_dir 生成apk或aab失败"
    return;
}


$copy_dest_dir = Join-Path $script_dir 'packages' 
#如果有Packages目录，则先删除目录和下面的打包文件，重新在脚本执行目录下创建packages目录，用来存放打包生成的apk或aab
if(Test-Path $copy_dest_dir){
    Remove-Item -Path $copy_dest_dir -Recurse
}

mkdir $copy_dest_dir


Write-Debug "正在拷贝打包生成的apk或aab文件到package目录下..."
foreach ($str_file_path in $filter_android_pkg_files){
    $fileInfo = [System.IO.FileInfo]::new($str_file_path);
    
    $file_dest=Join-Path $copy_dest_dir $fileInfo.Name
    Copy-Item -Path $str_file_path -Destination  $file_dest -Force
}

if($?){
    Write-Debug "打包apk已拷贝至路径: $copy_dest_dir"
    $ws = New-Object -ComObject WScript.Shell  
    $wsr = $ws.popup("打包完毕，请到路径下:$copy_dest_dir下查看，点击确定复制路径",0,"提示",0)

    if($wsr -eq 1){   #点击了确定
        Set-Clipboard -Value $copy_dest_dir
    
        $ws = New-Object -ComObject WScript.Shell  
        $ws.popup("打包路径已复制",0,"提示",0)  
    }
}else{
    Write-Error "拷贝打包文件到目录: $copy_dest_dir 失败, 请手动拷贝到其他目录"
}

#打扫战场，清除环境变量
$Env:Path = $Env:Path.Replace($ANDROID_SDK_EXECUTABLE+";", '')
$Env:Path = $Env:Path.Replace($PATH_GIT_EXECUTABLE+";", '');

exit









