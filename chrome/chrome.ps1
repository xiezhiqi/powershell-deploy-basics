echo "INSTALLING CHROME v57.0.2986.0 (2017-01-19)"
# https://www.google.com/intl/sk/chrome/browser/desktop/index.html?standalone=1
# https://googlechromereleases.blogspot.com/

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
$target_dir = "${env:ProgramFiles(x86)}\Google\Chrome\Application"
robocopy "$parent_dir" "$target_dir" master_preferences >> "$env:temp\robo_log.txt"
echo "- master_preferences file copied"

Start-Process -FilePath "$parent_dir\ChromeStandaloneSetup64.exe" -ArgumentList '/silent','/install' -Wait

echo "CHROME DONE"
echo "------------------------------------------------------------------------------"
