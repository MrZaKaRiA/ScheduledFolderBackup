$sourceFolder = "C:\SourceFolder"
$destinationFolder = "C:\DestinationFolder"

$date = Get-Date -Format "yyyy-MM-dd HH-mm-ss"
$newFolder = Join-Path $destinationFolder $date

New-Item -ItemType Directory -Force -Path $newFolder

Copy-Item -Path $sourceFolder\* -Destination $newFolder -Recurse -Force
