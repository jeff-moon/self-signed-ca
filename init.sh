# Initialize directories
mkdir -p easy-rsa
ln -s /usr/share/easy-rsa/* ./easy-rsa/
chmod 700 ./easy-rsa

pushd easy-rsa
# Initialize EasyRSA
./easyrsa init-pki
cp vars.example vars

# Build the CA
./easyrsa build-ca
openssl req -x509 -config ../config/ca.cnf -days 365 -newkey rsa:4096 -sha256 -nodes -out ca.pem -outform PEM
mv ca.pem ./pki/ca.crt
mv cakey.pem ./pki/private/ca.key
popd
