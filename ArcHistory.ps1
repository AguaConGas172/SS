if (Test-Path "HKCU:\SOFTWARE\WinRAR\ArcHistory") {
    (Get-ItemProperty -Path "HKCU:\SOFTWARE\WinRAR\ArcHistory").PSObject.Properties | Where-Object { $_.Name -match "^\d+$" } | ForEach-Object {
        $file = $_.Value
        [PSCustomObject]@{ 'File' = $file; 'LastAccessTime' = if (Test-Path $file) { (Get-Item $file).LastAccessTime } else { "Deleted" } }
    } | Out-GridView -Title "Winrar History"
}
