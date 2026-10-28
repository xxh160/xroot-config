# zsh 本机配置指引

`.zshrc` 由各台机器本地维护。本目录不保存完整 `.zshrc`，也不建立从 `~/.zshrc` 到仓库的软链接。保留安装生成的模板、机器路径和个人偏好；需要调整时先读取本机文件，仅合并所需片段，不整份替换。

## 环境与插件

使用 zsh、Oh My Zsh 和 Atuin。先检查已有安装；缺少时按各项目官方说明及本机包管理器安装，不覆盖已有模板。

Oh My Zsh 启用以下插件：

| 插件 | 来源及用途 |
|---|---|
| `git` | Oh My Zsh 内置，Git 别名与辅助命令 |
| `z` | Oh My Zsh 内置，常用目录跳转 |
| `sudo` | Oh My Zsh 内置，快速为命令添加 sudo |
| `vi-mode` | Oh My Zsh 内置，vi 风格编辑按键 |
| `zsh-autosuggestions` | 外部插件，历史命令建议 |
| `zsh-syntax-highlighting` | 外部插件，命令语法高亮；放在插件列表最后 |

外部插件放在本机 `${ZSH_CUSTOM:-$ZSH/custom}/plugins/`，不要复制到本仓库。对应上游为 `zsh-users/zsh-autosuggestions` 和 `zsh-users/zsh-syntax-highlighting`。

在现有 `.zshrc` 中合并插件列表，不重复添加第二个 `plugins` 定义：

```zsh
plugins=(git z sudo vi-mode zsh-autosuggestions zsh-syntax-highlighting)
source "$ZSH/oh-my-zsh.sh"
```

## Atuin 历史搜索

在 Oh My Zsh 和其他按键初始化之后添加以下片段；已有 Atuin 初始化则调整位置，不重复初始化：

```zsh
# Initialize history search after the other keymaps so Ctrl+R uses Atuin.
if (( $+commands[atuin] )); then
    eval "$(atuin init zsh --disable-up-arrow)"
fi
```

直接按 Ctrl+R 调用 Atuin，不需要配置终端转发。Atuin 本地历史与凭据不进入仓库，不自动开启账号同步。

## 验证

```sh
zsh -n ~/.zshrc
```

新开终端，再运行 `bindkey -M viins '^R'`，应显示 Atuin 的搜索 widget；实际按 Ctrl+R 确认搜索界面出现。语法检查和 widget 绑定检查不能替代真实按键验证。
