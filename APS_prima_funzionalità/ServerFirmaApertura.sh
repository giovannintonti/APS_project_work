cat -b ContributoBanco.bin RandomnessBanco.bin > concatenatedBanco.bin
openssl dgst -sign Bancoprivatekey.pem -out signatureOpeningBanco.bin concatenatedBanco.bin

