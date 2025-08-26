@rem THIS BATCH FILE REQUIRES MANUAL EDIT
@rem SERVICE INSTALL IS COMMENTED TO PREVENT SCRIPT KIDDIES FROM DAMAGING THEIR SYSTEMS WITHOUT KNOWING HOW TO RECOVER
@rem ЭТОТ ФАЙЛ ТРЕБУЕТ РЕДАКТИРОВАНИЯ
@rem УСТАНОВКА СЛУЖБЫ ЗАКОММЕНТИРОВАНА, ЧТОБЫ ОГРАДИТЬ НИЧЕГО НЕ ПОНИМАЮЩИХ НАЖИМАТЕЛЕЙ НА ВСЕ ПОДРЯД ОТ ПРОБЛЕМ, КОТОРЫЕ ОНИ НЕ В СОСТОЯНИИ РЕШИТЬ
@rem ЕСЛИ НИЧЕГО НЕ ПОНИМАЕТЕ - НЕ ТРОГАЙТЕ ЭТОТ ФАЙЛ, ОТКАЖИТЕСЬ ОТ ИСПОЛЬЗОВАНИЯ СЛУЖБЫ. ИНАЧЕ БУДЕТЕ ПИСАТЬ ПОТОМ ВОПРОСЫ "У МЕНЯ ПРОПАЛ ИНТЕРНЕТ , КАК ВОССТАНОВИТЬ"

set "FILES=%~dp0files\"
set "YT=%FILES%list-youtube.txt"
set "DISCORD=%FILES%list-discord.txt"
set "GENERAL=%FILES%list-general.txt"
set ARGS=^
--wf-tcp=80,443 --wf-udp=443,50000-50099 ^
--filter-tcp=80 --hostlist="%GENERAL%" --dpi-desync=fake,multisplit --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new ^
--filter-tcp=443 --hostlist="%YT%" --hostlist="%GENERAL%" --hostlist="%DISCORD%" --dpi-desync=multidisorder --dpi-desync-split-pos=1,midsld --new ^
--filter-udp=443 --hostlist="%YT%" --dpi-desync=fake --dpi-desync-repeats=17 --dpi-desync-fake-quic=\"%~dp0files\quic_initial_www_google_com.bin\" --new ^
--filter-udp=50000-50099 --filter-l7=discord,stun --dpi-desync=fake
call :srvinst winws1
rem set ARGS=--wf-l3=ipv4,ipv6 --wf-udp=443 --dpi-desync=fake 
rem call :srvinst winws2
goto :eof

:srvinst
net stop %1
sc delete %1
sc create %1 binPath= "\"%~dp0winws.exe\" %ARGS%" DisplayName= "zapret DPI bypass : %1" start= auto
sc description %1 "zapret DPI bypass software"
sc start %1
pause