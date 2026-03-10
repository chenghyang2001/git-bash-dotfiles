#!/bin/bash
# install.sh — 部署 git-bash-dotfiles 到本機
# 用法：bash ~/workspace/git-bash-dotfiles/install.sh

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "=== git-bash-dotfiles installer ==="
echo "Repo: $DOTFILES_DIR"
echo "Home: $HOME"
echo ""

# 1. 備份現有 .bashrc（如果不是 symlink）
if [ -f "$HOME/.bashrc" ] && [ ! -L "$HOME/.bashrc" ]; then
    BACKUP="$HOME/.bashrc.bak.$(date +%Y%m%d%H%M%S)"
    cp "$HOME/.bashrc" "$BACKUP"
    echo "[backup] $HOME/.bashrc -> $BACKUP"
fi

# 2. 建立 symlink
ln -sf "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"
echo "[link]   $HOME/.bashrc -> $DOTFILES_DIR/.bashrc"

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
