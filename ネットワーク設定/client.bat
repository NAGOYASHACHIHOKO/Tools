@echo off

rem バッチの先頭に記載する
whoami /priv | find "SeDebugPrivilege" > nul
if %errorlevel% neq 0 (
 @powershell start-process %~0 -verb runas
 exit
)

set /p lastOctet=IPアドレスの下3ケタを入力してください（例：100）: 
set newIPAddress=192.168.0.%lastOctet%
netsh interface ip set address name="Wi-Fi" static %newIPAddress% 255.255.255.0
echo Wi-FiのIPアドレスを %newIPAddress%、サブネットマスクを255.255.255.0に変更しました。
pause