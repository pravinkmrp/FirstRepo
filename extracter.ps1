# FirstRepo

# Extracter
# Define the folder path to search
$folderPath = "C:\Users\1000034527\work\projects\graph-poc\MasterMonolithicJavaApp"

# Define the search pattern
$searchPattern = "^import\scom.application"
$trimmedsearchPattern = "import "

# $trimpackagepath = "com.application.petstore."

# Patterns
$ColorHash = @{}
$ColorHash.Add("Library","Blue")

# Function to recursively search through folders and subfolders
function Search-Files {
    param (
        [Parameter(Mandatory=$true)]
        [string]$FolderPath,
        
        [Parameter(Mandatory=$true)]
        [string]$SearchPattern
    )

    # Get all files in the folder
    $files = Get-ChildItem -Path $FolderPath -File -Recurse -Filter "*.java"  -exclude 'src\test'

    # Cleanup
    "class,packagename" | Out-file -FilePath "package_map.csv"
    "node1,node2" | Out-file -FilePath "class_dependency.csv"

    # Write-Host "Node1,Node2"
    foreach ($file in $files) {

        if ($file.FullName -match "src\\test\\") {
            continue
        }
        # Read each line of the file
        $lines = Get-Content -Path $file.FullName
        $trimmedfolderPath=($file.FullName -split 'src\\main\\java\\')[-1]
        Write-Host $trimmedfolderPath
        $trimmedPath = $trimmedfolderPath.Replace("\",".").Replace(".java","")
        $trimmedpackage=""
        foreach ($line in $lines) {
            # Check if the line matches the package
            if ($line -match "^package\scom") {
		        $trimmedpackage = $line.Replace("package ", "").Replace(";", "")
                "$trimmedPath,$trimmedpackage" | Out-file -FilePath "package_map.csv" -Append
            }
            # Check if the line matches the search pattern
            if ($line -match $SearchPattern) {
                $trimmedDeps = $line.Replace($trimmedsearchPattern, "").Replace(";", "")
                "$trimmedPath,$trimmedDeps"  | Out-file -FilePath "class_dependency.csv" -Append
            }
        }
    }
}

# Call the function to search for files matching the pattern
Search-Files -FolderPath $folderPath -SearchPattern $searchPattern

# Runner
# powershell -ExecutionPolicy Bypass -File .\extracter.ps1