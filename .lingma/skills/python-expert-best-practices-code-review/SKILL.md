---
name: python-expert-best-practices-code-review
description: Python生产级代码最佳实践。在编写、审查或重构Python代码时使用此skill。适用于涉及Python开发、错误处理模式、字典操作和代码质量改进的任务。
license: MIT
metadata:
  author: wispbit
  version: "1.0.0"
---

# Python 3.14+ 专家级最佳实践

简洁、实用、有主见。只关注编写生产级Python代码的关键要点。

## 适用场景

在以下情况参考这些指南：
- 编写Python函数、类或模块
- 审查Python代码的错误处理问题
- 重构现有Python代码库
- 实现数据验证和API边界
- 优化错误检测和调试模式

## 规则分类及优先级

| 优先级 | 类别 | 影响程度 | 前缀 |
|----------|----------|--------|--------|
| 1 | 错误处理 | CRITICAL | `dict-`, `operators-` |
| 2 | 常见Bug | CRITICAL-HIGH | `no-mutable-`, `no-generic-` |
| 3 | 代码清晰度 | HIGH-MEDIUM | `listcomp-`, `no-inline-` |
| 4 | 代码风格 | LOW | `avoid-`, `unnecessary-` |

## 快速参考

- `dict-required-keys` - 对必需的字典键使用 `d[key]`，通过KeyError快速失败
- `no-mutable-defaults` - 函数/方法参数中不使用可变默认值
- `operators-return-notimplemented` - 对不支持的操作数类型返回NotImplemented，并有意识地设计 + 与 += 的行为
- `no-generic-except` - 避免通用except子句，防止隐藏意外错误
- `listcomp-no-side-effects` - List comprehensions必须产生一个你使用的值（禁止副作用listcomps）
- `no-inline-imports` - 将所有import语句放在文件顶部
- `avoid-explanatory-comments` - 避免为自解释代码添加不必要的注释
- `unnecessary-else-blocks` - 避免在return/break/continue语句后使用不必要的else块

## 使用方法

阅读各个规则文件以获取详细解释和代码示例：

```
rules/dict-required-keys.md
rules/no-mutable-defaults.md
rules/operators-return-notimplemented.md
rules/no-generic-except.md
rules/listcomp-no-side-effects.md
rules/no-inline-imports.md
rules/avoid-explanatory-comments.md
rules/unnecessary-else-blocks.md
```

每个规则文件包含：
- 为何重要的简要说明
- 何时使用以及何时不使用该模式
- 实现要求
- 错误的代码示例及解释
- 正确的代码示例及解释
- 额外的上下文和参考资料