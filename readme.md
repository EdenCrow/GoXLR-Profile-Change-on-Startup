# GoXLR Profile Change on Startup
A script for changing the GoXLR profile at startup on Windows.

Avoid having to select your default profile on boot after setting the device to sleep!

## Requirements
- [GoXLR App](https://www.tc-helicon.com/downloads.html)

- [AutoHotKey V2](https://www.autohotkey.com/)

- A GoXLR 'Default' profile (to be chosen when your PC is turned on)

## Installation
1) Download the `GoXLRStartup.ahk` script from this repository

2) Edit the script and make sure the `startupProfile` matches the name of your chosen profile in the GoXLR app

3) Also make sure that the paths under `File locations` match the location of the GoXLR:
    - App (`GoXLR App.exe`)
    - Control Panel (`GoXLRAudioCplApp.exe`)
    - Settings (`GoXLR.settings`)

4) Move the file to your `Startup` folder, which can usually be found at: `C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp`

5) In this folder should also be shortcuts to the GoXLR app and control panel, which must be deleted

The script should now run the next time you boot your system and start the GoXLR device with the requested profile.

## Why?
The GoXLR is a fantastic audio interface built for streamers. However, its bright lights can be an eyesore and a power drain when your PC is shut down.

To combat this I use my [Stream Deck](https://www.elgato.com/en/stream-deck-xl) with a [multi-action switch](https://help.elgato.com/hc/en-us/articles/360027960912-Elgato-Stream-Deck-Multi-Actions) for selecting the 'Sleep' profile and turning off my machine. This profile turns off the lights and sets the faders to 0. The beta release of the GoXLR application also includes the option of selecting a profile to use on closing the application, which most will use to select this 'Sleep' profile.

However, upon starting the PC again the device will still be in this 'Sleep' profile. The user will then have to select a non-'sleep' profile every time they boot their machine.

So as to avoid this (admittedly small) chore, this AutoHotKey script will instead boot the GoXLR straight into a user's chosen profile.

## How?
Upon starting the GoXLR app, the program looks for the last known profile used. This value is stored in the `GoXLR.settings` file in `%AppData%`, under `lastLoadedProfile`.

This script opens that file and uses regular expressions to find the `lastLoadedProfile` value and changes it to the `startupProfile` requested. 

In order to make sure the file is changed *before* the GoXLR app starts, the applications are removed from the normal `Startup` folder. Instead, they are run directly from the script *after* the settings file has been modified.

## Licence
This project is licensed under the [MIT license](https://opensource.org/licenses/MIT).