for i in ECDHE-RSA-AES256-GCM-SHA384 ECDHE-ECDSA-AES256-GCM-SHA384 ECDHE-RSA-AES256-SHA384 ECDHE-ECDSA-AES256-SHA384 DHE-DSS-AES256-GCM-SHA384 DHE-RSA-AES256-GCM-SHA384 DHE-RSA-AES256-SHA256 DHE-DSS-AES256-SHA256 ECDH-RSA-AES256-GCM-SHA384 ECDH-ECDSA-AES256-GCM-SHA384 ECDH-RSA-AES256-SHA384 ECDH-ECDSA-AES256-SHA384 AES256-GCM-SHA384 AES256-SHA256 ECDHE-RSA-AES128-GCM-SHA256 ECDHE-ECDSA-AES128-GCM-SHA256 ECDHE-RSA-AES128-SHA256 ECDHE-ECDSA-AES128-SHA256 DHE-DSS-AES128-GCM-SHA256 DHE-RSA-AES128-GCM-SHA256 DHE-RSA-AES128-SHA256 DHE-DSS-AES128-SHA256 ECDH-RSA-AES128-GCM-SHA256 ECDH-ECDSA-AES128-GCM-SHA256 ECDH-RSA-AES128-SHA256 ECDH-ECDSA-AES128-SHA256 AES128-GCM-SHA256 AES128-SHA256 CAMELLIA128-SHA
do
openssl s_client -msg -debug -tlsextdebug -connect 192.168.150.85:443 -tls1_2 -cipher $i
read  -p "Response for cipher $i"
reset
done
