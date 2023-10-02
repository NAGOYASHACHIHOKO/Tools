@echo off

rem バッチの先頭に記載する
whoami /priv | find "SeDebugPrivilege" > nul
if %errorlevel% neq 0 (
 @powershell start-process %~0 -verb runas
 exit
)

netsh interface ip set address "Wi-Fi" dhcp
netsh interface ip set dns "Wi-Fi" dhcp
echo Wi-FiのIPアドレスとDNS設定をDHCPに変更しました。
pause