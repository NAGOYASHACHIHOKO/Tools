@echo off

rem �o�b�`�̐擪�ɋL�ڂ���
whoami /priv | find "SeDebugPrivilege" > nul
if %errorlevel% neq 0 (
 @powershell start-process %~0 -verb runas
 exit
)

set /p lastOctet=IP�A�h���X�̉�3�P�^����͂��Ă��������i��F100�j: 
set newIPAddress=192.168.0.%lastOctet%
netsh interface ip set address name="Wi-Fi" static %newIPAddress% 255.255.255.0
echo Wi-Fi��IP�A�h���X�� %newIPAddress%�A�T�u�l�b�g�}�X�N��255.255.255.0�ɕύX���܂����B
pause