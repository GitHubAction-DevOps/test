param ($pool_name, $app_name)

#check if the app pool exists
if (!(Test-Path IIS:\AppPools\$pool_name ))
{
    #create the app pool
    New-WebAppPool -Name $pool_name -Force
}
else {
    echo "Pool exists"
}

#navigate to the sites root
# cd IIS:\Sites\

#check if the site exists
if ((Test-Path IIS:\Sites\$app_name ))
{
   New-Website -Name $app_name -ApplicationPool $pool_name -Port 8083
}
else {
    echo "site exists"
}
