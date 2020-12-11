# Hide any errors
$ErrorActionPreference = 'silentlycontinue'

# Stage up to Administrator privileges
If (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
	$Arguments = "& '" + $MyInvocation.mycommand.definition + "'"
	Start-Process powershell -Verb runAs -ArgumentList $Arguments
	Break
}

# Get HID Devices that are needed to be disabled/enabled
$VendorDevices = (Get-PnpDevice -FriendlyName "*HID-compliant vendor*" -Class "HIDClass")
$ConsumerDevices = (Get-PnpDevice -FriendlyName "*HID-compliant consumer*" -Class "HIDClass")


# Disable/enable first part of the devices
foreach ($item in $VendorDevices) {

	if ($item.Status -eq "OK") {
		$id = $item.InstanceId
		$name = $item.FriendlyName
		Disable-PnpDevice "$id" -Confirm:$false
		Write-Output "$name disabled"
	}
	elseif ($item.Status -eq "Error") {
		$id = $item.InstanceId
		$name = $item.FriendlyName
		Enable-PnpDevice "$id" -Confirm:$false
		Write-Output "$name enabled"
	}
}

# Disable/enable second part of the devices
foreach ($item in $ConsumerDevices) {

	if ($item.Status -eq "OK") {
		$id = $item.InstanceId
		$name = $item.FriendlyName
		Disable-PnpDevice "$id" -Confirm:$false
		Write-Output "$name disabled"
	}
	elseif ($item.Status -eq "Error") {
		$id = $item.InstanceId
		$name = $item.FriendlyName
		Enable-PnpDevice "$id" -Confirm:$false
		Write-Output "$name enabled"
	}
}

# Keep window open after operation
$host.enternestedprompt()
