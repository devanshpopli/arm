$diskConfig1 = New-AzDiskConfig -SkuName ${Env:storageType} -Location ${Env:location} -CreateOption Empty -DiskSizeGB 8
$dataDisk1 = New-AzDisk -DiskName ${ENV:dataDiskName} -Disk $diskConfig1 -ResourceGroupName ${ENV:rgName}

$vm = Get-AzVM -Name ${ENV:vmName} -ResourceGroupName ${ENV:rgName}
$vm = Add-AzVMDataDisk -VM $vm -Name ${ENV:dataDiskName} -CreateOption Attach -ManagedDiskId $dataDisk1.Id -Lun 1

Update-AzVM -VM $vm -ResourceGroupName ${ENV:rgName}
