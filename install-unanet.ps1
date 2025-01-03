# Define the URL and the destination path
$url = "https://envision.unanetae.biz/infocus/install/Setup.exe"
$destination = "$env:TEMP\Setup.exe"

# Download the file
Invoke-WebRequest -Uri $url -OutFile $destination

# Install the downloaded file
Start-Process -FilePath $destination -ArgumentList "/S" -Wait

# Clean up the downloaded file
Remove-Item -Path $destination
