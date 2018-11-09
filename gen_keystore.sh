#!/bin/bash

if [ -d "ssl" ]
then
    rm -fr ssl
fi

mkdir ssl

cd ssl

PW=`pwgen -Bs 10 1`
echo ${PW} > password

keytool -genkeypair -keystore grant.jks -storepass $PW \
 -keyalg RSA -keysize 2048 -validity 5000 -keypass $PW \
 -dname 'CN=localhost, OU=Nexus3, O=Schedule1, L=Toronto, ST=Ontario, C=CA' 

keytool -exportcert -keystore grant.jks -storepass $PW -rfc > grant.cert

keytool -importkeystore -srckeystore grant.jks -srcstorepass $PW -destkeystore grant.p12 -deststorepass $PW -deststoretype PKCS12

keytool -list -keystore grant.p12 -storetype PKCS12 -storepass $PW

openssl pkcs12 -nokeys -in grant.p12 -out grant.pem -password pass:$PW

openssl pkcs12 -nocerts -nodes -in grant.p12 -out grant.key -password pass:$PW

cd ..

