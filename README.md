# Database backup automation

PowerShell script to take database backup.

## How to run?

- Add configuration in parameters.yaml
	
	+ In configuration folder,
	
```yaml
server_details:
  server_name: <SERVER NAME>
  database_name: <DATABASE NAME>
file_details:
  backup_file_location: <BACKUP FOLDER>
  backup_file_name: <BACKUP FILE> 
```

- Install dependencies

	Used powershell-yaml module to read yaml file. Install this module in your machine.
	
- Execute the script

	+ In script folder, execute this ***db\_backup_yaml.ps1***

## Details

- Backup file name will have timestamp.

- Windows authentication mode is used.
