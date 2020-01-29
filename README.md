# HID-Devices-Switch
This is a PowerShell script to disable/enable all necessary HID Devices for the Prototype video game.

## Problem
Prototype is a game from 2009. It has a big problem with USB-based keyboards and mouses. If keyboard/mouse is represented in Windows Device Manager under HID Devices group, then you can notice heavy FPS drop in the game.

In this case you need to disable device manually. But if you have a keyboard and mouse that are represented by more than one HID Device (like in my case) then process is annoying and time-consuming.

## Solution
To speed up this process I made simple PowerShell script. This disables all necessary devices if they are enabled and vice versa.

## Tested devices
This is a list of devices tested with this script:

* Corsair Harpoon RGB Pro
* Corsair K70 RGB MK.2 Cherry MX Silent
