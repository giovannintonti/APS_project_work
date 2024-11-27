touch infoGreenPass2.0.txt

openssl genpkey -paramfile prime256v1.pem -out Marioprivatekey.pem
openssl pkey -in Marioprivatekey.pem -pubout -out Mariopublickey.pem

echo "Mario" >> infoGreenPass2.0.txt
echo "Rossi" >> infoGreenPass2.0.txt
echo "25" >> infoGreenPass2.0.txt
echo "0" >> infoGreenPass2.0.txt
echo "Pfizer" >> infoGreenPass2.0.txt
cat Mariopublickey.pem >> infoGreenPass2.0.txt
data_odierna=$(date +%Y-%m-%d)
data_successiva=$(date -d "${data_odierna} +1 year" +%Y-%m-%d)
echo $data_successiva >> infoGreenPass2.0.txt
echo "001" >> infoGreenPass2.0.txt

openssl dgst -sign Marioprivatekey.pem -out signatureRequestOfMario.bin infoGreenPass2.0.txt
echo >> signatureRequestOfMario.bin

bash daClientAServer.sh requestByMariotemp.txt infoGreenPass2.0.txt askey.pem ascert.pem
perl -0777 -pe 's/\r\n/\n/g' requestByMariotemp.txt > requestByMario.txt
bash daClientAServer.sh signatureRequestByMariotemp.bin signatureRequestOfMario.bin askey.pem ascert.pem
perl -0777 -pe 's/\r\n/\n/g' signatureRequestByMariotemp.bin > signatureRequestByMario.bin
perl -pi -e 'chomp if eof' signatureRequestByMario.bin
perl -pi -e 'chomp if eof' signatureRequestOfMario.bin

rm infoGreenPass2.0.txt requestByMariotemp.txt signatureRequestByMariotemp.bin
