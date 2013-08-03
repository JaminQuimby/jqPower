$strUserName = "samAccountName"
$objDomain = New-Object System.DirectoryServices.DirectoryEntry
$objSearcher = New-Object System.DirectoryServices.DirectorySearcher
$strFilter = "(&(objectCategory=User)(samAccountName=" + $strUserName + "))"
$objSearcher.SearchRoot = $objDomain
$objSearcher.PageSize = 1000
$objSearcher.Filter = $strFilter
$objSearcher.SearchScope = "Subtree"
$colResults = $objSearcher.FindAll()
 
foreach ($objResult in $colResults)
    {$objUser = $objResult.GetDirectoryEntry()
    $objUser.adspath
    "First Name: " + $objUser.FirstName
    "Given Name: " + $objUser.givenName
    "Last Name: " + $objUser.LastName
    "initial: " + $objUser.initials
    "Name: " + $objUser.name
    "CN: " + $objUser.cn
    "FullName: " + $objUser.FullName
    "DisplayName: " + $objUser.DisplayName
    "SamAccountName: " + $objUser.samAccountName
    "UserPrincipalName: " + $objUser.UserPrincipalName
    "badPwdCount: " + $objUser.badPwdCount
    "Comment: " + $objUser.comment
    "Company: " + $objUser.company
    "Country Code: " + $objUser.countryCode
    "Department: " + $objUser.department
    "Description: " + $objUser.description
    "Direct Reports: " + $objUser.directReports
    "Distinguished Name: " + $objUser.distinguishedName
    "facsimileTelephoneNumber: " + $objUser.facsimileTelephoneNumber
    "physicalDeliveryOfficeName: " + $objUser.physicalDeliveryOfficeName
    "TelephoneNumber: " + $objUser.TelephoneNumber
    "mail: " + $objUser.mail
    "wWWHomePage: " + $objUser.wWWHomePage
    "streetAddress: " + $objUser.streetAddress
    "postOfficeBox: " + $objUser.postOfficeBox
    "City: " + $objUser.l
    "State: " + $objUser.st
    "postalCode: " + $objUser.postalCode
    "Country: " + $objUser.c
    "Title: " + $objUser.Title
    "Info: " + $objUser.Info
    #Vintela Authentication Service - uncomment the following lines if you have VAS installed and
    #working within your Active Directory environment.
    #"User ID (uid): " + $objUser.uidNumber
    #"Primary Group ID(gid): " + $objUser.gidNumber
    #"GECOS: " + $objUser.gecos
    #"Login Shell: " + $objUser.loginShell
    #"Unix Home Directory: " + $objUser.unixHomeDirectory
     }