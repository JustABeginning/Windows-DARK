# Windows-DARK

<p align=left>
  <a href="https://github.com/JustABeginning/Windows-DARK#JAB"><img src="https://img.shields.io/badge/platform-windows-blue" alt="Platform Support"></a>
  <a href="https://github.com/JustABeginning/Windows-DARK#JAB"><img src="https://img.shields.io/badge/support-%3C%3D%20windows_10-darkgreen" alt="Platform Version"></a>
  <a href="https://github.com/JustABeginning/Windows-DARK#JAB"><img src="https://img.shields.io/badge/device-desktop%2C%20laptop-lightgrey" alt="Device Support"></a>
</p>

<p align=left>
  <a href="https://github.com/JustABeginning/Windows-DARK#JAB"><img alt="Language Used" src="https://img.shields.io/badge/language-Batch%20Script%2C%20VBScript-yellow"></a>
  <a href="https://github.com/JustABeginning/Windows-DARK#JAB"><img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/JustABeginning/Windows-DARK"></a>
</p>

A Windows based program that turns on/off DARK MODE based on custom time schedule

<p align=center>
<h3 align=center>Dark Mode</h3>
<a href="https://github.com/JustABeginning/Windows-DARK#JAB"><img src="Images/Dark_Mode.jpg" alt="Dark Mode Preview"></a>
</p>

<p align=center>
<h3 align=center>Light Mode</h3>
<a href="https://github.com/JustABeginning/Windows-DARK#JAB"><img src="Images/Light_Mode.jpg" alt="Light Mode Preview"></a>
</p>

<a href="https://www.producthunt.com/posts/windows-dark-v2-0?utm_source=badge-featured&utm_medium=badge&utm_souce=badge-windows&#0045;dark&#0045;v2&#0045;0" target="_blank"><img src="https://api.producthunt.com/widgets/embed-image/v1/featured.svg?post_id=357634&theme=light" alt="Windows&#0032;DARK&#0032;&#0040;v2&#0046;0&#0041; - Auto&#0032;control&#0032;Dark&#0032;Mode&#0032;in&#0032;Windows | Product Hunt" style="width: 250px; height: 54px;" width="250" height="54" /></a>

## Install

- [Download](https://github.com/JustABeginning/Windows-DARK/releases) the zip file and extract/save it in a folder (Give it any name) [All the extracted components must be in the same folder].

### Auto

1. Go to the extracted folder.
1. Click on `Install.bat` file.

### Manual

1. Go to the extracted folder.
1. Create a _shortcut_ of `Launch_DARK.bat` file.
1. Press `Win+R` from keyboard or, open windows run menu, then type `shell:startup` and press enter.
1. Save the shortcut created in **step-2** in the location which opens in **step-3**.
1. Return back to the folder of **step-1** and click on `Launch_DARK.bat` file.

## Note

- This program requires that the system time is not set in 24 HR format, i.e., it is set in AM/PM format.

- In order to set custom values, use `Custom_Time_Schedule.bat` file.

<p align=center>
  <a href="https://github.com/JustABeginning/Windows-DARK#JAB"><img src="Images/Custom_Schedule.jpg" alt="Set Custom Time Schedule"></a>
</p>

- To skip the value of a parameter, press enter. This will accept the default/recently saved (if any) value for that parameter.
- The DEFAULT VALUES are:
  - Start HR - 05
  - Start MIN - 00
  - Start MODE - PM
  - End HR - 06
  - End MIN - 00
  - End MODE - AM
  - Snooze time - 1 minute

## Uninstall

### Auto

1. Click on `Uninstall.bat` file.

### Manual

1. Delete the `Launch_DARK.bat` _shortcut_ from the location which opens in **step-3** of **_Install_**.
1. Restart the Computer.

## 🧋 Contribution

Pull requests, issue reports and suggestions are welcome 😊 !

## :clap: A Big Thanks To

### Stargazers

[![Stargazers repo roster for @JustABeginning/Windows-DARK](https://reporoster.com/stars/JustABeginning/Windows-DARK)](https://github.com/JustABeginning/Windows-DARK/stargazers)
