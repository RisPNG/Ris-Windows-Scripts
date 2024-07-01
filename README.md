<h1 align="center">Ris' Windows Scripts</h1>
<h2 align="center">This GitHub repository contains random scripts that I personally use for my Windows workflow.</h2>
<p align="center">
<a href="https://github.com/RisPNG/Ris-Windows-Scripts/stargazers"><img alt="GitHub Repo Stars" src="https://img.shields.io/github/stars/RisPNG/Ris-Windows-Scripts?style=flat&color=limegreen"></a>
<a href="https://github.com/RisPNG/Ris-Windows-Scripts"><img alt="GitHub Last Commit" src="https://img.shields.io/github/last-commit/RisPNG/Ris-Windows-Scripts?style=flat&color=lightyellow"></a>
</p>

# README Contents
1. 🧾 [Scripts](#scripts)
2. ⚠️ [Disclaimer](#disclaimer)

## Scripts

### Disable USB Power Saving
This script uncheck the "Allow the computer to turn off this device to save power" for every devices in Device Manager. This helps to combat the issue of random disconnection of any USB devices. I recommend only running this script when the affected devices is plugged in and leave the unaffected ones unplugged to avoid any other issues related to USB disconnection issues. This is an old script that I had to use because my DAC keeps on disconnecting randomly and I had to re-plug its USB device everytime it misbehaves. Windows might already solved this issue overtime through updates and this script is absolutely only necessary if issue persists.

> [Credit](https://www.reddit.com/r/PowerShell/comments/lr5iyk/uncheck_allow_the_computer_to_turn_off_this/)

### Flush DNS
Literally just runs `ipconfig /flushdns`. I run this automatically daily using Task Scheduler.

### Convert Image to JPG
This script uses IrfanView to convert any image format to JPG. Should work on most if not all format of images. Change the path if necessary. Just drag and drop image file into the script (open image with script) or setup the script in context menu. Nowadays I just recommend [Tichau/FileConverter](https://file-converter.io)

### Reset Audio Services
Reset related audio services because I keep having issues with Voicemeeter.

### 100GB Limiter
This script deletes the oldest file(s) on loop in the current directory including files inside subdirectories until the current directory size is 100GB or below. Use this with caution, it will delete files without any prompt!

## Disclaimer
This is a personal project, it comes with no guarantee or warranty. You are responsible for whatever happens from using anything from this repository.
