@echo off

rem �o�b�`�̐擪�ɋL�ڂ���
whoami /priv | find "SeDebugPrivilege" > nul
if %errorlevel% neq 0 (
 @powershell start-process %~0 -verb runas
 exit
)

netsh interface ip set address "Wi-Fi" dhcp
netsh interface ip set dns "Wi-Fi" dhcp
echo Wi-Fi��IP�A�h���X��DNS�ݒ��DHCP�ɕύX���܂����B
pause