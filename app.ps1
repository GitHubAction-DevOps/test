param ($pool_name, $app_name)

#check if the app pool exists
Reset-IISServerManager -Confirm:$false

if ((Get-IISAppPool).name -eq $pool_name )
{
    echo "POOL exist"
}
else {
    New-WebAppPool -Name $pool_name -Force
}

#cjeck site exists
Reset-IISServerManager -Confirm:$false
if ((Get-IISSite).name -eq $app_name)
{
    echo "SITE exist"
}

else {
    New-Website -Name $app_name -ApplicationPool $pool_name -Force -Port 8083
}
