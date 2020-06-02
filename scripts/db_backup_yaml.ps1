import-module powershell-yaml

[string[]]$fileContent = Get-Content "..\configuration\parameters.yaml"

$content = ''

foreach ($line in $fileContent) { $content = $content + "`n" + $line }
$yaml = ConvertFrom-YAML $content

$file_name = $yaml.file_details.backup_file_name.Split(".")

$current_time = Get-Date -Format "ddMMyyyy_HHmmss"

$file_name = "$($file_name[0])_$($current_time).bak"

$backup_file = Join-Path $yaml.file_details.backup_file_location $file_name


try{

Backup-SqlDatabase -ServerInstance $yaml.server_details.server_name -Database $yaml.server_details.database_name -BackupFile $backup_file

Write-Output "Backup file stored in $($backup_file) successfully."
}	

catch{
  Write-Host "An error occurred:"
  Write-Host $_
}
