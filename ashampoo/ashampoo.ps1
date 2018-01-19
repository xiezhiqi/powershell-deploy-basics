echo "ASHAMPOO v6.84 (2013-05-29)"
# do not go to higher version

$parent_dir = Split-Path $MyInvocation.MyCommand.Path

echo " - installation in progress ..."
Start-Process -FilePath "$parent_dir\ashampoo_burning_studio_6_free_6.84_13471.exe" -ArgumentList "/VERYSILENT","/NORESTART","/SUPPRESSMSGBOXES"

echo " - waiting for ashampoo to start"
$val = 120
Do {
    $running = Get-Process "burningstudio" -ErrorAction SilentlyContinue
    Start-Sleep -s 1
    $val--
    if ($val -eq 0) {break}
} while ($running -eq $null)

Start-Sleep -s 12
kill -processname "burningstudio" -ErrorAction SilentlyContinue

echo " - changing setting in registry"
Set-ItemProperty -Path "HKCU:\Software\Ashampoo\Ashampoo Burning Studio 6\ash_inet" -name InfoChannel_ashnews_Enabled -Value 0
Set-ItemProperty -Path "HKCU:\Software\Ashampoo\Ashampoo Burning Studio 6\ash_inet" -name InfoChannel_-updates-_Enabled -Value 0

echo " - uninstalling your software deals"
$unins = "C:\ProgramData\Ashampoo\unins000.exe"
If (Test-Path $unins){
    Start-Process -FilePath $unins -ArgumentList "/verysilent /norestart" -Wait
}

echo " - removing desktop icons"
Remove-Item "C:\Users\Public\Desktop\Your Software Deals.url" -ErrorAction SilentlyContinue
Remove-Item "C:\Users\Public\Desktop\Ashampoo Burning Studio 6 FREE.lnk" -ErrorAction SilentlyContinue

echo "ASHAMPOO DONE"
echo "------------------------------------------------------------------------------"
