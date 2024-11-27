 #!/bin/bash
# Avvio del server s_server in background
cat "$1" | openssl s_server -port 8444 -key "$3" -cert "$4" -CAfile cacert.pem &
openssl s_client -connect localhost:8444 -crlf > temp.bin


s_server_pid=$!
((s_server_pid = s_server_pid -1 ))
timeout 0.3 sleep 0.3

sed -n '/Verify return code: 19 (self signed certificate in certificate chain)/,/Post-Handshake/p' temp.bin | sed '1d;$d' > temp2.bin
rm temp.bin
tail -n +2 temp2.bin > temp.bin
sed '/Post/q' temp.bin | head -n -2  > "$2"
 
