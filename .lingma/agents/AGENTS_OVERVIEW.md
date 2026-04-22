# 🤖 Agents 总览 - 票管家Ai客服项目

## 📋 概述

本项目包含4个专业化的AI Agents，每个Agent都针对特定的技术领域进行了深度优化和定制。这些Agents会在相应的开发场景中自动激活，为您提供专业、精准的技术支持。

---

## 🎯 Agents 列表

### 1. Frontend Developer Agent
**文件**: [.agents/frontend-developer-agent.md](./frontend-developer-agent.md)

**专长领域**:
- ✅ React 18 + TypeScript 前端开发
- ✅ Redux Toolkit 状态管理
- ✅ Arco Design 组件库
- ✅ 性能优化与用户体验
- ✅ RTC SDK集成（前端部分）

**适用场景**:
- 创建React组件
- 优化前端性能
- 解决TypeScript类型问题
- UI/UX实现建议
- 响应式设计

**激活关键词**: 
`react`, `component`, `typescript`, `redux`, `ui`, `frontend`, `样式`, `组件`

---

### 2. Backend API Agent
**文件**: [.agents/backend-api-agent.md](./backend-api-agent.md)

**专长领域**:
- ✅ Node.js (Koa) 后端开发
- ✅ Python (FastAPI) 异步服务
- ✅ RESTful API设计
- ✅ RAG检索增强
- ✅ LLM流式响应处理

**适用场景**:
- 创建API端点
- 数据库集成
- 认证授权实现
- 后端性能优化
- 错误处理策略

**激活关键词**: 
`api`, `backend`, `fastapi`, `koa`, `database`, `endpoint`, `接口`, `后端`

---

### 3. RTC Specialist Agent
**文件**: [.agents/rtc-specialist-agent.md](./rtc-specialist-agent.md)

**专长领域**:
- ✅ 火山引擎RTC SDK
- ✅ WebRTC技术
- ✅ 音视频流处理
- ✅ 网络优化与弱网处理
- ✅ 设备管理与权限控制

**适用场景**:
- RTC集成问题
- 音视频调试
- 网络质量优化
- 设备兼容性
- 实时通信故障排查

**激活关键词**: 
`rtc`, `webrtc`, `video`, `audio`, `camera`, `microphone`, `视频`, `音频`, `通话`

---

### 4. AI/LLM Integration Agent
**文件**: [.agents/ai-llm-integration-agent.md](./ai-llm-integration-agent.md)

**专长领域**:
- ✅ 豆包大模型（Ark）集成
- ✅ RAG检索增强生成
- ✅ 提示词工程
- ✅ 流式响应处理
- ✅ Token管理与成本控制

**适用场景**:
- LLM集成优化
- 提示词设计
- RAG知识库优化
- 响应速度提升
- 成本优化策略

**激活关键词**: 
`llm`, `ai`, `rag`, `prompt`, `token`, `大模型`, `提示词`, `知识库`, `智能`

---

## 🚀 如何使用Agents

### 自动激活

Agents会根据您的问题和上下文自动激活。您只需要自然地描述您的问题，AI会自动识别并应用相应Agent的专业知识。

**示例**:

```
用户: "帮我创建一个票务查询表单组件"
→ 自动激活: Frontend Developer Agent

用户: "如何优化LLM的响应速度？"
→ 自动激活: AI/LLM Integration Agent

用户: "为什么视频画面黑屏？"
→ 自动激活: RTC Specialist Agent

用户: "创建一个查询订单的API"
→ 自动激活: Backend API Agent
```

### 手动指定

如果您想明确指定使用某个Agent，可以在问题前加上Agent名称：

```
[Frontend] 如何优化这个React组件的性能？
[Backend] 帮我设计一个RESTful API
[RTC] 如何处理弱网环境下的视频卡顿？
[AI] 如何设计更好的系统提示词？
```

---

## 💡 使用技巧

### 1. 提供足够的上下文

**❌ 不好的提问**:
```
这个组件有问题
```

**✅ 好的提问**:
```
我的AiAvatarCard组件在移动端显示不正常，
视频画面被裁剪了。这是代码：[粘贴代码]
请问如何修复？
```

### 2. 明确您的需求

**❌ 模糊的需求**:
```
帮我优化一下
```

**✅ 明确的需求**:
```
这个API响应时间太长了（平均3秒），
希望能优化到1秒以内。
当前使用了RAG检索和LLM调用，
请问有哪些优化方案？
```

### 3. 分步骤提问

对于复杂问题，可以分步骤提问：

```
第1步: 如何设计票务系统的数据库表结构？
第2步: 基于这个表结构，如何创建查询API？
第3步: 如何为这个API添加缓存？
```

### 4. 提供错误信息

遇到问题时，提供完整的错误信息：

```
加入RTC房间时报错：
Error Code: 10001
Message: Invalid token
Token: [脱敏后的token]

请问可能是什么原因？
```

---

## 📊 Agents 协作示例

### 场景：实现一个完整的购票功能

**1. 前端开发** (Frontend Agent)
```
用户: 帮我创建一个购票表单组件

Frontend Agent: 
- 提供React组件代码
- 使用Arco Design组件
- 实现表单验证
- 添加响应式布局
```

**2. 后端API** (Backend Agent)
```
用户: 创建提交订单的API

Backend Agent:
- 设计POST /api/orders端点
- 实现数据验证
- 添加错误处理
- 提供API文档
```

**3. AI集成** (AI/LLM Agent)
```
用户: 如何让AI助手帮助用户填写表单？

AI Agent:
- 设计对话流程
- 优化提示词
- 实现意图识别
- 处理边界情况
```

**4. RTC通信** (RTC Agent)
```
用户: 如何实现视频客服功能？

RTC Agent:
- 集成RTC SDK
- 实现音视频通话
- 处理设备权限
- 优化网络质量
```

---

## 🔧 自定义Agents

如果现有Agents不能满足您的需求，您可以创建自定义Agent：

### 创建步骤

1. **复制模板**
```bash
cp .agents/frontend-developer-agent.md .agents/my-custom-agent.md
```

2. **修改配置**
```markdown
# My Custom Agent

## 🎯 Agent角色定义
**名称**: My Custom Agent
**专长领域**: ...

## 👤 角色设定
...
```

3. **添加到总览**
在 `AGENTS_OVERVIEW.md` 中添加新Agent的信息

4. **测试使用**
在实际开发中测试Agent的效果

---

## 📈 Agents 效果评估

### 评估指标

#### 1. 准确性
- 代码是否正确运行
- 解决方案是否有效
- 建议是否符合最佳实践

#### 2. 效率提升
- 开发时间缩短比例
- 问题解决速度
- 重复工作减少程度

#### 3. 学习价值
- 是否提供了新的知识点
- 是否解释了原理
- 是否有可复用的模式

### 反馈机制

如果您发现Agent的回答有问题，可以：

1. **指出问题**: "这个方案有性能问题，因为..."
2. **提供修正**: "应该这样改：..."
3. **要求优化**: "能否提供更高效的方案？"

AI会根据您的反馈调整后续的回答。

---

## 🎓 最佳实践

### 1. 选择合适的Agent

根据问题类型选择最相关的Agent：

| 问题类型 | 推荐Agent |
|---------|----------|
| React组件开发 | Frontend Developer |
| API设计 | Backend API |
| 音视频问题 | RTC Specialist |
| AI集成优化 | AI/LLM Integration |
| 跨领域问题 | 多个Agent协作 |

### 2. 结合Skills使用

Agents和Skills可以协同工作：

- **Skills**: 提供通用的最佳实践和规范
- **Agents**: 提供针对性的专业建议和代码

例如：
- 使用 `typescript-react-reviewer` Skill + Frontend Agent
- 使用 `fastapi-python` Skill + Backend Agent

### 3. 持续学习

Agents会随着您的使用不断学习和适应：

- 记住您的偏好
- 了解项目特点
- 优化回答风格

---

## 🔄 更新与维护

### 定期更新

建议每月检查一次Agents是否有更新：

```bash
# 查看Agents目录
ls -la .agents/

# 检查文件修改时间
stat .agents/*.md
```

### 版本管理

每个Agent都有版本号，记录在文件顶部：

```markdown
## 🎯 Agent角色定义
**名称**: Frontend Developer Agent
**版本**: 1.0.0
```

更新时递增版本号，并在更新日志中记录变更。

---

## 📚 相关资源

### 项目文档
- [SKILLS_RECOMMENDATION.md](../SKILLS_RECOMMENDATION.md) - Skills推荐
- [EASY_README.md](../EASY_README.md) - 项目架构说明
- [QUICK_START_SKILLS.md](../QUICK_START_SKILLS.md) - Skills快速开始

### 外部资源
- [React官方文档](https://react.dev/)
- [FastAPI文档](https://fastapi.tiangolo.com/)
- [火山引擎RTC文档](https://www.volcengine.com/docs/6348)
- [豆包大模型文档](https://www.volcengine.com/docs/82379)

---

## ❓ 常见问题

### Q1: Agents会影响性能吗？
**A**: 不会。Agents只是知识库和提示词的配置，不会影响代码执行性能。

### Q2: 可以同时使用多个Agents吗？
**A**: 可以。AI会根据上下文自动判断需要哪些Agent的知识，必要时会综合多个Agent的建议。

### Q3: 如何知道当前使用的是哪个Agent？
**A**: AI通常会在回答中体现Agent的专业特点。您也可以手动指定Agent来确认。

### Q4: Agents会过时吗？
**A**: 技术会更新，建议定期检查并更新Agents的内容，特别是依赖的库和最佳实践。

### Q5: 可以为不同项目创建不同的Agents吗？
**A**: 可以。您可以在不同项目中创建适合该项目特点的Agents。

---

## 🎯 下一步行动

1. ✅ **阅读Agents文档**: 了解每个Agent的专长和使用方法
2. ✅ **尝试使用**: 在实际开发中使用Agents获取帮助
3. ✅ **提供反馈**: 告诉AI哪些建议有用，哪些需要改进
4. ✅ **持续优化**: 根据项目演进更新Agents内容

---

**祝您使用愉快！** 🚀

如有任何问题或建议，欢迎随时反馈~ 😊
