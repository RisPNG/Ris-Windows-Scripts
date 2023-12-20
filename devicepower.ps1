Get-WmiObject -Class "Win32_PnPEntity" | Where-Object {$_.ConfigManagerErrorCode -eq 0} | ForEach-Object { 
    $pnpID = $_.PNPDeviceID
    $friendlyName = $_.Name
    $powerMgmt = Get-CimInstance -ClassName MSPower_DeviceEnable -Namespace root\wmi | Where-Object {$_.InstanceName -like "*$pnpID*"}
    if ($powerMgmt.Enable) {
        Write-Host "Disabling power management for $friendlyName"
        $powerMgmt.Enable = $false
        $powerMgmt.psbase.Put()
    }
}