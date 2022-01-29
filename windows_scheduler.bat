SCHTASKS /CREATE /SC ONSTART /TN "RDP Logger" /TR "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -windowstyle hidden -File C:\log\scripts\RDPLogger.ps1"
SCHTASKS /RUN /TN "RDP Logger"