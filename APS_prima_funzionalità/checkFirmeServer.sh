cat -b ContributoPlayer1OnServer.bin RandomnessPlayer1OnServer.bin > concatenatedPlayer1OnServer.bin

output=$(openssl dgst -verify Player1publickey.pem -signature signatureOpening1OnServer.bin concatenatedPlayer1OnServer.bin)

if [ "$output" != "Verified OK" ]; then
    echo "La firma del Player1 non è valida"
    exit 1
fi


cat -b ContributoPlayer2OnServer.bin RandomnessPlayer2OnServer.bin > concatenatedPlayer2OnServer.bin

output=$(openssl dgst -verify Player2publickey.pem -signature signatureOpening2OnServer.bin concatenatedPlayer2OnServer.bin)

if [ "$output" != "Verified OK" ]; then
    echo "La firma del Player2 non è valida"
    exit 1
fi


cat -b ContributoPlayer3OnServer.bin RandomnessPlayer3OnServer.bin > concatenatedPlayer3OnServer.bin

output=$(openssl dgst -verify Player3publickey.pem -signature signatureOpening3OnServer.bin concatenatedPlayer3OnServer.bin)

if [ "$output" != "Verified OK" ]; then
    echo "La firma del Player3 non è valida"
    exit 1
fi




cat -b ContributoPlayer4OnServer.bin RandomnessPlayer4OnServer.bin > concatenatedPlayer4OnServer.bin

output=$(openssl dgst -verify Player4publickey.pem -signature signatureOpening4OnServer.bin concatenatedPlayer4OnServer.bin)

if [ "$output" != "Verified OK" ]; then
    echo "La firma del Player4 non è valida"
    exit 1
fi


echo " Le firme sulle aperture sono valide "
