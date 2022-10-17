$folderPath = '.\intel'

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