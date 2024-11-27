openssl genpkey -paramfile prime256v1.pem -out askey.pem
openssl pkey -in askey.pem -pubout -out aspub_key.pem
openssl req -new -key askey.pem -out asrequest.pem -config myconfigas.cfg



sudo openssl ca -in asrequest.pem -out ascert.pem -policy policy_anything -config /etc/ssl/openssl.cnf -extfile extensions.cnf
