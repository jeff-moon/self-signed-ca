mkdir -p ssl
rm -f ssl/*
openssl req -config config/cert.cnf -newkey rsa:2048 -sha256 -nodes -out ssl/server_csr.csr -outform PEM > ssl/serverkey.pem
openssl ca -config config/ca.cnf -policy signing_policy -extensions signing_req -out ssl/server.pem -infiles ssl/server_csr.csr
openssl x509 -in ssl/server.pem -addtrust serverAuth -out ssl/server_trusted.pem