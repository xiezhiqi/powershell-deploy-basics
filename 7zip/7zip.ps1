echo "INSTALLING 7ZIP"

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
Start-Process -FilePath "$parent_dir\7z1602-x64.msi" -ArgumentList "/q","INSTALLDIR=`"${env:ProgramFiles}\7-Zip`"","/norestart","TRANSFORMS=associations.mst" -Wait

$registry_path = "HKCU:\Software\7-Zip\Options"

If (!(Test-Path $registry_path)) {
    New-Item -Path $registry_path -Force | Out-Null
}

New-ItemProperty -Path "HKCU:\Software\7-Zip\Options" -name CascadedMenu -Value 0 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path "HKCU:\Software\7-Zip\Options" -name ContextMenu -Value 4100 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path "HKCU:\Software\7-Zip\Options" -name ElimDupExtract -Value 1 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path "HKCU:\Software\7-Zip\Options" -name MenuIcons -Value 1 -PropertyType DWORD -Force | Out-Null
echo "- registry settings changed"

echo "7ZIP DONE"
echo "------------------------------------------------------------------------------"
