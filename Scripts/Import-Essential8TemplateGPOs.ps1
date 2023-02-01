<#
    .SYNOPSIS
    Import Essential 8 Template Group Policy Objects

    .DESCRIPTION
    Import E8 GPOs into Active Directory. The Group Policy Objects include recommended settings based on Microsoft and the Australian Cyber Security Centre's Essential 8 controls.

    .PARAMETER
  
    .EXAMPLE
    PS C:\> importE8GPOs.ps1        
  
    .NOTES  
    Digital Government (DGov) - Cyber Security Unit
#>

<#PSScriptInfo

    .VERSION 1.0

    .GUID 89fbfa32-b05c-4986-99c5-f86188e4f4e6

    .AUTHOR 
    Cyber Security Unit - Office of Digital Government (DGOV) 
    cybersecurity@dpc.wa.gov.au
    
    .COMPANYNAME 
    Department of the Premier and Cabinet of Western Australia
#>

#Requires -RunAsAdministrator
#Requires -Modules GroupPolicy

#########################
#                       #
#      Functions        #
#                       #
#########################


function ShowImportGPOMenu
{
   param (
      [string]$Title = ' Essential 8 Templates GPO Import Menu '
   )
   Clear-Host 
   Write-host "`r`n"
   Write-Host "=============================$Title=============================="
   Write-host "`r`n"
   Write-Host "1: Press '1' to import: Configure Microsoft Office Macro Settings Templates"
   Write-Host "2: Press '2' to import: User Application Hardening Templates"
   Write-Host "a: Press 'a' to import: All E8 GPOs."
   Write-Host "q: Press 'q' to quit."
   Write-host "`r`n"
}


#########################
#                       #
#     Script Start      #
#                       #
#########################

Import-Module GroupPolicy -ErrorAction Stop

#path to Essential 8 GPO backup files used for import
$currentPath = Split-Path $pwd -Parent
$gpoPath = "$currentPath\GPOs"
$availableGPOs = Get-ChildItem -Path $gpoPath -Directory | Select Name


#E8 GPO import menu to import individual GPOs or all
do
   {
      ShowImportGPOMenu
      $selection = Read-Host "Please make a selection"
      switch ($selection)
          {
             '1' {
                    Write-Output "Importing Group Policy Objects - Configure MS Office Macro Settings..."
                    $availableGPOs.Name | Where-Object {$_ -match "MS Office Macro"} | ForEach-Object { Write-Output " - Importing GPO: $_"; Import-GPO -BackupGpoName $_ -Path (Join-Path -Path $gpoPath -ChildPath $_) -CreateIfNeeded -TargetName $_;}
                    Write-Output "`r`n`r`nImport complete`r`n"
                    Pause

                 }

             '2' {
                    Write-Output "Importing Group Policy Objects - User Application Hardening..."
                    $availableGPOs.Name | Where-Object {$_ -match "User Application Hardening"} | ForEach-Object { Write-Output " - Importing GPO: $_"; Import-GPO -BackupGpoName $_ -Path (Join-Path -Path $gpoPath -ChildPath $_) -CreateIfNeeded -TargetName $_;}
                    Write-Output "`r`n`r`nImport complete`r`n"
                    Pause
                 }

             'a' {
                    Write-Output "Importing all GPO Policies..."
                    $availableGPOs.Name | ForEach-Object { Write-Output " - Importing GPO: $_"; Import-GPO -BackupGpoName $_ -Path (Join-Path -Path $gpoPath -ChildPath $_) -CreateIfNeeded -TargetName $_;}
                    Write-Output "`r`n`r`nImport complete`r`n"
                    Pause
                 }
            }
}
until ($selection -eq 'q')



