import-Module AWS.Tools.S3

$region = "us-east-1"
$bucketName = Read-Host -Prompt 'Enter the S3 bucket name'

Write-Host "AWS Region: $region"
Write-Host "S3 Bucket: $bucketName"

function BucketExists {
    $bucket = Get-S3Bucket -BucketName $bucketName -ErrorAction SilentlyContinue
    return $null -ne $bucket
         
}

if (-not (BucketExists)){
    Write-Host "Bucket does not exists..."
    
} else {
    
    Write-Host "Deleting bucket..."
    Remove-S3Object -BucketName $bucketName -Region $region
}
