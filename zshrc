
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/admin/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/admin/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/admin/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/admin/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<



# Disable/enable notification center
alias disableNotificationCenter="launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist && killall NotificationCenter"
alias enableNotificationCenter="launchctl load -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist && open /System/Library/CoreServices/NotificationCenter.app/"

# change to Volume directory
alias workdir="cd /Volumes/developer\ -\ Data/development"
alias release="cd /Volumes/developer\ -\ Data/release/"