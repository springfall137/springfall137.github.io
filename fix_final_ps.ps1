$path = "c:\Users\user\Downloads\springfall137.github.io-main\index.html"
$fragPath = "c:\Users\user\Downloads\springfall137.github.io-main\fragment.html"

$lines = [System.Collections.Generic.List[string]]([System.IO.File]::ReadAllLines($path, [System.Text.Encoding]::UTF8))

# 1. Fix R&E
for ($i=0; $i -lt $lines.Count; $i++) {
    if ($lines[$i] -match "R&E at Informatics Student Group") {
        $lines[$i] = $lines[$i].Replace("R&E at Informatics Student Group", "R&E at Physics Student Group")
    }
}

# 2. Replace Experience & Awards Block
$startIdx = -1
$nextSectionStart = -1

for ($i=0; $i -lt $lines.Count; $i++) {
    if ($lines[$i] -match "<h3>Experience</h3>") {
        $startIdx = $i
        break
    }
}

for ($i=$startIdx+1; $i -lt $lines.Count; $i++) {
    if ($lines[$i] -match '<div class="container') {
        $nextSectionStart = $i
        break
    }
}

if ($startIdx -ne -1 -and $nextSectionStart -ne -1) {
    $removeCount = $nextSectionStart - $startIdx
    if ($removeCount -gt 0) {
        $lines.RemoveRange($startIdx, $removeCount)
    }
    
    $newContent = [System.IO.File]::ReadAllLines($fragPath, [System.Text.Encoding]::UTF8)
    
    # Insert fragment
    $lines.InsertRange($startIdx, $newContent)
    
    # Add closing container div (fragment only closes row)
    $lines.Insert($startIdx + $newContent.Count, "</div> <!-- Close Main Container (Exp/Awards) -->")
}

# Save with UTF-8 No BOM
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllLines($path, $lines, $utf8NoBom)
