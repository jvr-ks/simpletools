@rem virusScanLinksCopyToReadme.bat

@echo off

cd %~dp0

copy /y _README_proto.md README.md

type _virusscanLinks.txt >> README.md


















