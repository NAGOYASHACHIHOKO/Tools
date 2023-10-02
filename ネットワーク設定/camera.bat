@echo off

rem バッチの先頭に記載する
whoami /priv | find "SeDebugPrivilege" > nul
if %errorlevel% neq 0 (
 @powershell start-process %~0 -verb runas
 exit
)

rem ネットワークアダプタの一覧を表示
echo 利用可能なネットワークアダプタの一覧を表示します...
netsh interface show interface

rem ユーザーにネットワークアダプタを選択させる
set /p adapterName=設定を変更するネットワークアダプタの名前を入力してください: 

rem ユーザーが選択したネットワークアダプタに固定のIPアドレスとサブネットマスクを設定
netsh interface ipv4 set address name="%adapterName%" source=static address=192.168.42.105 mask=255.255.255.0
echo %adapterName% のIPアドレスを 192.168.42.105、サブネットマスクを 255.255.255.0 に変更しました。
pause
