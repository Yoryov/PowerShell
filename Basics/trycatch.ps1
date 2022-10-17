$folderPath = '.\intel'

# Handling Nonterminanting errors
# With a "Stop" Error Action

$files2 = Get-ChildItem -Path $folderPath -ErrorAction Stop
Write-Host "This shouldn't run"
$files2.foreach({
    $fileText = Get-Content $files2
    $fileText[0]
})


# Handling Terminating errors
# With the ""try/catch/finally" syntax
try {
    # initial code
    $files = Get-ChildItem -Path $folderPath -ErrorAction Stop
    $files.foreach({
        $fileText = Get-Content $files
        $fileText[0]
    })
}
catch {
    $_.Exception.Message
}