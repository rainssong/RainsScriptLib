@echo off
certutil -hashfile %1 MD5
certutil -hashfile %1 SHA1
certutil -hashfile %1 SHA256
pause