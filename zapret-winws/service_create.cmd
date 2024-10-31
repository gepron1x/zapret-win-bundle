set ARGS=--wf-raw="@%~dp0rules.txt" ^
--filter-udp=443 --dpi-desync=fake --dpi-desync-repeats=10 --dpi-desync-fake-quic="%~dp0quic_initial_www_google_com.bin" --new ^
--filter-tcp=443 --hostlist="%~dp0list-youtube.txt" --hostlist="%~dp0list-discord.txt" --hostlist="%~dp0list-others.txt" --dpi-desync=split --dpi-desync-repeats=10 --dpi-desync-fooling=badseq --dpi-desync-split-pos=1 --dpi-desync-fake-tls=0x1603030135010001310303424143facf5c983ac8ff20b819cfd634cbf5143c0005b2b8b142a6cd335012c220008969b6b387683dedb4114d466ca90be3212b2bde0c4f56261a9801 --new ^
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