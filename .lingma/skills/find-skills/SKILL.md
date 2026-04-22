---
name: find-skills
description: 帮助用户发现和安装agent skills。当用户询问"如何做X"、"查找X的skill"、"是否有可以...的skill"，或表示希望扩展能力时使用此skill。适用于用户寻找可能作为可安装skill存在的功能。
---

# Skills 发现指南

本skill帮助您从开放的agent skills生态系统中发现和安装skills。

## 何时使用此Skill

在以下情况使用此skill：

- 用户询问"如何做X"，而X可能是有现有skill的常见任务
- 说"为X找一个skill"或"是否有X的skill"
- 询问"你能做X吗"，其中X是 specialized capability
- 表示有兴趣扩展agent能力
- 想要搜索工具、模板或工作流
- 提到他们希望在特定领域获得帮助（design、testing、deployment等）

## 什么是Skills CLI？

Skills CLI (`npx skills`) 是开放agent skills生态系统的包管理器。Skills是模块化包，通过专业知识、工作流和工具扩展agent能力。

**关键命令：**

- `npx skills find [query]` - 交互式或按关键词搜索skills
- `npx skills add <package>` - 从GitHub或其他来源安装skill
- `npx skills check` - 检查skill更新
- `npx skills update` - 更新所有已安装的skills

**浏览skills：** https://skills.sh/

## 如何帮助用户查找Skills

### 步骤1：理解用户需求

当用户寻求帮助时，识别：

1. 领域（如 React、testing、design、deployment）
2. 具体任务（如 writing tests、creating animations、reviewing PRs）
3. 这是否是足够常见的任务，可能存在对应的skill

### 步骤2：先查看Leaderboard

在运行CLI搜索之前，查看 [skills.sh leaderboard](https://skills.sh/) 以确定该领域是否已有知名skill。Leaderboard按总安装量对skills进行排名，展示最受欢迎和经过实战检验的选项。

例如，Web开发的顶级skills包括：
- `vercel-labs/agent-skills` — React、Next.js、web design（每个100K+ installs）
- `anthropics/skills` — Frontend design、document processing（100K+ installs）

### 步骤3：搜索Skills

如果leaderboard未覆盖用户需求，运行find命令：

```bash
npx skills find [query]
```

例如：

- 用户问"如何让我的React应用更快？" → `npx skills find react performance`
- 用户问"你能帮我review PRs吗？" → `npx skills find pr review`
- 用户说"我需要创建changelog" → `npx skills find changelog`

### 步骤4：推荐前验证质量

**不要仅基于搜索结果推荐skill。** 始终验证：

1. **安装数量** — 优先选择1K+ installs的skills。对低于100的要谨慎。
2. **来源声誉** — 官方来源（`vercel-labs`、`anthropics`、`microsoft`）比未知作者更可信。
3. **GitHub stars** — 检查源repository。来自stars <100的repo的skill应持怀疑态度。

### 步骤5：向用户展示选项

找到相关skills时，向用户展示：

1. skill名称及其功能
2. 安装数量和来源
3. 他们可以运行的install命令
4. 在skills.sh上了解更多的链接

示例回复：

```
我找到了一个可能有帮助的skill！"react-best-practices" skill提供
来自Vercel Engineering的React和Next.js性能优化指南。
(185K installs)

安装它：
npx skills add vercel-labs/agent-skills@react-best-practices

了解更多：https://skills.sh/vercel-labs/agent-skills/react-best-practices
```

### 步骤6：提供安装帮助

如果用户想继续，您可以为他们安装skill：

```bash
npx skills add <owner/repo@skill> -g -y
```

`-g` 标志在全局（user-level）安装，`-y` 跳过确认提示。

## 常见Skill类别

搜索时，考虑这些常见类别：

| 类别 | 示例查询 |
| --------------- | ---------------------------------------- |
| Web Development | react, nextjs, typescript, css, tailwind |
| Testing | testing, jest, playwright, e2e |
| DevOps | deploy, docker, kubernetes, ci-cd |
| Documentation | docs, readme, changelog, api-docs |
| Code Quality | review, lint, refactor, best-practices |
| Design | ui, ux, design-system, accessibility |
| Productivity | workflow, automation, git |

## 高效搜索技巧

1. **使用具体关键词**："react testing" 比仅 "testing" 更好
2. **尝试替代术语**：如果 "deploy" 不起作用，尝试 "deployment" 或 "ci-cd"
3. **检查流行来源**：许多skills来自 `vercel-labs/agent-skills` 或 `ComposioHQ/awesome-claude-skills`

## 未找到Skills时

如果没有相关的skills存在：

1. 承认未找到现有skill
2. 提出使用您的通用能力直接帮助完成任务
3. 建议用户可以使用 `npx skills init` 创建自己的skill

示例：

```
我搜索了与"xyz"相关的skills，但没有找到匹配项。
我仍然可以直接帮助您完成此任务！您希望我继续吗？

如果这是您经常做的事情，您可以创建自己的skill：
npx skills init my-xyz-skill
```
