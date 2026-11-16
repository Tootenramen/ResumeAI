# Rebuild sites-bundle.js after editing anything in ..\sites
$root = Split-Path -Parent $PSScriptRoot
$o = [ordered]@{}
Get-ChildItem "$root\sites\*.html" | ForEach-Object { $o[$_.BaseName] = (Get-Content $_.FullName -Raw -Encoding UTF8) }
[IO.File]::WriteAllText("$root\sites-bundle.js", "window.SITES_SRC=" + ($o | ConvertTo-Json -Compress -Depth 3) + ";", (New-Object Text.UTF8Encoding $false))
