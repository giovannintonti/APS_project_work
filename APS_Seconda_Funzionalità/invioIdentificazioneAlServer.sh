head -n 1 Foglia6Mario.txt > Valore6.txt
head -n 1 Foglia7Mario.txt > Valore7.txt
head -n 1 Foglia8Mario.txt > Valore8.txt

head -n 1 Foglia5Mario.txt | openssl dgst -sha256 > SHA5.txt
head -n 1 Foglia1234Mario.txt | openssl dgst -sha256 > SHA1234.txt





bash daClientAServer.sh Foglia6OnServertemp.txt Valore6.txt wwwkey.pem wwwcert.pem
perl -0777 -pe 's/\r\n/\n/g' Foglia6OnServertemp.txt > Foglia6OnServer.txt
bash daClientAServer.sh Foglia7OnServertemp.txt Valore7.txt wwwkey.pem wwwcert.pem
perl -0777 -pe 's/\r\n/\n/g' Foglia7OnServertemp.txt > Foglia7OnServer.txt
bash daClientAServer.sh Foglia8OnServertemp.txt Valore8.txt wwwkey.pem wwwcert.pem
perl -0777 -pe 's/\r\n/\n/g' Foglia8OnServertemp.txt > Foglia8OnServer.txt

bash daClientAServer.sh SHA5OnServertemp.txt SHA5.txt wwwkey.pem wwwcert.pem
perl -0777 -pe 's/\r\n/\n/g' SHA5OnServertemp.txt > SHA5OnServer.txt
bash daClientAServer.sh SHA1234OnServertemp.txt SHA1234.txt wwwkey.pem wwwcert.pem
perl -0777 -pe 's/\r\n/\n/g' SHA1234OnServertemp.txt > SHA1234OnServer.txt

echo >> signatureASRadice.bin
bash daClientAServer.sh signatureRadiceMariotemp.bin signatureASRadice.bin wwwkey.pem wwwcert.pem
perl -0777 -pe 's/\r\n/\n/g' signatureRadiceMariotemp.bin > signatureRadiceMarioOnServer.bin
perl -pi -e 'chomp if eof' signatureRadiceMarioOnServer.bin

cat Foglia6Mario.txt > Foglia6temp.txt
sed -i '0,/\*\*\*/d' Foglia6temp.txt
sed -n '/\*\*\*/q;p' Foglia6temp.txt > s6.txt

cat Foglia7Mario.txt > Foglia7temp.txt
sed -i '0,/\*\*\*/d' Foglia7temp.txt
sed -n '/\*\*\*/q;p' Foglia7temp.txt > s7.txt

cat Foglia8Mario.txt > Foglia8temp.txt
sed -i '0,/\*\*\*/d' Foglia8temp.txt
sed -n '/\*\*\*/q;p' Foglia8temp.txt > s8.txt


bash daClientAServer.sh s6temp.txt s6.txt wwwkey.pem wwwcert.pem
perl -0777 -pe 's/\r\n/\n/g' s6temp.txt > s6OnServer.txt
bash daClientAServer.sh s7temp.txt s7.txt wwwkey.pem wwwcert.pem
perl -0777 -pe 's/\r\n/\n/g' s7temp.txt > s7OnServer.txt
bash daClientAServer.sh s8temp.txt s8.txt wwwkey.pem wwwcert.pem
perl -0777 -pe 's/\r\n/\n/g' s8temp.txt > s8OnServer.txt

sed -i '0,/\*\*\*/d' Foglia6temp.txt
sed -n '/\*\*\*/q;p' Foglia6temp.txt > r6.txt

sed -i '0,/\*\*\*/d' Foglia7temp.txt
sed -n '/\*\*\*/q;p' Foglia7temp.txt > r7.txt

sed -i '0,/\*\*\*/d' Foglia8temp.txt
sed -n '/\*\*\*/q;p' Foglia8temp.txt > r8.txt


bash daClientAServer.sh r6temp.txt r6.txt wwwkey.pem wwwcert.pem
perl -0777 -pe 's/\r\n/\n/g' r6temp.txt > r6OnServer.txt
bash daClientAServer.sh r7temp.txt r7.txt wwwkey.pem wwwcert.pem
perl -0777 -pe 's/\r\n/\n/g' r7temp.txt > r7OnServer.txt
bash daClientAServer.sh r8temp.txt r8.txt wwwkey.pem wwwcert.pem
perl -0777 -pe 's/\r\n/\n/g' r8temp.txt > r8OnServer.txt

sed -i '0,/\*\*\*/d' Foglia6temp.txt
sed -n '/\*\*\*/q;p' Foglia6temp.txt > Info6.txt

sed -i '0,/\*\*\*/d' Foglia7temp.txt
sed -n '/\*\*\*/q;p' Foglia7temp.txt > Info7.txt

sed -i '0,/\*\*\*/d' Foglia8temp.txt
sed -n '/\*\*\*/q;p' Foglia8temp.txt > Info8.txt

bash daClientAServer.sh Info6temp.txt Info6.txt wwwkey.pem wwwcert.pem
perl -0777 -pe 's/\r\n/\n/g' Info6temp.txt > Info6OnServer.txt
bash daClientAServer.sh Info7temp.txt Info7.txt wwwkey.pem wwwcert.pem
perl -0777 -pe 's/\r\n/\n/g' Info7temp.txt > Info7OnServer.txt
bash daClientAServer.sh Info8temp.txt Info8.txt wwwkey.pem wwwcert.pem
perl -0777 -pe 's/\r\n/\n/g' Info8temp.txt > Info8OnServer.txt

openssl dgst -sign Marioprivatekey.pem -out signatureRandomBits.bin RandomBitsMario.bin
echo >> signatureRandomBits.bin
bash daClientAServer.sh signatureRandomBitstemp.bin signatureRandomBits.bin wwwkey.pem wwwcert.pem
perl -0777 -pe 's/\r\n/\n/g' signatureRandomBitstemp.bin > signatureRandomBitsOnServer.bin
perl -pi -e 'chomp if eof' signatureRandomBitsOnServer.bin

rm Valore6.txt Valore7.txt Valore8.txt SHA5.txt SHA1234.txt Foglia6OnServertemp.txt Foglia7OnServertemp.txt Foglia8OnServertemp.txt SHA5OnServertemp.txt
rm SHA1234OnServertemp.txt signatureRadiceMariotemp.bin Foglia6temp.txt Foglia7temp.txt Foglia8temp.txt s6temp.txt s7temp.txt s8temp.txt
rm r6temp.txt r7temp.txt r8temp.txt
