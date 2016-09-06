echo "INSTALLING CHROME"

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
$target_dir = "${env:ProgramFiles(x86)}\Google\Chrome\Application"
robocopy "$parent_dir" "$target_dir" master_preferences >> "$env:temp\robo_log.txt"
echo "- master_preferences file copied"

Start-Process -FilePath "$parent_dir\ChromeStandaloneSetup64.exe" -ArgumentList '/silent','/install' -Wait

echo "CHROME DONE"
echo "------------------------------------------------------------------------------"
