sed -n '/-----BEGIN PUBLIC KEY-----/,/-----END PUBLIC KEY-----/p' requestByMario.txt > checktemp.pem
output=$(openssl dgst -verify checktemp.pem -signature signatureRequestByMario.bin requestByMario.txt )
if [ "$output" != "Verified OK" ]; then
    echo "La firma di Mario non è valida"
    exit 1
fi

touch ListaRevoche.txt

echo "Firma di Mario valida, creazione GP 2.0..."

#SHA256(SHA256(r || Info) || s)
#s
#r
#Info

head -n 1 requestByMario.txt > Info.txt
openssl rand -out r.bin 32
openssl rand -out s.bin 32
cat r.bin Info.txt | openssl dgst -sha256  > SHA256rInfo.bin
perl -pi -e 'chomp if eof' SHA256rInfo.bin
cat SHA256rInfo.bin s.bin | openssl dgst -sha256 > ValoreSHA.bin
cat ValoreSHA.bin >> Foglia1.txt
echo "***" >> Foglia1.txt
echo >> s.bin
cat s.bin >> Foglia1.txt
echo "***" >> Foglia1.txt
echo >> r.bin
cat r.bin >> Foglia1.txt
echo "***" >> Foglia1.txt
cat Info.txt >> Foglia1.txt


tail -n 2 requestByMario.txt | head -n 1 > Info.txt
openssl rand -out r.bin 32
openssl rand -out s.bin 32
cat r.bin Info.txt | openssl dgst -sha256  > SHA256rInfo.bin
perl -pi -e 'chomp if eof' SHA256rInfo.bin
cat SHA256rInfo.bin s.bin | openssl dgst -sha256 > ValoreSHA.bin
cat ValoreSHA.bin >> Foglia2.txt
echo "***" >> Foglia2.txt
echo >> s.bin
cat s.bin >> Foglia2.txt
echo "***" >> Foglia2.txt
echo >> r.bin
cat r.bin >> Foglia2.txt
echo "***" >> Foglia2.txt
cat Info.txt >> Foglia2.txt


head -n 3 requestByMario.txt | tail -n 1 >Info.txt
openssl rand -out r.bin 32
openssl rand -out s.bin 32
cat r.bin Info.txt | openssl dgst -sha256  > SHA256rInfo.bin
perl -pi -e 'chomp if eof' SHA256rInfo.bin
cat SHA256rInfo.bin s.bin | openssl dgst -sha256 > ValoreSHA.bin
cat ValoreSHA.bin >> Foglia3.txt
echo "***" >> Foglia3.txt
echo >> s.bin
cat s.bin >> Foglia3.txt
echo "***" >> Foglia3.txt
echo >> r.bin
cat r.bin >> Foglia3.txt
echo "***" >> Foglia3.txt
cat Info.txt >> Foglia3.txt

head -n 4 requestByMario.txt | tail -n 1 >Info.txt
if grep -qP '^0$' Info.txt && ! grep -qP '[^0]' Info.txt; then
  echo -n "0" > r.bin
else
  openssl rand -out r.bin 32
fi

openssl rand -out s.bin 32
cat r.bin Info.txt | openssl dgst -sha256  > SHA256rInfo.bin
perl -pi -e 'chomp if eof' SHA256rInfo.bin
cat SHA256rInfo.bin s.bin | openssl dgst -sha256 > ValoreSHA.bin
cat ValoreSHA.bin >> Foglia4.txt
echo "***" >> Foglia4.txt
echo >> s.bin
cat s.bin >> Foglia4.txt
echo "***" >> Foglia4.txt
echo >> r.bin
cat r.bin >> Foglia4.txt
echo "***" >> Foglia4.txt
cat Info.txt >> Foglia4.txt


head -n 5 requestByMario.txt | tail -n 1 >Info.txt
if grep -qP '^0$' Info.txt && ! grep -qP '[^0]' Info.txt; then
  echo -n "0" > r.bin
else
  openssl rand -out r.bin 32
fi
openssl rand -out s.bin 32
cat r.bin Info.txt | openssl dgst -sha256  > SHA256rInfo.bin
perl -pi -e 'chomp if eof' SHA256rInfo.bin
cat SHA256rInfo.bin s.bin | openssl dgst -sha256 > ValoreSHA.bin
cat ValoreSHA.bin >> Foglia5.txt
echo "***" >> Foglia5.txt
echo >> s.bin
cat s.bin >> Foglia5.txt
echo "***" >> Foglia5.txt
echo >> r.bin
cat r.bin >> Foglia5.txt
echo "***" >> Foglia5.txt
cat Info.txt >> Foglia5.txt

cat checktemp.pem >Info.txt
openssl rand -out r.bin 32
openssl rand -out s.bin 32
cat r.bin Info.txt | openssl dgst -sha256  > SHA256rInfo.bin
perl -pi -e 'chomp if eof' SHA256rInfo.bin
cat SHA256rInfo.bin s.bin | openssl dgst -sha256 > ValoreSHA.bin
cat ValoreSHA.bin >> Foglia6.txt
echo "***" >> Foglia6.txt
echo >> s.bin
cat s.bin >> Foglia6.txt
echo "***" >> Foglia6.txt
echo >> r.bin
cat r.bin >> Foglia6.txt
echo "***" >> Foglia6.txt
cat Info.txt >> Foglia6.txt


tail -n 2 requestByMario.txt | head -n 1 > Info.txt
openssl rand -out r.bin 32
openssl rand -out s.bin 32
cat r.bin Info.txt | openssl dgst -sha256  > SHA256rInfo.bin
perl -pi -e 'chomp if eof' SHA256rInfo.bin
cat SHA256rInfo.bin s.bin | openssl dgst -sha256 > ValoreSHA.bin
cat ValoreSHA.bin >> Foglia7.txt
echo "***" >> Foglia7.txt
echo >> s.bin
cat s.bin >> Foglia7.txt
echo "***" >> Foglia7.txt
echo >> r.bin
cat r.bin >> Foglia7.txt
echo "***" >> Foglia7.txt
cat Info.txt >> Foglia7.txt

tail -n 1 requestByMario.txt > Info.txt
openssl rand -out r.bin 32
openssl rand -out s.bin 32
cat r.bin Info.txt | openssl dgst -sha256  > SHA256rInfo.bin
perl -pi -e 'chomp if eof' SHA256rInfo.bin
cat SHA256rInfo.bin s.bin | openssl dgst -sha256 > ValoreSHA.bin
cat ValoreSHA.bin >> Foglia8.txt
echo "***" >> Foglia8.txt
echo >> s.bin
cat s.bin >> Foglia8.txt
echo "***" >> Foglia8.txt
echo >> r.bin
cat r.bin >> Foglia8.txt
echo "***" >> Foglia8.txt
cat Info.txt >> Foglia8.txt


head -n 1 Foglia1.txt | openssl dgst -sha256 > Info.txt
head -n 1 Foglia2.txt | openssl dgst -sha256 >Info2.txt
perl -pi -e 'chomp if eof' Info.txt
perl -pi -e 'chomp if eof' Info2.txt
cat Info.txt Info2.txt | openssl dgst -sha256 > Foglia12.txt


head -n 1 Foglia3.txt | openssl dgst -sha256 > Info.txt
head -n 1 Foglia4.txt | openssl dgst -sha256 > Info2.txt
perl -pi -e 'chomp if eof' Info.txt
perl -pi -e 'chomp if eof' Info2.txt
cat Info.txt Info2.txt | openssl dgst -sha256 > Foglia34.txt


head -n 1 Foglia5.txt | openssl dgst -sha256 > Info.txt
head -n 1 Foglia6.txt | openssl dgst -sha256 > Info2.txt
perl -pi -e 'chomp if eof' Info.txt
perl -pi -e 'chomp if eof' Info2.txt
cat Info.txt Info2.txt | openssl dgst -sha256 > Foglia56.txt


head -n 1 Foglia7.txt | openssl dgst -sha256 > Info.txt
head -n 1 Foglia8.txt | openssl dgst -sha256 > Info2.txt
perl -pi -e 'chomp if eof' Info.txt
perl -pi -e 'chomp if eof' Info2.txt
cat Info.txt Info2.txt | openssl dgst -sha256 > Foglia78.txt



head -n 1 Foglia12.txt | openssl dgst -sha256 > Info.txt
head -n 1 Foglia34.txt | openssl dgst -sha256 > Info2.txt
perl -pi -e 'chomp if eof' Info.txt
perl -pi -e 'chomp if eof' Info2.txt
cat Info.txt Info2.txt | openssl dgst -sha256 > Foglia1234.txt

head -n 1 Foglia56.txt | openssl dgst -sha256 > Info.txt
head -n 1 Foglia78.txt | openssl dgst -sha256 > Info2.txt
perl -pi -e 'chomp if eof' Info.txt
perl -pi -e 'chomp if eof' Info2.txt
cat Info.txt Info2.txt | openssl dgst -sha256 > Foglia5678.txt


head -n 1 Foglia1234.txt | openssl dgst -sha256 > Info.txt
head -n 1 Foglia5678.txt | openssl dgst -sha256 > Info2.txt
perl -pi -e 'chomp if eof' Info.txt
perl -pi -e 'chomp if eof' Info2.txt
cat Info.txt Info2.txt | openssl dgst -sha256 > Radice.txt



openssl dgst -sign askey.pem -out signatureRadiceMario.bin Radice.txt
echo >> signatureRadiceMario.bin

bash daServerAClient.sh Foglia1.txt Foglia1Mario.txt askey.pem ascert.pem
bash daServerAClient.sh Foglia2.txt Foglia2Mario.txt askey.pem ascert.pem
bash daServerAClient.sh Foglia3.txt Foglia3Mario.txt askey.pem ascert.pem
bash daServerAClient.sh Foglia4.txt Foglia4Mario.txt askey.pem ascert.pem
bash daServerAClient.sh Foglia5.txt Foglia5Mario.txt askey.pem ascert.pem
bash daServerAClient.sh Foglia6.txt Foglia6Mario.txt askey.pem ascert.pem
bash daServerAClient.sh Foglia7.txt Foglia7Mario.txt askey.pem ascert.pem
bash daServerAClient.sh Foglia8.txt Foglia8Mario.txt askey.pem ascert.pem

bash daServerAClient.sh Foglia12.txt Foglia12Mario.txt askey.pem ascert.pem
bash daServerAClient.sh Foglia34.txt Foglia34Mario.txt askey.pem ascert.pem
bash daServerAClient.sh Foglia56.txt Foglia56Mario.txt askey.pem ascert.pem
bash daServerAClient.sh Foglia78.txt Foglia78Mario.txt askey.pem ascert.pem

bash daServerAClient.sh Foglia1234.txt Foglia1234Mario.txt askey.pem ascert.pem
bash daServerAClient.sh Foglia5678.txt Foglia5678Mario.txt askey.pem ascert.pem

bash daServerAClient.sh Radice.txt RadiceMario.txt askey.pem ascert.pem
bash daServerAClient.sh signatureRadiceMario.bin signatureASRadice.bin askey.pem ascert.pem
perl -pi -e 'chomp if eof' signatureASRadice.bin

rm signatureRadiceMario.bin Foglia1.txt Foglia2.txt Foglia3.txt Foglia4.txt Foglia5.txt Foglia6.txt Foglia7.txt Foglia8.txt Foglia12.txt Foglia34.txt Foglia56.txt Foglia78.txt Foglia1234.txt Foglia5678.txt Radice.txt
rm checktemp.pem r.bin s.bin SHA256rInfo.bin ValoreSHA.bin Info.txt Info2.txt
