@echo off

rem �o�b�`�̐擪�ɋL�ڂ���
whoami /priv | find "SeDebugPrivilege" > nul
if %errorlevel% neq 0 (
 @powershell start-process %~0 -verb runas
 exit
)

rem �l�b�g���[�N�A�_�v�^�̈ꗗ��\��
echo ���p�\�ȃl�b�g���[�N�A�_�v�^�̈ꗗ��\�����܂�...
netsh interface show interface

rem ���[�U�[�Ƀl�b�g���[�N�A�_�v�^��I��������
set /p adapterName=�ݒ��ύX����l�b�g���[�N�A�_�v�^�̖��O����͂��Ă�������: 

rem ���[�U�[���I�������l�b�g���[�N�A�_�v�^�ɌŒ��IP�A�h���X�ƃT�u�l�b�g�}�X�N��ݒ�
netsh interface ipv4 set address name="%adapterName%" source=static address=192.168.42.105 mask=255.255.255.0
echo %adapterName% ��IP�A�h���X�� 192.168.42.105�A�T�u�l�b�g�}�X�N�� 255.255.255.0 �ɕύX���܂����B
pause
