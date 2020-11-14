Function Get-SystemSpecifications() 
{

    $UserInfo = Get-UserInformation;
    $OS = Get-OS;
    $Kernel = Get-Kernel;
    $Uptime = Get-Uptime;
    $Shell = Get-Shell;
    $RAM = Get-RAM;
    $Blank = Get-blank;


    [System.Collections.ArrayList] $SystemInfoCollection = 
        $Blank,
        $UserInfo, 
        $OS,
        $Kernel, 
        $RAM,
        $Uptime,
        $Shell,
        $Blank,
        $Blank,
        $Blank;

    
    
    return $SystemInfoCollection;
}

Function Get-LineToTitleMappings() 
{ 
    $TitleMappings = @{
        1 = "";
        2 = "OS: ";
        3 = "Kernel: ";
        4 = "Memory: ";
        5 = "Uptime: ";
        6 = "Shell: ";

    };

    return $TitleMappings;
}

Function Get-blank
{
    ""
}
Function Get-UserInformation()
{
    return $env:USERNAME + "@" + [System.Net.Dns]::GetHostName();
}

Function Get-OS()
{
    return (Get-CimInstance Win32_OperatingSystem).Caption + " " + 
        (Get-CimInstance Win32_OperatingSystem).OSArchitecture;
}

Function Get-Kernel()
{
    return (Get-CimInstance  Win32_OperatingSystem).Version;
}

Function Get-Uptime()
{
    $Uptime = (([DateTime](Get-CimInstance Win32_OperatingSystem).LocalDateTime) -
            ([DateTime](Get-CimInstance Win32_OperatingSystem).LastBootUpTime));

    $FormattedUptime =  $Uptime.Days.ToString() + "d " + $Uptime.Hours.ToString() + "h " + $Uptime.Minutes.ToString() + "m " + $Uptime.Seconds.ToString() + "s ";
    return $FormattedUptime;
}


Function Get-Shell()
{
    return "PowerShell $($PSVersionTable.PSVersion.ToString())";

}



Function Get-RAM() 
{
    $FreeRam = ([math]::Truncate((Get-CimInstance Win32_OperatingSystem).FreePhysicalMemory / 1KB)); 
    $TotalRam = ([math]::Truncate((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1MB));
    $UsedRam = $TotalRam - $FreeRam;
    $FreeRamPercent = ($FreeRam / $TotalRam) * 100;
    $FreeRamPercent = "{0:N0}" -f $FreeRamPercent;
    $UsedRamPercent = ($UsedRam / $TotalRam) * 100;
    $UsedRamPercent = "{0:N0}" -f $UsedRamPercent;

    return $UsedRam.ToString() + "MB / " + $TotalRam.ToString() + " MB " + "(" + $UsedRamPercent.ToString() + "%" + ")";
}
