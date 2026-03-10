#  file : ~/.bashrc in git-bash-dotfiles
#  sync : https://github.com/chenghyang2001/git-bash-dotfiles

# 載入機器專屬的 bashrc（如果存在）
[ -f ~/ubuntu/.bashrc_peter ] && source ~/ubuntu/.bashrc_peter

# 載入 secrets（API keys 等，不納入 git）
[ -f ~/.bashrc_secrets ] && source ~/.bashrc_secrets

alias ll1='echo "" && echo "=== ubuntu ===" && cd  ~/ubuntu && git pull '
alias ll2='echo "" && echo "=== .claude ===" && cd  ~/.claude                           && git pull '
alias ll3='echo "" && echo "=== claude-code-tell-a-joke ===" && cd  ~/Downloads/claude-code-tell-a-joke && git pull '
alias ll4='echo "" && echo "=== AutoRead-GoogleBook ===" && cd  ~/Downloads/AutoRead-GoogleBook && git pull '



alias lll='ll1 ; ll2 ; ll3 ; ll4  '


alias gg1='echo "" && echo "=== ubuntu ===" && cd  ~/ubuntu                            && git add . && git commit -m "code clean" && git push'
alias gg2='echo "" && echo "=== .claude ===" && cd  ~/.claude                           && git add . && git commit -m "code clean" && git push'
alias gg3='echo "" && echo "=== claude-code-tell-a-joke ===" && cd  ~/Downloads/claude-code-tell-a-joke && git add . && git commit -m "code clean" && git push'
alias gg4='echo "" && echo "=== AutoRead-GoogleBook ===" && cd  ~/Downloads/AutoRead-GoogleBook && git add . && git commit -m "code clean" && git push'

alias ggg='gg1 ; gg2 ; gg3 ; gg4 '


alias au='cd  ~/ubuntu'
alias aw='cd  ~/Downloads/joshhu/tomoto-clock-web-app'
alias ac='cd  ~/Downloads/claude-code-tell-a-joke'
alias am='cd  ~/Downloads/mutombo'
alias ap='cd  ~/Downloads/updateapp'
alias ap1='cd ~/Downloads/updateapp/updateapp'
alias ap2='cd ~/Downloads/updateapp/updatemanager'
alias as='cd  ~/Downloads/SerialPort_cn'
alias az='cd  ~/Downloads/zapController'

alias ct='ctags -R . '
alias gt='gitk --all & '

# Google Play Books
alias epub1='"/c/Program Files/Google/Chrome/Application/chrome.exe" "https://play.google.com/books/reader?id=ktVcEQAAQBAJ&hl=zh_TW" &'
alias autoread1='powershell -NoProfile -Command "Add-Type -AssemblyName System.Windows.Forms; while(\$true){[System.Windows.Forms.SendKeys]::SendWait(\"{RIGHT}\"); Start-Sleep -Seconds 5}"'

# PATH
export PATH="$PATH:$HOME/ubuntu/dos-menu"

# dotfiles 快捷操作
alias dotsync='bash ~/workspace/git-bash-dotfiles/install.sh && source ~/.bashrc && echo "dotfiles synced!"'
alias dotedit='vim ~/workspace/git-bash-dotfiles/.bashrc'
alias dotpush='cd ~/workspace/git-bash-dotfiles && git add . && git commit -m "更新 bashrc" && git push && cd -'

# eval "$(gh copilot alias -- bash)"
