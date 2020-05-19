PASSWORD='admin123'
for (( i=100; i <= 255; ++i ))
do
    expect -c 'spawn ssh -oStrictHostKeyChecking=no root@'192.168.27.$i' "hostname -s" 
			expect "*password:*" { send '"$PASSWORD\r"' }
			interact'
done
