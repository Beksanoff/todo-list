$version = "20.2.0"
$url = "https://static.realm.io/downloads/dart/$version/android.tar.gz"
$destDir = "C:\Users\amira\AppData\Local\Pub\Cache\hosted\pub.dev\realm-$version\android\src\main\cpp\lib"
$tempFile = "$env:TEMP\realm_android.tar.gz"

Write-Host "Downloading binaries from $url to $tempFile - ignoring SSL..."

# C# Injection to trust all certs (Works in older PowerShell/Windows)
add-type @"
    using System.Net;
    using System.Security.Cryptography.X509Certificates;
    public class TrustAll : ICertificatePolicy {
        public bool CheckValidationResult(ServicePoint srvPoint, X509Certificate certificate, WebRequest request, int certificateProblem) {
            return true;
        }
    }
"@
[System.Net.ServicePointManager]::CertificatePolicy = New-Object TrustAll

try {
    Invoke-WebRequest -Uri $url -OutFile $tempFile
    Write-Host "Download complete."
} catch {
    Write-Error "Download failed: $_"
    exit 1
}

Write-Host "Ensuring destination directory exists: $destDir"
if (!(Test-Path $destDir)) {
    New-Item -ItemType Directory -Force -Path $destDir | Out-Null
}

Write-Host "Extracting archive..."
# Using tar (built-in on Windows 10+)
try {
    tar -xf $tempFile -C $destDir
    Write-Host "Extraction complete."
} catch {
    Write-Error "Extraction failed. Ensure tar is in path."
    exit 1
}

Write-Host "Writing realm_version.txt..."
$version | Out-File -FilePath "$destDir\realm_version.txt" -NoNewline -Encoding ASCII

Write-Host "SUCCESS: Realm binaries installed manually."
