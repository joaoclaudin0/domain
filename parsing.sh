
#!/bin/bash
 
echo "==========================="
echo "CL4UD SECURITY - SUBDOMAINS"
echo "==========================="

if [$1 == ""]
then
	echo "=============================="
	echo "CL4UD SECURITY - SUBDOMAINS"
	echo "Modo de uso: $0 exemplo.com.br"
	echo "==============================="
else

wget $1 2> /dev/null

cat index.html |grep "href" | cut -d "/" -f 3 | grep "\." |cut -d '"' -f 1 | grep -v '<l' > list.txt;

cat list.txt
echo "================================"
echo "[+] Resolvendo Hosts"
echo "================================"
for url in $(cat list.txt); 
do
host $url | grep "has address" | cut -d " " -f 4;
done



fi
