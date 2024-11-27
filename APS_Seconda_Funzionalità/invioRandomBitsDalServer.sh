openssl rand -out RandomBits.bin 32
echo >> RandomBits.bin
bash daServerAClient.sh RandomBits.bin RandomBitsMario.bin wwwkey.pem wwwcert.pem
perl -pi -e 'chomp if eof' RandomBitsMario.bin
