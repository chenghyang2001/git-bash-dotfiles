# git-bash-dotfiles

兩台 Windows 10 PC 共用的 Git Bash dotfiles。

## 部署

```bash
cd ~/workspace
git clone https://github.com/chenghyang2001/git-bash-dotfiles.git
bash git-bash-dotfiles/install.sh
```

## 檔案說明

| 檔案 | 說明 |
|------|------|
| `.bashrc` | 主設定檔（aliases, PATH） |
| `.bashrc_secrets` | API keys（不納入 git，install.sh 自動建立模板） |
| `install.sh` | 部署腳本（備份 + symlink + secrets 模板） |
