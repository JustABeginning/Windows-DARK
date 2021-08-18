# Windows-DARK

<p align=left>
<a href="https://github.com/JustABeginning/Windows-DARK#JAB"><img src="https://img.shields.io/badge/platform-windows-blue" alt="Platform Support"></a>
<a href="https://github.com/JustABeginning/Windows-DARK#JAB"><img src="https://img.shields.io/badge/device-desktop%2C%20laptop-lightgrey" alt="Device Support"></a>
</p>

[![Language Used](https://img.shields.io/badge/language-Batch%20Script%2C%20VBScript-yellow)](https://github.com/JustABeginning/Windows-DARK.git#JAB)

A Windows based program that turns on/off DARK MODE based on custom time schedule

<p align=center>
<a href="https://github.com/JustABeginning/Windows-DARK#JAB"><img src="Dark_Mode.jpg" alt="Dark Mode Preview"></a>
</p>

<p align=center>
<a href="https://github.com/JustABeginning/Windows-DARK#JAB"><img src="Light_Mode.jpg" alt="Light Mode Preview"></a>
</p>

# Installation :

1. [Download](https://github.com/JustABeginning/Windows-DARK/releases) all the files and extract/save them in a folder (Give it any name) [All the files must be in the same folder].
2. Create a shortcut of `Launch_DARK.bat` file.
3. Press `Win+R` from keyboard or, open windows run menu, then type `shell:startup` and press enter.
4. Save the shortcut created in **step-2** in the location which opens in **step-3**.
5. Return back to the folder of **step-1** and click on `Launch_DARK.bat` file.

## Note :

+ This program requires that the system time is not set in 24 HR format, i.e., it is set in AM/PM format.
+ In order to set custom values, use `Custom_Time_Schedule.bat` file.

<p align=center>
<a href="https://github.com/JustABeginning/Windows-DARK#JAB"><img src="Custom_Schedule.jpg" alt="Set Custom Time Schedule"></a>
</p>

+ To skip the value of a parameter, press enter. This will accept the default/recently saved (if any) value for that parameter.
+ The DEFAULT VALUES are:
	+ Start HR - 05
	+ Start MIN - 00
	+ Start MODE - PM
	+ End HR - 06
	+ End MIN - 00
	+ End MODE - AM
	+ Snooze time - 1 minute

# Uninstallation :

1. Delete the `Launch_DARK.bat` *shortcut* from the location which opens in **step-3** of ***Installation***.
2. Restart the Computer.
