sed -n '/BEGIN BLOCK 3/,//p' BingoChain.txt > BingoChainContributi.txt

sed -n '/END PUBLIC KEY/,/----/p' BingoChainContributi.txt | sed '1d;$d' > BingoChainContributitemp.txt
sed -i '1,/END PUBLIC KEY/d' BingoChainContributi.txt
sed -n '1,/---/ {/---/d; p}' BingoChainContributitemp.txt > Contributo1DaChain.bin
perl -pi -e 'chomp if eof' Contributo1DaChain.bin

sed -n '/END PUBLIC KEY/,/----/p' BingoChainContributi.txt | sed '1d;$d' > BingoChainContributitemp.txt
sed -i '1,/END PUBLIC KEY/d' BingoChainContributi.txt
sed -n '1,/---/ {/---/d; p}' BingoChainContributitemp.txt > Contributo2DaChain.bin
perl -pi -e 'chomp if eof' Contributo2DaChain.bin

sed -n '/END PUBLIC KEY/,/----/p' BingoChainContributi.txt | sed '1d;$d' > BingoChainContributitemp.txt
sed -i '1,/END PUBLIC KEY/d' BingoChainContributi.txt
sed -n '1,/---/ {/---/d; p}' BingoChainContributitemp.txt > Contributo3DaChain.bin
perl -pi -e 'chomp if eof' Contributo3DaChain.bin

sed -n '/END PUBLIC KEY/,/----/p' BingoChainContributi.txt | sed '1d;$d' > BingoChainContributitemp.txt
sed -i '1,/END PUBLIC KEY/d' BingoChainContributi.txt
sed -n '1,/---/ {/---/d; p}' BingoChainContributitemp.txt > Contributo4DaChain.bin
perl -pi -e 'chomp if eof' Contributo4DaChain.bin

sed -n '/END PUBLIC KEY/,/----/p' BingoChainContributi.txt | sed '1d;$d' > BingoChainContributitemp.txt
sed -i '1,/END PUBLIC KEY/d' BingoChainContributi.txt
sed -n '1,/---/ {/---/d; p}' BingoChainContributitemp.txt > ContributoBancoDaChain.bin
perl -pi -e 'chomp if eof' ContributoBancoDaChain.bin

cat Contributo1DaChain.bin Contributo2DaChain.bin Contributo3DaChain.bin Contributo4DaChain.bin ContributoBancoDaChain.bin | openssl dgst -sha256 > StringaRandomDaChain.bin

rm BingoChainContributi.txt BingoChainContributitemp.txt Contributo1DaChain.bin Contributo2DaChain.bin Contributo3DaChain.bin Contributo4DaChain.bin ContributoBancoDaChain.bin
