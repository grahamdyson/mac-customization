cp ~/.zshrc .

cp ~/.config/linearmouse/linearmouse.json .

cp ~/Library/KeyBindings/DefaultKeyBinding.dict .

cp ~/.config/karabiner/karabiner.json .

defaults read com.apple.symbolichotkeys > com.apple.symbolichotkeys.json
defaults read com.knollsoft.Rectangle > com.knollsoft.Rectangle.json

rm -rf ."talon user"
mkdir ".talon user"
cp -rf ~/.talon/user/ "./.talon user/"

rm -rf "Library Application Support Code User"
mkdir "Library Application Support Code User"
cp ~/"Library/Application Support/Code/User/keybindings.json" "Library Application Support Code User"
cp ~/"Library/Application Support/Code/User/settings.json" "Library Application Support Code User"

rm -rf ".config Pinta"
mkdir ".config Pinta"
cp -rf ~/.config/Pinta/ ".config Pinta"

echo previous backups
ls "/Volumes/OneDrive/Computers and electronics/Mac Customisation"

cp -rf . "/Volumes/OneDrive/Computers and electronics/Mac Customisation/backup $(date '+%Y-%m-%d %H:%M:%S')"

echo new backups
ls "/Volumes/OneDrive/Computers and electronics/Mac Customisation"