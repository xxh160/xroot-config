# Agent 入口

这是个人 dotfiles 源码仓库，保存可复用配置和维护指引；机器部署日志不纳入版本管理。具体行为以配置源码和就近注释为准。

- 先检查工作区现状，并遵循所操作子目录中的 `AGENTS.md`。
- 安装、迁移、软链接反查或依赖管理：按需读取 [docs/setup.md](docs/setup.md)。
- 修改、排错与验证：按需读取 [docs/change-workflow.md](docs/change-workflow.md)。
- 只改任务相关内容，保留用户已有改动；不自动提交或推送。
- 不覆盖未备份的配置，不提交凭据、缓存或历史记录。

## Git 提交约定

- 提交信息采用 Conventional Commits：`type(scope): description`，scope 可省略。使用 feat、fix、docs、refactor、test、chore 等类型，scope 使用实际受影响的模块或内容区域。
- 标题使用简洁英文，明确说明改了什么；避免 update、misc、修改了一些内容等笼统信息。必要时在正文解释原因、兼容性和验证结果。
- 一个提交围绕一个完整目的，不混入无关修改；提交前检查暂存差异、文件删除/移动和 `git diff --cached --check`，运行与改动匹配的验证。
- 不改写已推送历史，不使用 force push。只有用户明确要求提交或推送时才执行，并区分两项授权；确认目标分支与远端，保留用户未授权的工作区改动。
