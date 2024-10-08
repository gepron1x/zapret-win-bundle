set ARGS=--wf-tcp=80,443 --wf-udp=443,50000-65535 ^
--filter-udp=443 --hostlist="%~dp0list-youtube.txt" --dpi-desync=fake --dpi-desync-repeats=10 --new ^
--filter-tcp=443 --hostlist="%~dp0list-discord.txt" --dpi-desync=disorder2 --new ^
--filter-tcp=443 --hostlist="%~dp0list-others.txt"  --dpi-desync=disorder2 --new ^
--filter-tcp=443 --hostlist="%~dp0list-youtube.txt" --dpi-desync=split --dpi-desync-fooling=badseq --new ^
--filter-udp=50000-65535 --dpi-desync=fake --dpi-desync-cutoff=d4 --dpi-desync-repeats=6 --dpi-desync-any-protocol
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
