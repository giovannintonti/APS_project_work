if cmp -s CommitmentPlayer1.bin CommitmentPlayer1DaServer.bin; then 
  output=0;
else
  echo "Il commitment ricevuto non è quello inviato"
  exit 1  
fi


output=$(openssl dgst -verify Player2publickeyDaServer.pem -signature signatureCommitment2DaServer.bin CommitmentPlayer2DaServer.bin)
echo $output
if [ "$output" != "Verified OK" ]; then
    echo "La firma del Player2 non è valida"
    exit 1
fi

output=$(openssl dgst -verify Player3publickeyDaServer.pem -signature signatureCommitment3DaServer.bin CommitmentPlayer3DaServer.bin)
if [ "$output" != "Verified OK" ]; then
    echo "La firma del Player3 non è valida"
    exit 1
fi

output=$(openssl dgst -verify Player4publickeyDaServer.pem -signature signatureCommitment4DaServer.bin CommitmentPlayer4DaServer.bin)
if [ "$output" != "Verified OK" ]; then
    echo "La firma del Player4 non è valida"
    exit 1
fi

output=$(openssl dgst -verify BancopublickeyDaServer.pem -signature signatureCommitmentBancoDaServer.bin CommitmentBancoDaServer.bin)
if [ "$output" != "Verified OK" ]; then
    echo "La firma del Banco non è valida"
    exit 1
fi

echo "Le firme sul commitment sono valide"
