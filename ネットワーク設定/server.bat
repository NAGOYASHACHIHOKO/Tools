@echo off

rem �o�b�`�̐擪�ɋL�ڂ���
whoami /priv | find "SeDebugPrivilege" > nul
if %errorlevel% neq 0 (
 @powershell start-process %~0 -verb runas
 exit
)

netsh interface ipv4 set address name="Wi-Fi" source=static address=192.168.0.8 mask=255.255.255.0
netsh interface ipv4 add address name="Wi-Fi" address=192.168.1.2 mask=255.255.255.0
echo Wi-Fi��IP�A�h���X��ݒ肵�܂����B
pause