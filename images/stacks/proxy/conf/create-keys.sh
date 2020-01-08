HOSTNAME=hostname.com

#keytool -genkey -alias $HOSTNAME -keyalg RSA -keysize 2048 -keystore $HOSTNAME.jks -dname "CN=*.$HOSTNAME, O=Company, L=Location, ST=ST, C=US" 
#keytool -certreq -alias $HOSTNAME -file $HOSTNAME.csr -keystore $HOSTNAME.jks
keytool -importcert -keystore $HOSTNAME.jks -storepass -keyalg "RSA" -trustcacerts -file $HOSTNAME.pem
keytool -importkeystore -srckeystore $HOSTNAME.jks -destkeystore $HOSTNAME.p12 -srcstoretype jks -deststoretype pkcs12
openssl pkcs12 -nomacver -nocerts -nodes -in $HOSTNAME.p12 -out $HOSTNAME.key

#keytool -genkey -alias $HOSTNAME.evssl -keyalg RSA -keysize 2048 -keystore $HOSTNAME.evssl.jks -dname "CN=$HOSTNAME, O=COMPANY, L=LOCATION, ST=ST, C=US" 
#keytool -certreq -alias $HOSTNAME.evssl -file $HOSTNAME.evssl.csr -keystore $HOSTNAME.evssl.jks
#keytool -importkeystore -srckeystore $HOSTNAME.evssl.jks -destkeystore $HOSTNAME.evssl.p12 -srcstoretype jks -deststoretype pkcs12
#openssl pkcs12 -in $HOSTNAME.evssl.p12 -out $HOSTNAME.evssl.key

