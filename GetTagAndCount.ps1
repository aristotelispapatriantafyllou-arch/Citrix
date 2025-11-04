#Requires -Modules Citrix.Broker.Admin
 
# Import Citrix PowerShell snap-in (needed only if not auto-loaded)
if (-not (Get-PSSnapin -Name Citrix.Broker.Admin.* -ErrorAction SilentlyContinue)) {
    Add-PSSnapin Citrix.Broker.Admin.*
}
 
# Get all tags
$allTags = Get-BrokerTag
 
# Prepare final result collection
$result = @()
 
foreach ($tag in $allTags) {
    # Get all machines assigned to this tag
    $taggedMachines = Get-BrokerMachine -Tag $tag.Name
 
    # Build an object for output
    $result += [PSCustomObject]@{
        TagName        = $tag.Name
        TagDescription = $tag.Description
        MachineCount   = $taggedMachines.Count
        Machines       = if ($taggedMachines.Count -gt 0) {
                            $taggedMachines | Select-Object -ExpandProperty MachineName
                         } else {
                            @()
                         }
    }
}
 
# Output to console
$result | Format-Table -AutoSize
 
# Optional: Export to CSV
#$result | Export-Csv -Path "C:\Citrix\TagsWithMachines.csv" -NoTypeInformation
