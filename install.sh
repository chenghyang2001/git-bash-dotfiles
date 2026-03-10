#!/bin/bash
# install.sh — 部署 git-bash-dotfiles 到本機
# 用法：bash ~/workspace/git-bash-dotfiles/install.sh
#
# Windows 10 不支援非管理員 symlink，因此用複製方式部署。
# 日常流程：編輯 repo 裡的 .bashrc → git push → 另一台 git pull && bash install.sh

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "=== git-bash-dotfiles installer ==="
echo "Repo: $DOTFILES_DIR"
echo "Home: $HOME"
echo ""

# 1. 備份現有 .bashrc（如果內容不同）
if [ -f "$HOME/.bashrc" ]; then
    if ! diff -q "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc" > /dev/null 2>&1; then
        BACKUP="$HOME/.bashrc.bak.$(date +%Y%m%d%H%M%S)"
        cp "$HOME/.bashrc" "$BACKUP"
        echo "[backup] $HOME/.bashrc -> $BACKUP"
    fi
fi

# 2. 複製 .bashrc 到 $HOME
cp "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"
echo "[copy]   $DOTFILES_DIR/.bashrc -> $HOME/.bashrc"

# 3. 建立 .bashrc_secrets 模板（如果不存在）
if [ ! -f "$HOME/.bashrc_secrets" ]; then
    cat > "$HOME/.bashrc_secrets" << 'SECRETS_EOF'
# ~/.bashrc_secrets — 機器專屬的 API keys（不要放進 git）
# export GITHUB_PERSONAL_ACCESS_TOKEN="ghp_..."
# export GREPTILE_API_KEY="..."
SECRETS_EOF
    echo "[create] $HOME/.bashrc_secrets (template — please fill in your keys)"
else
    echo "[skip]   $HOME/.bashrc_secrets already exists"
fi

echo ""
echo "Done! Run 'source ~/.bashrc' to reload."
