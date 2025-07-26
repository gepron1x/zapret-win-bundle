set "FILES=%~dp0files\"
set "YT=%FILES%list-youtube.txt"
set "DISCORD=%FILES%list-discord.txt"
set "GENERAL=%FILES%list-general.txt"

start "zapret: http,https,quic" /min "%~dp0winws.exe" ^
--wf-tcp=80,443 --wf-udp=443,50000-50099 ^
--filter-tcp=80 --hostlist="%GENERAL%" --dpi-desync=fake,multisplit --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new ^
--filter-tcp=443 --hostlist="%YT%" --hostlist="%GENERAL%" --hostlist="%DISCORD%" --dpi-desync=fake,multisplit --dpi-desync-repeats=6 --dpi-desync-fooling=md5sig --dpi-desync-fake-tls-mod=rnd,dupsid,sni=www.google.com --new ^
--filter-udp=443 --hostlist="%YT%" --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fake-quic=\"%~dp0files\quic_initial_www_google_com.bin\" --new ^
--filter-udp=50000-50099 --filter-l7=discord,stun --dpi-desync=fake
