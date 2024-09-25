import-Module AWS.Tools.S3

$region = "us-east-1"
$bucketName = Read-Host -Prompt 'Enter the S3 bucket name'

Write-Host "AWS Region: $region"
Write-Host "S3 Bucket: $bucketName"

# create function which validate if the bucket is already created or not, if created then add the file and content to it.
# if bucket is not created then, prompt msg to create a bucket first.
function BucketExists {
    $bucket = Get-S3Bucket -BucketName $bucketName -ErrorAction SilentlyContinue
    return $null -ne $bucket
         
}

if (-not (BucketExists)){
    Write-Host "Bucket does not exists..."
    New-S3Bucket -BucketName $bucketName -Region $region
} else {
    
    Write-Host "Bucket already exists..."
}

# create a new file

$filename = 'myfile.txt'
$filecontent = 'hello world!'

Set-Content -Path $filename -Value $filecontent

Write-S3Object -BucketName $bucketName -File $filename -Key $filename