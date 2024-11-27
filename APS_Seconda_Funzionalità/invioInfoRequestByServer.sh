echo "Vaccino" > infoServer.txt
echo "Precedenti penali" >> infoServer.txt

bash daServerAClient.sh infoServer.txt requestByServer.txt wwwkey.pem wwwcert.pem
rm infoServer.txt
