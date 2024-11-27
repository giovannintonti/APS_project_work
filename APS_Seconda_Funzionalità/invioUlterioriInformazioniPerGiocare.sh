head -n 1 Foglia4Mario.txt > Valore4.txt
head -n 1 Foglia5Mario.txt > Valore5.txt

head -n 1 Foglia6Mario.txt | openssl dgst -sha256 > SHA6.txt
head -n 1 Foglia3Mario.txt | openssl dgst -sha256 > SHA3.txt
head -n 1 Foglia12Mario.txt | openssl dgst -sha256 > SHA12.txt
head -n 1 Foglia78Mario.txt | openssl dgst -sha256 > SHA78.txt



bash daClientAServer.sh Foglia4OnServertemp.txt Valore4.txt wwwkey.pem wwwcert.pem
perl -0777 -pe 's/\r\n/\n/g' Foglia4OnServertemp.txt > Foglia4OnServer.txt
bash daClientAServer.sh Foglia5OnServertemp.txt Valore5.txt wwwkey.pem wwwcert.pem
perl -0777 -pe 's/\r\n/\n/g' Foglia5OnServertemp.txt > Foglia5OnServer.txt

bash daClientAServer.sh SHA6OnServertemp.txt SHA6.txt wwwkey.pem wwwcert.pem
perl -0777 -pe 's/\r\n/\n/g' SHA6OnServertemp.txt > SHA6OnServer.txt
bash daClientAServer.sh SHA3OnServertemp.txt SHA3.txt wwwkey.pem wwwcert.pem
perl -0777 -pe 's/\r\n/\n/g' SHA3OnServertemp.txt > SHA3OnServer.txt
bash daClientAServer.sh SHA12OnServertemp.txt SHA12.txt wwwkey.pem wwwcert.pem
perl -0777 -pe 's/\r\n/\n/g' SHA12OnServertemp.txt > SHA12OnServer.txt
bash daClientAServer.sh SHA78OnServertemp.txt SHA78.txt wwwkey.pem wwwcert.pem
perl -0777 -pe 's/\r\n/\n/g' SHA78OnServertemp.txt > SHA78OnServer.txt

# la radice già la tiene

cat Foglia4Mario.txt > Foglia4temp.txt
sed -i '0,/\*\*\*/d' Foglia4temp.txt
sed -n '/\*\*\*/q;p' Foglia4temp.txt > s4.txt

cat Foglia5Mario.txt > Foglia5temp.txt
sed -i '0,/\*\*\*/d' Foglia5temp.txt
sed -n '/\*\*\*/q;p' Foglia5temp.txt > s5.txt

bash daClientAServer.sh s4temp.txt s4.txt wwwkey.pem wwwcert.pem
perl -0777 -pe 's/\r\n/\n/g' s4temp.txt > s4OnServer.txt
bash daClientAServer.sh s5temp.txt s5.txt wwwkey.pem wwwcert.pem
perl -0777 -pe 's/\r\n/\n/g' s5temp.txt > s5OnServer.txt


sed -i '0,/\*\*\*/d' Foglia4temp.txt
sed -n '/\*\*\*/q;p' Foglia4temp.txt > r4.txt

sed -i '0,/\*\*\*/d' Foglia5temp.txt
sed -n '/\*\*\*/q;p' Foglia5temp.txt > r5.txt

sed -i '0,/\*\*\*/d' Foglia4temp.txt
sed -n '/\*\*\*/q;p' Foglia4temp.txt > Info4.txt

sed -i '0,/\*\*\*/d' Foglia5temp.txt
sed -n '/\*\*\*/q;p' Foglia5temp.txt > Info5.txt

perl -pi -e 'chomp if eof' r4.txt
perl -pi -e 'chomp if eof' r5.txt

cat r4.txt Info4.txt | openssl dgst -sha256  > SHA256r4Info4.bin
cat r5.txt Info5.txt | openssl dgst -sha256  > SHA256r5Info5.bin

bash daClientAServer.sh SHA256r4Info4temp.txt SHA256r4Info4.bin wwwkey.pem wwwcert.pem
perl -0777 -pe 's/\r\n/\n/g' SHA256r4Info4temp.txt > SHA256r4Info4OnServer.txt
bash daClientAServer.sh SHA256r5Info5temp.txt SHA256r5Info5.bin wwwkey.pem wwwcert.pem
perl -0777 -pe 's/\r\n/\n/g' SHA256r5Info5temp.txt > SHA256r5Info5OnServer.txt


rm Valore4.txt Valore5.txt SHA6.txt SHA3.txt SHA12.txt SHA78.txt Foglia4OnServertemp.txt Foglia5OnServertemp.txt SHA6OnServertemp.txt SHA3OnServertemp.txt
rm SHA12OnServertemp.txt SHA78OnServertemp.txt Foglia4temp.txt Foglia5temp.txt s4temp.txt s5temp.txt s4.txt s5.txt SHA256r4Info4temp.txt
rm SHA256r5Info5temp.txt
