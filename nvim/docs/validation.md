# Neovim 验证命令

在仓库根目录执行下面的 shell 命令；`nvim` 必须已安装。配置依赖尚未准备好时，先依照根目录安装流程处理。不要把缺少依赖当作语法错误，也不要为检查而自动执行 `Lazy sync`。

## 1. 静态检查

```sh
git diff --check
nvim --headless -u NONE '+lua for _, f in ipairs(vim.fn.glob("nvim/**/*.lua", false, true)) do local chunk, err = loadfile(f); if not chunk then vim.api.nvim_err_writeln(err); vim.cmd("cquit 1") end end; print("Lua syntax OK")' +qa
```

应看到 `Lua syntax OK` 且退出码为 0。这里只编译 Lua 文件，不执行配置，不验证插件接口。使用 Neovim 内置 Lua 解析器，避免独立 Lua 版本差异。

## 2. 实际加载仓库配置

即使本机尚未链接此仓库，下列命令也会将仓库 `nvim/` 加入 runtimepath 并加载其 init；仅指定 `-u` 不足以保证 `require` 找到仓库模块。

```sh
nvim --headless \
  --cmd 'lua vim.opt.rtp:prepend(vim.fn.getcwd() .. "/nvim")' \
  -u ./nvim/init.lua \
  '+lua vim.api.nvim_exec_autocmds("User", { pattern = "VeryLazy" })' \
  '+lua vim.defer_fn(function() print("CONFIG_LOADED"); vim.cmd("messages"); vim.cmd("qa!") end, 1500)'
```

观察终端输出：应有 `CONFIG_LOADED`，没有 `Error`、Lua traceback、模块缺失或插件 setup 失败。退出码为 0 **不是**“没有配置错误”的充分条件；Neovim 可在初始化报错后继续运行。

显式触发 VeryLazy 用于覆盖无界面时尚未触发的延迟插件；其他 FileType、InsertEnter 或命令加载的插件仍需打开相应文件、进入插入模式或调用命令才能覆盖。异步工作未完成时延长等待；固定等待只用于初步启动检查。

配置可能自行下载缺失的插件或解析器，并写入本机 data/state/cache。若会安装或变更本机内容，先按根流程记录在临时目录。此检查不隔离用户插件缓存，不能当作全新机器安装验证。

## 3. 消息、弃用及健康报告

用真实终端启动仓库配置：

```sh
nvim --cmd 'lua vim.opt.rtp:prepend(vim.fn.getcwd() .. "/nvim")' -u ./nvim/init.lua
```

在 Neovim 中运行：

```vim
:messages
:checkhealth vim.deprecated
:checkhealth lazy mason mason-lspconfig nvim-treesitter telescope which-key
```

先实际触发本次更改的功能，再查弃用报告；未走到的代码不会被动态检测。应没有相关 ERROR、traceback 或弃用告警。区分功能缺失与无关环境/说明性 WARNING；最终说明保留的警告及影响。

## 4. 按改动选择功能检查

使用本机临时目录中的示例，避免格式化或改坏用户文件；语言和预期服务名从当前源码读取，不在文档维护另一份清单。

| 改动 | 在 Neovim 中执行/操作 | 如何判断 |
|---|---|---|
| 语言服务 | 打开对应文件，等待启动；运行 `:lua vim.print(vim.lsp.get_clients({ bufnr = 0 }))` | 预期服务出现在当前 buffer，`initialized = true`；不要把格式化客户端当成目标语言服务。 |
| 诊断 | 在示例中制造该服务能识别的错误，运行 `:lua vim.print(vim.diagnostic.get(0))` | 等待分析完成后有相关诊断；修复后对应诊断消失。 |
| 补全 | 插入模式输入可补全的符号，并选择/确认候选项 | 候选来自预期来源，确认后正确插入，消息中没有回调错误。连接成功不足以证明补全正常。 |
| 格式化 | 对未格式化示例运行 `:lua vim.lsp.buf.format({ async = false, timeout_ms = 10000, name = "null-ls" })` | 文本按预期变化，语义不变；无找不到命令/超时错误。若更换格式化架构，同步修改本检查。 |
| 语法解析 | 打开对应示例，运行 `:InspectTree`；查看高亮 | 解析树可用且无 query/parser 错误；复杂高亮需目视确认。 |
| 文件树 | `:NvimTreeOpen`、`:NvimTreeClose` | 树正常显示、可选中文件并打开，无回调错误。 |
| 文件搜索 | `:Telescope find_files` | 列出临时示例目录中的文件，选中可打开；改 grep 时另试 `:Telescope live_grep`。 |
| 快捷键 | `:verbose nmap <待查按键>` 或 `:verbose imap <待查按键>`，再实际按键 | 映射来源正确，实际动作与源码一致，未被终端截获。 |

只验证本次改动及其受影响路径，不要求每次运行全表。将成功、失败和未覆盖部分分别说明；本机测试输出按上级规则留在临时目录，不提交到仓库。
