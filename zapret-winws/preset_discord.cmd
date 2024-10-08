start "zapret: http,https,quic" /min "%~dp0winws.exe" ^
--wf-tcp=80,443 --wf-udp=443,50000-65535 ^
--filter-tcp=443 --hostlist="%~dp0list-discord.txt" --dpi-desync=disorder2 --new ^
--filter-tcp=443 --hostlist="%~dp0list-others.txt"  --dpi-desync=split2 --dpi-desync-split-tls=sniext --new ^
--filter-udp=50000-65535 --dpi-desync=fake --dpi-desync-cutoff=d4 --dpi-desync-repeats=6 --dpi-desync-any-protocol
