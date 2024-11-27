perl -pi -e 'chomp if eof' RandomnessPlayer1.bin
perl -pi -e 'chomp if eof' ContributoPlayer1.bin

cat -b ContributoPlayer1.bin RandomnessPlayer1.bin > concatenatedPlayer1.bin
openssl dgst -sign Player1privatekey.pem -out signatureOpening1.bin concatenatedPlayer1.bin

echo >> signatureOpening1.bin

bash daClientAServer.sh signatureOpening1temp.bin signatureOpening1.bin
perl -0777 -pe 's/\r\n/\n/g' signatureOpening1temp.bin > signatureOpening1OnServer.bin
perl -pi -e 'chomp if eof' signatureOpening1OnServer.bin



perl -pi -e 'chomp if eof' RandomnessPlayer2.bin
perl -pi -e 'chomp if eof' ContributoPlayer2.bin

cat -b ContributoPlayer2.bin RandomnessPlayer2.bin > concatenatedPlayer2.bin
openssl dgst -sign Player2privatekey.pem -out signatureOpening2.bin concatenatedPlayer2.bin

echo >> signatureOpening2.bin

bash daClientAServer.sh signatureOpening2temp.bin signatureOpening2.bin
perl -0777 -pe 's/\r\n/\n/g' signatureOpening2temp.bin > signatureOpening2OnServer.bin
perl -pi -e 'chomp if eof' signatureOpening2OnServer.bin


perl -pi -e 'chomp if eof' RandomnessPlayer3.bin
perl -pi -e 'chomp if eof' ContributoPlayer3.bin

cat -b ContributoPlayer3.bin RandomnessPlayer3.bin > concatenatedPlayer3.bin
openssl dgst -sign Player3privatekey.pem -out signatureOpening3.bin concatenatedPlayer3.bin

echo >> signatureOpening3.bin

bash daClientAServer.sh signatureOpening3temp.bin signatureOpening3.bin
perl -0777 -pe 's/\r\n/\n/g' signatureOpening3temp.bin > signatureOpening3OnServer.bin
perl -pi -e 'chomp if eof' signatureOpening3OnServer.bin



perl -pi -e 'chomp if eof' RandomnessPlayer4.bin
perl -pi -e 'chomp if eof' ContributoPlayer4.bin

cat -b ContributoPlayer4.bin RandomnessPlayer4.bin > concatenatedPlayer4.bin
openssl dgst -sign Player4privatekey.pem -out signatureOpening4.bin concatenatedPlayer4.bin

echo >> signatureOpening4.bin

bash daClientAServer.sh signatureOpening4temp.bin signatureOpening4.bin
perl -0777 -pe 's/\r\n/\n/g' signatureOpening4temp.bin > signatureOpening4OnServer.bin
perl -pi -e 'chomp if eof' signatureOpening4OnServer.bin







rm signatureOpening1temp.bin signatureOpening2temp.bin signatureOpening3temp.bin signatureOpening4temp.bin
rm concatenatedPlayer1.bin concatenatedPlayer2.bin concatenatedPlayer3.bin concatenatedPlayer4.bin
