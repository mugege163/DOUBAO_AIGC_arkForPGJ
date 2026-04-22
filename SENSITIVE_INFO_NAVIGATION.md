# 🔐 敏感信息脱敏 - 文档导航

欢迎！这里整理了所有关于项目敏感信息管理的文档和工具。

---

## 🗺️ 文档地图

```
📦 敏感信息管理
│
├── 🚀 快速开始
│   └── QUICK_SETUP.md          ← 从这里开始！5分钟完成配置
│
├── 📖 详细指南
│   ├── CONFIG_GUIDE.md         ← 完整的配置说明（推荐）
│   └── SENSITIVE_INFO_REPORT.md ← 脱敏工作报告
│
├── 🛠️ 工具脚本
│   ├── check-config.ps1        ← 配置检查工具
│   └── .env.example            ← 环境变量模板
│
└── 📋 总结报告
    └── DESENSITIZATION_SUMMARY.md ← 工作总结（本文档）
```

---

## 🎯 我应该看哪个文档？

### 👤 我是新手，第一次配置项目

**推荐阅读顺序**:
1. 📖 [QUICK_SETUP.md](./QUICK_SETUP.md) - 5分钟快速配置
2. 🛠️ 运行 `.\check-config.ps1` - 验证配置
3. 📖 [CONFIG_GUIDE.md](./CONFIG_GUIDE.md) - 深入了解

**预计时间**: 10-15分钟

---

### 👨‍💻 我是开发者，需要了解技术细节

**推荐阅读**:
1. 📖 [CONFIG_GUIDE.md](./CONFIG_GUIDE.md) - 完整的技术文档
2. 📖 [SENSITIVE_INFO_REPORT.md](./SENSITIVE_INFO_REPORT.md) - 安全最佳实践
3. 🛠️ 查看 `check-config.ps1` 源码 - 了解检查逻辑

**预计时间**: 30分钟

---

### 🔍 我是审计人员，需要检查安全性

**推荐阅读**:
1. 📖 [SENSITIVE_INFO_REPORT.md](./SENSITIVE_INFO_REPORT.md) - 安全措施说明
2. 📖 [DESENSITIZATION_SUMMARY.md](./DESENSITIZATION_SUMMARY.md) - 完整工作记录
3. 🛠️ 运行 `.\check-config.ps1` - 自动检查结果

**预计时间**: 20分钟

---

### 👥 我是团队负责人，需要培训新人

**推荐材料**:
1. 📖 [QUICK_SETUP.md](./QUICK_SETUP.md) - 新人上手指南
2. 📖 [CONFIG_GUIDE.md](./CONFIG_GUIDE.md) - 详细培训材料
3. 🛠️ `check-config.ps1` - 自动化检查工具
4. 📖 [.env.example](./rag_llm_server/.env.example) - 配置模板

**建议**: 组织一次30分钟的配置培训

---

## 📊 文档概览

| 文档 | 类型 | 行数 | 适合人群 | 阅读时间 |
|------|------|------|---------|---------|
| QUICK_SETUP.md | 快速指南 | 228 | 新手 | 5分钟 |
| CONFIG_GUIDE.md | 详细文档 | 326 | 开发者 | 15分钟 |
| SENSITIVE_INFO_REPORT.md | 工作报告 | 324 | 所有人 | 10分钟 |
| DESENSITIZATION_SUMMARY.md | 总结报告 | 405 | 管理者 | 10分钟 |
| .env.example | 配置模板 | 62 | 所有人 | 2分钟 |
| check-config.ps1 | 检查脚本 | 194 | 开发者 | - |

**总计**: ~1,539 行文档和代码

---

## ⚡ 快速行动清单

### ✅ 必须完成（按顺序）

- [ ] **步骤1**: 阅读 [QUICK_SETUP.md](./QUICK_SETUP.md)
- [ ] **步骤2**: 复制 `.env.example` 为 `.env`
- [ ] **步骤3**: 填写所有必需的配置项
- [ ] **步骤4**: 运行 `.\check-config.ps1` 验证
- [ ] **步骤5**: 安装依赖并启动服务

### 📅 定期执行

- [ ] 每月运行一次 `check-config.ps1`
- [ ] 每90天轮换所有密钥
- [ ] 定期检查密钥使用日志
- [ ] 更新文档（如有变更）

---

## 🔑 关键配置项速查

### 必需配置（9项）

| # | 配置项 | 位置 | 获取方式 |
|---|--------|------|---------|
| 1 | VOLC_ACCESS_KEY | .env | [IAM控制台](https://console.volcengine.com/iam/keymanage/) |
| 2 | VOLC_SECRET_KEY | .env | [IAM控制台](https://console.volcengine.com/iam/keymanage/) |
| 3 | RTC_APP_ID | .env + Custom.json | [RTC控制台](https://console.volcengine.com/rtc/aigc/listRTC) |
| 4 | RTC_APP_KEY | .env + Custom.json | [RTC控制台](https://console.volcengine.com/rtc/aigc/listRTC) |
| 5 | ARK_API_KEY | .env | [Ark控制台](https://console.volcengine.com/ark/region:ark+cn-beijing/apiKey) |
| 6 | ARK_ENDPOINT_ID | .env | Ark控制台 → 在线推理 |
| 7 | ASR_APP_ID | Custom.json | 语音技术控制台 |
| 8 | TTS_APP_ID | Custom.json | 语音技术控制台 |
| 9 | VOLC_ACCOUNT_ID | .env | 账号中心（已有默认值） |

---

## 🛠️ 常用命令

### 配置相关

```powershell
# 检查配置状态
.\check-config.ps1

# 创建环境变量文件
cd rag_llm_server
copy .env.example .env

# 编辑配置文件
notepad .env
notepad ..\Server\scenes\Custom.json
```

### 依赖安装

```powershell
# Node.js依赖
npm install
cd Server && npm install && cd ..

# Python依赖
cd rag_llm_server
python -m venv .venv
.venv\Scripts\Activate
pip install -r requirements.txt
```

### 启动服务

```powershell
# 终端1: Node.js后端
npm run server:start

# 终端2: Python后端
cd rag_llm_server
.venv\Scripts\Activate
python main.py

# 终端3: 前端
cd ..
npm run dev
```

---

## ⚠️ 安全提醒

### ❌ 绝对不要做

1. ❌ 将 `.env` 文件提交到 Git
2. ❌ 在代码中硬编码真实密钥
3. ❌ 在公开场合分享密钥
4. ❌ 使用生产密钥进行测试

### ✅ 应该这样做

1. ✅ 使用 `.env.example` 作为模板
2. ✅ 定期轮换密钥（90天）
3. ✅ 使用最小权限原则
4. ✅ 监控密钥使用情况
5. ✅ 立即撤销泄露的密钥

---

## 🆘 遇到问题？

### 常见问题快速解决

**问题1**: `.env` 文件在哪里？  
**解决**: `rag_llm_server/.env`，从 `.env.example` 复制

**问题2**: 如何知道配置是否正确？  
**解决**: 运行 `.\check-config.ps1`

**问题3**: 服务启动失败  
**解决**: 
1. 检查控制台错误信息
2. 确认所有密钥已填写
3. 查看 [CONFIG_GUIDE.md](./CONFIG_GUIDE.md) 的故障排查部分

**问题4**: 密钥从哪里获取？  
**解决**: 查看 [CONFIG_GUIDE.md](./CONFIG_GUIDE.md) 中的"获取方式"章节

### 获取帮助

1. 📖 查看详细文档: [CONFIG_GUIDE.md](./CONFIG_GUIDE.md)
2. 🛠️ 运行检查工具: `.\check-config.ps1`
3. 📊 查看工作报告: [SENSITIVE_INFO_REPORT.md](./SENSITIVE_INFO_REPORT.md)
4. 💬 联系技术支持

---

## 📈 进度追踪

### 当前状态

- ✅ 场景配置文件脱敏: **100%** 完成
- ✅ 环境变量模板: **100%** 完成
- ✅ 配置文档: **100%** 完成
- ✅ 检查脚本: **100%** 完成
- ⏳ 用户配置: **待完成** ← 您需要完成这一步

### 下一步

1. 按照 [QUICK_SETUP.md](./QUICK_SETUP.md) 完成配置
2. 运行 `.\check-config.ps1` 验证
3. 启动服务测试

---

## 🎓 学习资源

### 官方文档

- [火山引擎 IAM](https://www.volcengine.com/docs/6257/64975)
- [RTC 服务](https://www.volcengine.com/docs/6348/103737)
- [Ark 大模型](https://www.volcengine.com/docs/82379)
- [语音技术](https://www.volcengine.com/docs/6561)

### 项目文档

- [EASY_README.md](./EASY_README.md) - 项目总览
- [UPDATE_SUMMARY.md](./UPDATE_SUMMARY.md) - 更新记录
- [SKILLS_RECOMMENDATION.md](./SKILLS_RECOMMENDATION.md) - Skills推荐

---

## 🌟 特色功能

### 1. 自动化检查

`check-config.ps1` 脚本可以自动：
- ✅ 检测缺失的配置文件
- ✅ 验证必需的变量
- ✅ 发现未替换的占位符
- ✅ 检查依赖安装状态
- ✅ 生成详细报告

### 2. 完善的文档

- 📖 快速开始指南（新手友好）
- 📖 详细配置文档（技术深入）
- 📖 安全最佳实践（专业建议）
- 📖 常见问题解答（快速排错）

### 3. 安全保障

- 🔒 .gitignore 保护
- 🔒 占位符机制
- 🔒 密钥轮换建议
- 🔒 最小权限原则

---

## 📞 联系方式

如有问题或建议：

1. 📖 查阅文档
2. 🛠️ 运行检查工具
3. 💬 联系项目维护者

---

**祝您配置顺利！** 🎉

如果有任何问题，随时查阅文档或寻求帮助~ 😊💕

---

**最后更新**: 2026-04-22  
**维护者**: 票管家Ai客服团队  
**版本**: v1.0.0
