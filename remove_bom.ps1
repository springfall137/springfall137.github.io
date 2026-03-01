$path = "c:\Users\user\Downloads\springfall137.github.io-main\index.html"

# Read file content (auto-detect encoding)
$content = [System.IO.File]::ReadAllText($path)

# Create UTF-8 encoding without BOM
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

# Write content back to file using UTF-8 without BOM
[System.IO.File]::WriteAllText($path, $content, $utf8NoBom)

Write-Host "Successfully converted index.html to UTF-8 without BOM"
