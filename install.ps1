$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$Dest = Join-Path $HOME ".claude\skills"

New-Item -ItemType Directory -Force -Path $Dest | Out-Null

Write-Output "Installing claude-work-efficient skills into $Dest"
Write-Output ""

Get-ChildItem -Path (Join-Path $ScriptDir "skills") -Directory | ForEach-Object {
    $name = $_.Name
    $target = Join-Path $Dest $name
    if (Test-Path $target) {
        Write-Output "SKIP (already installed): $name"
    } else {
        Copy-Item -Recurse -Path $_.FullName -Destination $target
        Write-Output "INSTALLED: $name"
    }
}

Write-Output ""
Write-Output "Done. Restart Claude Code (or start a new session) so it picks up the new skills."
Write-Output "Then say: usa work-efficient"
Write-Output ""
Write-Output "Optional (21st.dev component catalog, installed as a plugin, not bundled here):"
Write-Output "  claude plugin marketplace add 21st-dev/claude-code-plugin"
Write-Output "  claude plugin install 21st@21st"
