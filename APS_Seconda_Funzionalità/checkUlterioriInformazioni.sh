head -n 1 Foglia4OnServer.txt | openssl dgst -sha256 > Valore4.txt
perl -pi -e 'chomp if eof' Valore4.txt
perl -pi -e 'chomp if eof' SHA3OnServer.txt
cat SHA3OnServer.txt Valore4.txt | openssl dgst -sha256 > Valore34.txt

head -n 1 Foglia5OnServer.txt | openssl dgst -sha256 > Valore5.txt
perl -pi -e 'chomp if eof' Valore5.txt
perl -pi -e 'chomp if eof' SHA6OnServer.txt
cat Valore5.txt SHA6OnServer.txt | openssl dgst -sha256 > Valore56.txt

head -n 1 Valore34.txt | openssl dgst -sha256 > Valore34_2.txt
perl -pi -e 'chomp if eof' Valore34_2.txt
perl -pi -e 'chomp if eof' SHA12OnServer.txt
cat SHA12OnServer.txt Valore34_2.txt | openssl dgst -sha256 > Valore1234.txt

head -n 1 Valore56.txt | openssl dgst -sha256 > Valore56_2.txt
perl -pi -e 'chomp if eof' Valore56_2.txt
perl -pi -e 'chomp if eof' SHA78OnServer.txt
cat  Valore56_2.txt SHA78OnServer.txt | openssl dgst -sha256 > Valore5678.txt

head -n 1 Valore1234.txt | openssl dgst -sha256 > Valore1234_2.txt
perl -pi -e 'chomp if eof' Valore1234_2.txt
head -n 1 Valore5678.txt | openssl dgst -sha256 > Valore5678_2.txt
perl -pi -e 'chomp if eof' Valore5678_2.txt
cat Valore1234_2.txt Valore5678_2.txt | openssl dgst -sha256 > ValoreRadice2.txt

if cmp -s ValoreRadice2.txt ValoreRadice.txt; then
  output=0
else
  echo "Le informazioni inviate non corrispondono allo stesso Green Pass utilizzato per l'accesso"
  exit 1
fi


echo "0" >> InfoTest.txt
echo -n "0" >> rtest.txt
cat rtest.txt InfoTest.txt | openssl dgst -sha256  > SHA256Test.txt
perl -pi -e 'chomp if eof' SHA256Test.txt

perl -pi -e 'chomp if eof' s4OnServer.txt
perl -pi -e 'chomp if eof' SHA256r4Info4OnServer.txt
cat SHA256r4Info4OnServer.txt s4OnServer.txt | openssl dgst -sha256 > ValoreSHA4OnServer.bin


if cmp -s ValoreSHA4OnServer.bin Foglia4OnServer.txt; then
  output=0
else
  echo "L'apertura della foglia contenente i precedenti penali non è corretta"
  exit 1
fi

perl -pi -e 'chomp if eof' s5OnServer.txt
perl -pi -e 'chomp if eof' SHA256r5Info5OnServer.txt
cat SHA256r5Info5OnServer.txt s5OnServer.txt | openssl dgst -sha256 > ValoreSHA5OnServer.bin

if cmp -s ValoreSHA5OnServer.bin Foglia5OnServer.txt; then
  output=0
else
  echo "L'apertura della foglia contenente il vaccino non è corretta"
  exit 1
fi


if cmp -s SHA256r4Info4OnServer.txt SHA256Test.txt; then
  output=0
else
  echo "Non so quali reati tu abbia,ma non puoi giocare alla sala virtuale!"
  exit 1
fi


if cmp -s SHA256r5Info5OnServer.txt SHA256Test.txt; then
    echo "Non hai il vaccino,ma non puoi giocare alla sala virtuale!"
  exit 1
else
  echo "Hai il vaccino, ma non so di quale si tratta, e non hai reati, puoi giocare alla sala virtuale!"
fi





rm Valore4.txt Valore34.txt Valore5.txt Valore56.txt Valore34_2.txt Valore1234.txt Valore56_2.txt Valore5678.txt Valore1234_2.txt Valore5678_2.txt
rm ValoreRadice2.txt InfoTest.txt rtest.txt ValoreSHA4OnServer.bin ValoreSHA5OnServer.bin

