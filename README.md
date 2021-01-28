# pktowif
Small script to convert a Bitcoin private-key to WIF (wallet input format).

## Usage
![preview](https://github.com/loop28/pktowif/raw/main/preview.png)

## Linux
#### Download
- Download [pk_to_wif_btc.sh](https://github.com/loop28/pktowif/blob/main/pk_to_wif_btc.sh)
#### Run it
- Make it executable (maybe requires sudo)
```
chmod +x pk_to_wif_btc.sh
```
- Open your favorite terminal-emulator
```
./pk_to_wif_btc.sh
```
#### Errors on Linux
Make sure you have all dependencies installed: xxd, sha256sum, head, base58 (you can use the command "which packagename" to check)

## Windows
#### Install Cygwin
- Go to https://www.cygwin.com/ and download the installer
- Run the installer
- Install required packages: xxd, sha256sum, head, base58 (refer to https://cygwin.com/cygwin-ug-net/setup-net.html for info)
#### Download
- Download [pk_to_wif_btc_cygwin.sh](https://github.com/loop28/pktowif/blob/main/pk_to_wif_btc_cygwin.sh)
- Save it to "C:\cygwin64\home\yourusername\pk_to_wif_btc_cygwin.sh"
#### Run it
- Open the Cygwin-terminal (the installation should have left an icon on your desktop)
- Run the script:
```
./pk_to_wif_btc_cygwin.sh
```
#### Errors on Windows
If you get errors including "\r" you likely need to change the end-of-line format to LF (Unix)
- Get an editor like notepad++ (https://notepad-plus-plus.org/downloads/)
- Open pk_to_wif_btc_cygwin.sh
- Go to "Edit" --> "EOL Conversion" and select "Unix (LF)" and save (overwrite)
- Try to run it again
