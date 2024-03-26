# FirstRepo

# Extracter

# Define the folder path to search
$folderPath = "C:\Users\pravi\work\projects\java-app"

# Define the search pattern
$searchPattern = "com."

# Function to recursively search through folders and subfolders
function Search-Files {
    param (
        [Parameter(Mandatory=$true)]
        [string]$FolderPath,
        
        [Parameter(Mandatory=$true)]
        [string]$SearchPattern
    )

    # Get all files in the folder
    $files = Get-ChildItem -Path $FolderPath -File -Recurse -Filter "*.java"

    foreach ($file in $files) {
        # Read each line of the file
        $lines = Get-Content -Path $file.FullName
        foreach ($line in $lines) {
            # Check if the line matches the search pattern
            if ($line -match $SearchPattern) {
		$relativePath = $file.FullName.Replace($FolderPath, "")
                Write-Host "$line\:$relativePath"
            }
        }
    }
}

# Call the function to search for files matching the pattern
Search-Files -FolderPath $folderPath -SearchPattern $searchPattern

# Runner
# powershell -ExecutionPolicy Bypass -File .\extracter.ps1

