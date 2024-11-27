head -n 1 Foglia6OnServer.txt | openssl dgst -sha256 > Valore6.txt
perl -pi -e 'chomp if eof' Valore6.txt
perl -pi -e 'chomp if eof' SHA5OnServer.txt
cat SHA5OnServer.txt Valore6.txt | openssl dgst -sha256 > Valore56.txt

head -n 1 Foglia7OnServer.txt | openssl dgst -sha256 > Valore7.txt
perl -pi -e 'chomp if eof' Valore7.txt
head -n 1 Foglia8OnServer.txt | openssl dgst -sha256 > Valore8.txt
perl -pi -e 'chomp if eof' Valore8.txt
cat Valore7.txt Valore8.txt | openssl dgst -sha256 > Valore78.txt


head -n 1 Valore78.txt | openssl dgst -sha256 > Valore78_2.txt
perl -pi -e 'chomp if eof' Valore78_2.txt
head -n 1 Valore56.txt | openssl dgst -sha256 > Valore56_2.txt
perl -pi -e 'chomp if eof' Valore56_2.txt
cat Valore56_2.txt Valore78_2.txt | openssl dgst -sha256 > Valore5678.txt

head -n 1 Valore5678.txt | openssl dgst -sha256 > Valore5678_2.txt
perl -pi -e 'chomp if eof' Valore5678_2.txt
perl -pi -e 'chomp if eof' SHA1234OnServer.txt
cat SHA1234OnServer.txt Valore5678_2.txt | openssl dgst -sha256 > ValoreRadice.txt

gp="ValoreRadice.txt"  
lista="ListaRevoche.txt" 
 
if grep -qF "$gp" "$lista"; then
    echo "Il green pass è stato revocato" 
    exit 1	 
else
    output=0
fi

output=$(openssl dgst -verify aspub_key.pem -signature signatureRadiceMarioOnServer.bin ValoreRadice.txt)
if [ "$output" != "Verified OK" ]; then
    echo "La firma dell'autorità non è valida"
    exit 1
fi


perl -pi -e 'chomp if eof' r6OnServer.txt
perl -pi -e 'chomp if eof' s6OnServer.txt
cat r6OnServer.txt Info6OnServer.txt | openssl dgst -sha256  > SHA256rInfo.bin
perl -pi -e 'chomp if eof' SHA256rInfo.bin
cat SHA256rInfo.bin s6OnServer.txt | openssl dgst -sha256 > ValoreSHA.bin

head -n 1 Foglia6OnServer.txt > checkValoreSHA.bin


if cmp -s checkValoreSHA.bin ValoreSHA.bin; then
    output=0
else
    echo "L'apertura della PK non è corretta"
    exit 1
fi


perl -pi -e 'chomp if eof' Info6OnServer.txt
perl -pi -e 'chomp if eof' RandomBits.bin
output=$(openssl dgst -verify Info6OnServer.txt -signature signatureRandomBitsOnServer.bin RandomBits.bin)
if [ "$output" != "Verified OK" ]; then
    echo "La firma non corrisponde alla PK del Green Pass, non è valida"
    exit 1
fi


perl -pi -e 'chomp if eof' r7OnServer.txt
perl -pi -e 'chomp if eof' s7OnServer.txt
cat r7OnServer.txt Info7OnServer.txt | openssl dgst -sha256  > SHA256rInfo.bin
perl -pi -e 'chomp if eof' SHA256rInfo.bin
cat SHA256rInfo.bin s7OnServer.txt | openssl dgst -sha256 > ValoreSHA.bin

head -n 1 Foglia7OnServer.txt > checkValoreSHA.bin

if cmp -s checkValoreSHA.bin ValoreSHA.bin; then
    output=0
else
    echo "L'apertura della scadenza non è corretta"
    exit 1
fi



# CONTROLLO SE E' SCADUTO
file_date=$(date -r "Info7OnServer.txt" +"%Y-%m-%d")
current_date=$(date +"%Y-%m-%d")

if [[ $file_date < $current_date ]]; then
  echo "Il Green Pass 2.0 è scaduto"
else
  output=0
fi




perl -pi -e 'chomp if eof' r8OnServer.txt
perl -pi -e 'chomp if eof' s8OnServer.txt
cat r8OnServer.txt Info8OnServer.txt | openssl dgst -sha256  > SHA256rInfo.bin
perl -pi -e 'chomp if eof' SHA256rInfo.bin
cat SHA256rInfo.bin s8OnServer.txt | openssl dgst -sha256 > ValoreSHA.bin

head -n 1 Foglia8OnServer.txt > checkValoreSHA.bin

if cmp -s checkValoreSHA.bin ValoreSHA.bin; then
    echo -n "Benvenuto "
    cat Info8OnServer.txt
else
    echo "L'apertura dell'identificativo univoco non è corretta"
    exit 1
fi



rm Valore6.txt Valore7.txt Valore8.txt Valore78.txt Valore78_2.txt Valore56_2.txt Valore5678.txt Valore5678_2.txt checkValoreSHA.bin ValoreSHA.bin

