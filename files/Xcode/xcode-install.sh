echo pwd
echo "=========Installing Xcode from xip file.. It will take some time========== "
open -FWga "Archive Utility" --args ~/Documents/Xcode*.xip
echo "==Successfully Extracted Xcode, Moving to Applications===="
mv ~/Documents/Xcode*.app ~/Applications/
