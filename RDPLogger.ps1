Do {

    $fileDate = Get-Date -UFormat "%Y_%m_%d"
    $outFile = "C:\temp\rdplog_$($fileDate).txt"

    $AllUsers = Get-ChildItem REGISTRY::HKEYS_USERS -ErrorAction SilentlyContinue
    foreach ($user in $AllUsers) {
        $date = Get-Date
        $r = "REGISTRY::$($user.name)\Volatile Environment"
        if (test-path -Path $r -ErrorAction SilentlyContinue) {
            $ve = Get-ChildItem -Path $r
            foreach ($sub in $ve) {
                $sid = $user.name.split('\')[1]
                $objSID = New-Object System.Security.Principal.SecurityIdentifier ($sid)
                $objUser = $objSID.Translate( [System.Security.Principal.NTAccount])
                Add-Content $outFile $date
                Add-Content $outFile "SIDs:  $($sid)"
                Add-Content $outFile "User:  $($objUser.Value)"
                Add-Content $outFile "Clientname:  $((Get-ItemProperty -Path $('REGISTRY::' + $sub.name) -name CLIENTNAME).CLIENTNAME)"
                Add-Content $outFile "Sessionname:  $((Get-ItemProperty -Path $('REGISTRY::' + $sub.name) -name SESSIONNAME).SESSIONNAME)"
                Add-Content $outFile ""
            }
        }
    }

    #Delay between logging in seconds
    sleep 120

} while ($true)