echo "BEGIN BLOCK $1">> BingoChaintemp.txt
echo "BEGIN TRANSACTION 1" >> BingoChaintemp.txt
cat "$2" >> BingoChaintemp.txt


cat -b "$3" "$4" > concatenatedPlayer"$5".bin 
openssl dgst -sha256 concatenatedPlayer"$5".bin > OpenedCommitmentPlayerOnChain.bin

echo >> "$3"
echo >> "$4"
cat "$3" >> BingoChaintemp.txt
echo "---" >> BingoChaintemp.txt
cat "$4" >> BingoChaintemp.txt
cat signatureOpening"$5".bin >> BingoChaintemp.txt
echo >> BingoChaintemp.txt
echo "END TRANSACTION 1" >> BingoChaintemp.txt

sed -n '/BEGIN BLOCK 2/,/END BLOCK 2/p' BingoChain.txt > BingoChainCommitments.txt

if grep -q -f "$2" BingoChainCommitments.txt; then
    output=0;
else
    echo "Non sei stato inserito tra i partecipanti della partita"
    rm BingoChaintemp.txt
    exit 1
fi

strings BingoChainCommitments.txt | grep "concatenatedPlayer$5" > CommitmentPublishedByPlayer.bin

perl -pi -e 'chomp if eof' signatureOpening"$5".bin
output=$(openssl dgst -verify Player"$5"publickey.pem -signature signatureOpening"$5".bin concatenatedPlayer"$5".bin)

if [ "$output" != "Verified OK" ]; then
    echo "La firma non è valida"
    exit 1
fi

if cmp -s OpenedCommitmentPlayerOnChain.bin CommitmentPublishedByPlayer.bin; then
    output=0
    echo "OK"
else
    echo "L'apertura non è valida"
    rm BingoChaintemp.txt
    exit 1
fi

echo "BEGIN END $1" >> BingoChaintemp.txt
cat BingoChaintemp.txt >> BingoChain.txt

rm concatenatedPlayer"$5".bin BingoChaintemp.txt BingoChainCommitments.txt OpenedCommitmentPlayerOnChain.bin CommitmentPublishedByPlayer.bin
