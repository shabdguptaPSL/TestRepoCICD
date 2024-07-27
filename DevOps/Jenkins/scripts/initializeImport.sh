#!/bin/bash

#parameters from arguments
branchName=$1
projectName=$2
assetType=$3
assestID=$4


#load configuration from file

config_file="initImportConfig.txt"
if [ -f "$config_file" ]; then
	source "$config_file"
else
	echo "Error: Config file '$config_file' not found."
	exit 1
	
fi



#Access parameters from the config file
echo "GITURL: $GITURL"
echo "GITBRANCH: $branchName"
echo "LOCALREPOPATH: $LOCALREPOPATH"
echo "PROJECTNAME: $PROJECTNAME"
echo "USERNAME: $USERNAME"
echo "PASSWORD: $PASSWORD"
echo "TENANTURL: $TENANTURL"
echo "EXPORTSCRIPT: $EXPORTSCRIPT"
echo "Asset ID : $assestID"
echo "Asset Type: $assetType"
#projectName=Trumia_CICD
#assetType=flowservice
#assestID=sampleMap

echo $assestID
echo $assetType
bash $CREATEPROJECTSCRIPT $projectName 
bash $IMPORTSCRIPT  $TENANTURL  $USERNAME $PASSWORD  $projectName $assestID $assetType  $LOCALREPOPATH $synchProject $sourceType $inlcudeAllReferenceData $debug

#cd $LOCALREPOPATH

#git checkout "$branchName"

#git pull

#git add .

#git commit -m "added new feature for project: '$projectName' branchName:'$branchName' assetType:'$assetType' assestID='$assestID' "

#git push