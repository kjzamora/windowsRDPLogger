# RDPLogger

A windows server RDP logger script meant to be used in conjuction with Windows Scheduler and produces a txt and csv file.

This script is inteded to run continuously with a Windows Scheduler that executes the RDP logger "On Start".
The script must run continuously as the clientname that is logged and a volatile environment variable.
To minimize system performance impact from a continously running script, a sleep time of 120 seconds was provide but should be adjusted to your needs. 

## Windows Scheduler
windows_scheduler.bat provides a way to setup and run on start of the machine the RDPLogger schedule task as long as the RDPLogger is placed in "C:\log\scripts\RDPLogger.ps1"
Assumes this .bat is being run on an Administrator account, otherwise add appropriate credentials.