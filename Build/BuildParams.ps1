$param = @{
    SubscriptionId    = '89f2b949-44fe-4969-9a1c-f53a85990a5d'
    ResourceGroupName = 'rg-AVDReplaceHost-01'
    Location          = 'WestEurope'
    AssignPermissions = $false
    BicepParams       = @{
        #Storage Account
        StorageAccountName                  = 'stavdreplacehost221216'

        #Log Analytics Workspace
        LogAnalyticsWorkspaceName           = 'law-avdreplacehost'

        #FunctionApp
        FunctionAppName                     = 'func-avdreplacementplan-weu-001'
        HostPoolResourceGroupName           = 'rg-AVD-01'
        HostPoolName                        = 'hpool-AVD-WE-D01'
        TagIncludeInAutomation              = 'IncludeInAutoReplace'
        TagDeployTimestamp                  = 'AutoReplaceDeployTimestamp'
        TagPendingDrainTimestamp            = 'AutoReplacePendingDrainTimestamp'
        TargetVMAgeDays                     = 30
        DrainGracePeriodHours               = 24
        FixSessionHostTags                  = $true
        SHRDeploymentPrefix                 = "AVDSessionHostReplacer"
        TargetSessionHostCount              = 3
        MaxSimultaneousDeployments          = 2
        SessionHostNamePrefix               = "AVD-WE-D01" #Azure Virtual Desktop - West Europe - FullDesktop Host Pool 01
        SessionHostTemplateUri              = "URI HERE"
        ADOrganizationalUnitPath            = "PATH HERE"
        SessionHostTemplateParametersPS1Uri = "URIHere"
        SubnetId                            = "SUBNET ID HERE"
        SessionHostInstanceNumberPadding = 2 # This results in a session host name like AVD-WE-D01-01,02,03
    }

}
.\Build\Build.ps1 @param -Verbose