# Static check of agent/mimama.md. ASCII only (PowerShell 5.1).
param([switch]$SkipDeployed)
$ErrorActionPreference = 'Stop'
$repo = Split-Path -Parent $PSScriptRoot
$src = Join-Path $repo 'agent\mimama.md'
$fail = 0
function Bad($m) { Write-Output "FAIL: $m"; $script:fail++ }

$bytes = [System.IO.File]::ReadAllBytes($src)
if ($bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF) { Bad 'BOM found' }
if ($bytes -contains 13) { Bad 'CR found (LF only)' }

$text = [System.Text.Encoding]::UTF8.GetString($bytes)
if ($text -notmatch '(?s)^---\r?\nname: mimama\r?\ndescription: .+?\r?\ntools: .+?\r?\n---') { Bad 'frontmatter (name/description/tools)' }

$m = [regex]::Match($text, 'Version (\d+\.\d+\.\d+)')
if (-not $m.Success) { Bad 'version missing' }
else {
    $ver = $m.Groups[1].Value
    $cl = Get-Content (Join-Path $repo 'CHANGELOG.md') -Raw
    if ($cl -notmatch [regex]::Escape("## $ver")) { Bad "CHANGELOG has no entry for $ver" }
    Write-Output "version: $ver"
}

foreach ($s in 'IDENTIT', 'SCHRITT 0 ', 'SCHRITT 0.5', 'EBENEN-MODELL', 'OPERATOREN', 'CROSS-FLOW', 'KRITERIEN', 'BETRIEBSMODI', 'OUTPUT-STRUKTUR', 'VERHALTENSREGELN', 'FALSIFIZIERBARKEIT') {
    if ($text -notmatch [regex]::Escape($s)) { Bad "section missing: $s" }
}

if (-not $SkipDeployed) {
    $dst = Join-Path $env:USERPROFILE '.claude\agents\mimama.md'
    if (-not (Test-Path $dst)) { Write-Output 'note: not deployed' }
    elseif ((Get-FileHash $dst).Hash -ne (Get-FileHash $src).Hash) { Write-Output 'note: deployed copy differs (CRLF or older); run deploy.ps1' }
    else { Write-Output 'deployed copy identical' }
}

if ($fail -gt 0) { Write-Output "check failed: $fail"; exit 1 }
Write-Output 'check ok'
exit 0
