# https://www.google.com/intl/sk/chrome/browser/desktop/index.html?standalone=1
# https://chromereleases.googleblog.com/search/label/Stable%20updates

echo 'CHROME v75 (2019-06-29)'

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
$target_dir = "${env:ProgramFiles(x86)}\Google\Chrome\Application"

echo ' - placing master_preferences file'
robocopy $parent_dir $target_dir master_preferences >> "$env:temp\robo_log.txt"

echo ' - installation in progress ...'
Start-Process -FilePath "$parent_dir\ChromeStandaloneSetup64.exe" -ArgumentList '/silent','/install' -Wait

echo 'CHROME DONE'
echo '------------------------------------------------------------------------------'
