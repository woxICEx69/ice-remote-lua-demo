$ErrorActionPreference = 'Stop'
$repo = 'woxICEx69/ice-remote-lua-demo'
$base = "https://raw.githubusercontent.com/$repo/main"
$target = Join-Path $PSScriptRoot 'downloads'
New-Item -ItemType Directory -Force -Path $target | Out-Null
$manifestFile = Join-Path $target 'manifest.json'
$luaFile = Join-Path $target '2.lua'
$healthFile = Join-Path $target 'health.json'
Write-Host 'ICE GitHub demo: downloading public static files'
& curl.exe -fL --retry 2 -sS "$base/health.json" -o $healthFile
if ($LASTEXITCODE -ne 0) { throw 'Could not download health.json. Verify repo is public and branch main exists.' }
& curl.exe -fL --retry 2 -sS "$base/manifest.json" -o $manifestFile
if ($LASTEXITCODE -ne 0) { throw 'Could not download manifest.json.' }
& curl.exe -fL --retry 2 -sS "$base/2.lua" -o $luaFile
if ($LASTEXITCODE -ne 0) { throw 'Could not download 2.lua.' }
$manifest = Get-Content -Raw -Encoding UTF8 $manifestFile | ConvertFrom-Json
$actualHash = (Get-FileHash -Algorithm SHA256 $luaFile).Hash.ToLowerInvariant()
$actualSize = (Get-Item $luaFile).Length
if ($actualSize -ne $manifest.bytes -or $actualHash -ne $manifest.sha256) {
    throw "Verification failed. Expected $($manifest.bytes) bytes and $($manifest.sha256); got $actualSize and $actualHash."
}
Write-Host 'SUCCESS: Static Lua file downloaded and matched manifest.' -ForegroundColor Green
Write-Host "Path: $luaFile"
Write-Host 'Lua was NOT executed. Download test completed.'
