cp ~/.zshrc .

cp ~/.config/karabiner/karabiner.json .
cp ~/.config/linearmouse/linearmouse.json .
cp ~/Library/KeyBindings/DefaultKeyBinding.dict .
cp ~/Library/Preferences/org.krita.plist .
cp ~/Library/Preferences/pro.betterdisplay.BetterDisplay.plist .

defaults read com.apple.symbolichotkeys > com.apple.symbolichotkeys.json
defaults read com.knollsoft.Rectangle > com.knollsoft.Rectangle.json

rm -rf ."talon user"
mkdir ".talon user"
cp -rf ~/.talon/user/ "./.talon user/"

rm -rf "Code-User"
mkdir "Code-User"
cp ~/"Library/Application Support/Code/User/keybindings.json" Code-User
cp ~/"Library/Application Support/Code/User/settings.json" Code-User

BACKUP_PATH="/Users/gdyson/Library/CloudStorage/OneDrive-Personal/Computers and electronics/Mac Customisation"

echo "backups (before)"
ls "$BACKUP_PATH"

cp -rf . "$BACKUP_PATH/backup $(date '+%Y-%m-%d %H-%M-%S')"

echo "backups (after)"
ls "$BACKUP_PATH"