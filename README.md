# SE.IntroModule

[![Build status](https://ci.appveyor.com/api/projects/status/tlxsb0j6v9jdhq0s?svg=true)](https://ci.appveyor.com/project/iricigor/se-intromodule)
[![latest version](https://img.shields.io/powershellgallery/v/SE.IntroModule.svg?label=latest+version)](https://www.powershellgallery.com/packages/SE.IntroModule)
[![downloads](https://img.shields.io/powershellgallery/dt/SE.IntroModule.svg?label=downloads)](https://www.powershellgallery.com/pagitckages/SE.IntroModule)

## Introduction

This is PowerShell introduction module. It explains advanced functions and CI/CD integrations.

## How to install

You can install this module from PowerShell Gallery (preferred way) or by cloning GitHub repository.
Module is tested both on Windows PowerShell and PowerShell Core.

### From PSGallery

```PowerShell
Find-Module SE.IntroModule -Repository PSGallery | Install-Module -Scope CurrentUser -Force
```

### From GitHub

```PowerShell
git clone https://github.com/iricigor/SE.IntroModule.git      # Clone this repository
Import-Module .\EasyAzureFunction\SE.IntroModule.psd1 -Force  # Import module
```

## How to use

Here are two commands for quick start with this module:

```PowerShell
Get-Command -Module SE.IntroModule # for list of all commands
Get-Command -Module SE.IntroModule | Get-Help | Select Name, Synopsis # for explanation on all commands
```

## Examples

For list of examples, run

```PowerShell
Get-Help Get-Square -Examples
Get-Help Get-Cube -Examples
```
