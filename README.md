# shodan-bulkiplookup
This repo contains two scripts that help you extract unique IPs from any file and run them through **Shodan** in bulk.

## Prerequisites

- Bash
- Shodan CLI installed and initialized

```bash
pip install shodan
shodan init API_KEY
chmod +x ipextract.sh shodan-bulk.sh
```

## Sample usage
```bash

./shodan-bulk.sh -f ip_list.txt 

 ██████╗███████╗██████╗ ████████╗ █████╗ ███████╗
██╔════╝██╔════╝██╔══██╗╚══██╔══╝██╔══██╗╚══███╔╝
██║     █████╗  ██████╔╝   ██║   ███████║  ███╔╝ 
██║     ██╔══╝  ██╔══██╗   ██║   ██╔══██║ ███╔╝  
╚██████╗███████╗██║  ██║   ██║██╗██║  ██║███████╗
 ╚═════╝╚══════╝╚═╝  ╚═╝   ╚═╝╚═╝╚═╝  ╚═╝╚══════╝
CERT.AZ - Shodan IP Scanner
------------------------------------------

Checking 192.168.1.10 ...
Checking 192.168.1.20 ...
Checking 10.0.0.5 ...
Checking 10.0.1.25 ...
Checking 172.16.5.100 ...

Results saved to shodan_res.txt
```



