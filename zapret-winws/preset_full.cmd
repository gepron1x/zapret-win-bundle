start "zapret: http,https,quic" /min "%~dp0winws.exe" ^
--wf-raw="@%~dp0rules.txt" ^
--filter-udp=443 --hostlist="%~dp0list-youtube.txt" --dpi-desync=fake --dpi-desync-repeats=10 --new ^
--filter-tcp=443 --hostlist="%~dp0list-discord.txt" --dpi-desync=disorder2 --new ^
--filter-tcp=443 --hostlist="%~dp0list-others.txt"  --dpi-desync=disorder2 --new ^
--filter-tcp=443 --hostlist="%~dp0list-youtube.txt" --dpi-desync=split --dpi-desync-fooling=badseq --new ^
--filter-udp=50000-65535 --dpi-desync=fake --dpi-desync-cutoff=d4 --dpi-desync-repeats=6 --dpi-desync-any-protocol
