$files = Get-ChildItem -Path C:\Users\mcaliman\github\mcaliman.github.io\_posts -Filter *.md -Recurse
foreach ($f in $files) {
    if ($f.FullName -match "vendor") { continue }
    $lines = [System.IO.File]::ReadAllLines($f.FullName)
    
    $folder = $f.Directory.Name
    $title = ""
    # Extract title from frontmatter
    $fmEnd = -1
    for ($i = 1; $i -lt $lines.Count; $i++) {
        if ($lines[$i] -match "^---$") {
            $fmEnd = $i
            break
        }
        if ($lines[$i] -match "^title:\s*(.*)") {
            $title = $matches[1] -replace '["'']',''
        }
    }
    
    if ($fmEnd -le 0) { continue } # No valid frontmatter

    $title = $title.ToLower()

    $tags = @()
    switch ($folder) {
        "clojure" { $tags += "clojure", "programming" }
        "datascience" { $tags += "data-science", "analytics" }
        "git" { $tags += "git", "vcs" }
        "github" { $tags += "github", "pages" }
        "java" { 
            $tags += "java"
            if ($title -match "jsf") { $tags += "jsf" }
            elseif ($title -match "jakarta") { $tags += "jakarta-ee" }
            elseif ($title -match "secure|sicure|authentication|login") { $tags += "security" }
            elseif ($title -match "oop|object|class|method|inheritance|this") { $tags += "oop" }
            elseif ($title -match "spring") { $tags += "spring" }
            elseif ($title -match "time|date|chrono") { $tags += "date-time" }
            else { $tags += "tutorial" }
        }
        "javascript" { $tags += "javascript", "web" }
        "jekyll" { $tags += "jekyll", "blog" }
        "linux" { 
            $tags += "linux" 
            if ($title -match "ubuntu") { $tags += "ubuntu" }
            elseif ($title -match "debian") { $tags += "debian" }
            else { $tags += "sysadmin" }
        }
        "miscellaneous" {
            if ($title -match "data|database") { $tags += "data", "database" }
            elseif ($title -match "docebo") { $tags += "docebo", "lms" }
            else { $tags += "misc", "architecture" }
        }
        "mysql" { $tags += "mysql", "database" }
        "programming" {
            if ($title -match "tree|list|stack|queue|search|generic") { $tags += "data-structures", "algorithms" }
            elseif ($title -match "pattern|strategy|singleton|responsibility|interpreter|visitor|state") { $tags += "design-patterns", "architecture" }
            elseif ($title -match "language|alphabet|normal|chomsky|greibach|pumping|context-free|pda|cfg|turing") { $tags += "computer-science", "theory" }
            elseif ($title -match "machine learning|artificial intelligence|expert|prolog|inference") { $tags += "ai", "machine-learning" }
            else { $tags += "programming", "theory" }
        }
        "python" { $tags += "python", "scripting" }
        "r" { $tags += "r", "data-analysis" }
        default { $tags += $folder, "tutorial" }
    }
    
    if ($tags.Count -gt 2) { $tags = $tags[0..1] }
    $tagsStr = "tags: [" + ($tags -join ", ") + "]"
    
    $newLines = @()
    $newLines += $lines[0] # ---
    $skip = $false
    for ($i = 1; $i -lt $fmEnd; $i++) {
        $l = $lines[$i]
        if ($l -match "^\s*tags:\s*") {
            $skip = $true
            continue
        }
        if ($skip -and $l -match "^\s+-\s+") {
            # it's an array element of tags
            continue
        }
        # If it doesn't match a list element but we were skipping, we stop skipping
        if ($skip -and $l -notmatch "^\s+-\s+") {
            $skip = $false
        }
        
        if (-not $skip) {
            $newLines += $l
        }
    }
    $newLines += $tagsStr
    for ($i = $fmEnd; $i -lt $lines.Count; $i++) {
        $newLines += $lines[$i]
    }
    
    [System.IO.File]::WriteAllLines($f.FullName, $newLines, [System.Text.Encoding]::UTF8)
}
Write-Output "Done tagging."
