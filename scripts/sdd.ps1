param(
    [Parameter(Position = 0)]
    [ValidateSet("init", "new", "status", "verify", "archive")]
    [string]$Command = "status",

    [Parameter(Position = 1)]
    [string]$Name,

    [switch]$Force
)

$ErrorActionPreference = "Stop"

function Get-Root {
    $current = Get-Location
    while ($current) {
        if (Test-Path (Join-Path $current "sdd-plus")) {
            return $current.Path
        }

        $parent = Split-Path $current -Parent
        if (-not $parent -or $parent -eq $current.Path) {
            break
        }

        $current = Get-Item $parent
    }

    return (Get-Location).Path
}

function Assert-KebabName([string]$Value) {
    if (-not $Value) {
        throw "Change name is required."
    }

    if ($Value -notmatch "^[a-z0-9]+(-[a-z0-9]+)*$") {
        throw "Change name must be kebab-case, e.g. improve-search-flow."
    }
}

function Ensure-Directories([string]$Root) {
    @(
        "sdd-plus",
        "sdd-plus\standards",
        "sdd-plus\specs",
        "sdd-plus\changes",
        "sdd-plus\archive",
        "sdd-plus\templates"
    ) | ForEach-Object {
        New-Item -ItemType Directory -Force -Path (Join-Path $Root $_) | Out-Null
    }
}

function Render-Template([string]$TemplatePath, [string]$TargetPath, [string]$ChangeName) {
    $content = Get-Content -Raw -Path $TemplatePath
    $content = $content.Replace("{{CHANGE_NAME}}", $ChangeName)
    $content = $content.Replace("{{DATE}}", (Get-Date -Format "yyyy-MM-dd"))
    Set-Content -Path $TargetPath -Value $content -Encoding UTF8 -NoNewline
}

function New-Change([string]$Root, [string]$ChangeName) {
    Assert-KebabName $ChangeName
    Ensure-Directories $Root

    $changeDir = Join-Path $Root "sdd-plus\changes\$ChangeName"
    if (Test-Path $changeDir) {
        throw "Change already exists: sdd-plus\changes\$ChangeName"
    }

    New-Item -ItemType Directory -Force -Path $changeDir | Out-Null
    $templateDir = Join-Path $Root "sdd-plus\templates"

    $files = @("brief.md", "plan.md", "tasks.md", "decision-log.md", "verification.md")
    foreach ($file in $files) {
        $templatePath = Join-Path $templateDir $file
        $targetPath = Join-Path $changeDir $file
        if (Test-Path $templatePath) {
            Render-Template $templatePath $targetPath $ChangeName
        } else {
            Set-Content -Path $targetPath -Value "# $file`n`nChange: $ChangeName`n" -Encoding UTF8 -NoNewline
        }
    }

    Write-Host "Created change: sdd-plus\changes\$ChangeName"
}

function Get-TaskCounts([string]$TasksPath) {
    if (-not (Test-Path $TasksPath)) {
        return @{ Complete = 0; Pending = 0 }
    }

    $content = Get-Content -Path $TasksPath
    $complete = ($content | Where-Object { $_ -match "^\s*-\s*\[[xX]\]\s+" }).Count
    $pending = ($content | Where-Object { $_ -match "^\s*-\s*\[\s\]\s+" }).Count
    return @{ Complete = $complete; Pending = $pending }
}

function Show-Status([string]$Root) {
    Ensure-Directories $Root

    $changesRoot = Join-Path $Root "sdd-plus\changes"
    $changes = Get-ChildItem -Path $changesRoot -Directory | Sort-Object Name

    if (-not $changes) {
        Write-Host "No active SDD+ changes."
        return
    }

    foreach ($change in $changes) {
        $tasks = Get-TaskCounts (Join-Path $change.FullName "tasks.md")
        Write-Host "$($change.Name): $($tasks.Complete) complete, $($tasks.Pending) pending"
    }
}

function Verify-Change([string]$Root, [string]$ChangeName) {
    Assert-KebabName $ChangeName
    Ensure-Directories $Root

    $changeDir = Join-Path $Root "sdd-plus\changes\$ChangeName"
    if (-not (Test-Path $changeDir)) {
        throw "Change not found: sdd-plus\changes\$ChangeName"
    }

    $required = @("brief.md", "plan.md", "tasks.md", "decision-log.md", "verification.md")
    $missing = @()
    foreach ($file in $required) {
        if (-not (Test-Path (Join-Path $changeDir $file))) {
            $missing += $file
        }
    }

    $standardsDir = Join-Path $Root "sdd-plus\standards"
    $standards = Get-ChildItem -Path $standardsDir -File -ErrorAction SilentlyContinue
    if (-not $standards) {
        throw "No standards found under sdd-plus\standards."
    }

    if ($missing.Count -gt 0) {
        throw "Missing required artifacts: $($missing -join ', ')"
    }

    $tasks = Get-TaskCounts (Join-Path $changeDir "tasks.md")
    Write-Host "Verified artifacts for $ChangeName."
    Write-Host "Tasks: $($tasks.Complete) complete, $($tasks.Pending) pending."

    if ($tasks.Pending -gt 0) {
        Write-Host "Pending tasks remain. Archive will require -Force."
    }
}

function Archive-Change([string]$Root, [string]$ChangeName, [bool]$AllowPending) {
    Verify-Change $Root $ChangeName

    $changeDir = Join-Path $Root "sdd-plus\changes\$ChangeName"
    $tasks = Get-TaskCounts (Join-Path $changeDir "tasks.md")
    if ($tasks.Pending -gt 0 -and -not $AllowPending) {
        throw "Cannot archive with pending tasks. Complete tasks or rerun with -Force."
    }

    $archiveRoot = Join-Path $Root "sdd-plus\archive"
    New-Item -ItemType Directory -Force -Path $archiveRoot | Out-Null

    $targetName = "$(Get-Date -Format 'yyyy-MM-dd')-$ChangeName"
    $target = Join-Path $archiveRoot $targetName

    if (Test-Path $target) {
        throw "Archive already exists: sdd-plus\archive\$targetName"
    }

    Move-Item -Path $changeDir -Destination $target
    Write-Host "Archived change: sdd-plus\archive\$targetName"
}

$root = Get-Root

switch ($Command) {
    "init" {
        Ensure-Directories $root
        Write-Host "Initialized SDD+ directories under $root"
    }
    "new" {
        New-Change $root $Name
    }
    "status" {
        Show-Status $root
    }
    "verify" {
        Verify-Change $root $Name
    }
    "archive" {
        Archive-Change $root $Name $Force.IsPresent
    }
}
