# http://aimp.ru/index.php?do=download

echo 'AIMP v4.51 build 2084 (2018-12-01)'

$parent_dir = Split-Path $MyInvocation.MyCommand.Path

echo ' - installation in progress ...'
Start-Process -FilePath "$parent_dir\aimp_4.51.2084.exe" -ArgumentList '/silent','/auto' -Wait

echo ' - copying config files'
$target_dir = "$env:APPDATA\AIMP"
robocopy $parent_dir $target_dir AIMP.ini >> "$env:temp\robo_log.txt"
robocopy $parent_dir "$target_dir\Skins" Default.ini >> "$env:temp\robo_log.txt"
robocopy "$parent_dir\PLS" "$target_dir\PLS" /E >> "$env:temp\robo_log.txt"

echo ' - removing desktop link'
Remove-Item 'C:\Users\Public\Desktop\AIMP.lnk' -ErrorAction SilentlyContinue

echo 'AIMP DONE'
echo '------------------------------------------------------------------------------'


