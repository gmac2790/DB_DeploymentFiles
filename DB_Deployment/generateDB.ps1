Clear-Content -Path './DBScript.sql'
$DB = "DBManagementTest"
Add-Content -Path './DBScript.sql' -Value ("CREATE DATABASE " + $DB)
Add-Content -Path './DBScript.sql' -Value ("GO;")
Add-Content -Path './DBScript.sql' -Value ("")

Add-Content -Path './DBScript.sql' -Value ("USE " + $DB)
Add-Content -Path './DBScript.sql' -Value ("GO;")
Add-Content -Path './DBScript.sql' -Value ("")


$files = Get-Content manifest.txt

foreach($file in $files){
    if($file -ne ''){
        if($file -like 'Tables/*'){                       
            # $fileName = $file.Substring($file.IndexOf("/") +1)
            # $fileName = $fileName.Substring(0, $fileName.IndexOf("."))
            # Add-Content -Path './DBScript.sql' -Value ("/*")
            # Add-Content -Path './DBScript.sql' -Value ("Table Name: " + $fileName)
            # Add-Content -Path './DBScript.sql' -Value ("*/")
            $bool = $file -match "Tables/(?<TableName>.*).sql"
            $TableName = $Matches['TableName']
            # Add-Content -Path './DBScript.sql' -Value ($TableName)      
            Add-Content -Path './DBScript.sql' -Value ('if not exists(select 1 from sysobject where name = '+ $TableName +' and xtype = <U>)')
            Add-Content -Path './DBScript.sql' -Value ('BEGIN')      
            Add-Content -Path './DBScript.sql' -Value (Get-Content $file)        
            Add-Content -Path './DBScript.sql' -Value ('END')
            Add-Content -Path './DBScript.sql' -Value ('GO;')
            Add-Content -Path './DBScript.sql' -Value ('')
        }
    }
}