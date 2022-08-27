$url = 'https://github.com/JGRennison/OpenTTD-patches/releases/latest'
$request = [System.Net.WebRequest]::Create($url)
$response = $request.GetResponse()
$realTagUrl = $response.ResponseUri.OriginalString
$version = $realTagUrl.split('/')[-1].Trim('v')
$version
$fileName = "openttd-$version-windows-win64.zip"
if (-not(Test-Path -Path "openttd-$version-windows-win64")){
    Write-Host "it woring :3"
    Start-Sleep -Seconds 1.5
    $realDownloadUrl = $realTagUrl.Replace('tag', 'download') + '/' + $fileName
    $realDownloadUrl
    Invoke-WebRequest $realDownloadUrl -outfile .\$fileName
    Expand-Archive .\$fileName -DestinationPath .\


}

else {
    Write-Host "you already have the latest version :>"
    Start-Sleep -Seconds 1.5
}



