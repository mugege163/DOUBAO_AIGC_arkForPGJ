# AIGC 交互式Demo - 简易说明文档

## 📖 项目概述

这是一个基于火山引擎AIGC-RTC技术的交互式AI对话Demo应用，实现了端到端的流式语音交互体验。用户可以通过语音与AI助手进行自然对话，支持实时音视频通信、语音识别、大模型推理和语音合成等完整链路。

**核心特点：**
- 🎙️ **流式语音交互**：实现从语音输入到AI响应的完整闭环
- 🤖 **智能AI助手**：集成豆包大模型，提供智能对话能力
- 📹 **多模态支持**：支持音频、视频、屏幕共享等多种交互方式
- 🌐 **实时通信**：基于RTC技术实现低延迟的音视频传输
- 📱 **响应式设计**：同时支持桌面端和移动端访问

## 🏗️ 系统架构

### 整体架构图

```
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│   前端界面层     │    │   后端服务层      │    │   云服务层       │
│                 │    │                  │    │                 │
│ React + TS      │◄──►│ Node.js/Koa      │◄──►│ 火山引擎RTC     │
│ Arco Design     │    │ Python/FastAPI   │    │ ASR/TTS/LLM     │
│ Redux状态管理    │    │                  │    │                 │
└─────────────────┘    └──────────────────┘    └─────────────────┘
```

### 技术栈详情

**前端技术栈：**
- **框架**: React 18 + TypeScript
- **UI组件库**: Arco Design
- **状态管理**: Redux Toolkit
- **路由**: React Router v6
- **构建工具**: Craco (Create React App配置扩展)
- **RTC SDK**: @volcengine/rtc

**后端服务：**
- **Node.js服务**: Koa框架，处理API代理和场景配置
- **Python服务**: FastAPI框架，处理LLM回调和RAG检索增强生成

## 📁 目录结构详解

```
ark_aigc_demo/
├── src/                    # 前端源代码
│   ├── components/         # 可复用UI组件
│   │   ├── Header/         # 页面头部组件
│   │   ├── AiAvatarCard/   # AI头像卡片
│   │   ├── FullScreenCard/ # 全屏显示卡片
│   │   └── ...            # 其他UI组件
│   ├── pages/             # 页面级组件
│   │   ├── MainPage/      # 主页面
│   │   │   ├── MainArea/  # 主要内容区域
│   │   │   │   ├── Antechamber/ # 等待室（加入前）
│   │   │   │   └── Room/        # 房间（加入后）
│   │   │   └── Menu/      # 侧边菜单
│   │   └── Mobile/        # 移动端专用组件
│   ├── lib/               # 核心业务逻辑
│   │   ├── RtcClient.ts   # RTC客户端封装
│   │   └── useCommon.ts   # 通用Hooks
│   ├── store/             # Redux状态管理
│   │   └── slices/        # 状态切片
│   ├── app/               # API接口定义
│   └── utils/             # 工具函数
├── Server/                # Node.js后端服务
│   ├── app.js            # Koa服务器入口
│   ├── token.js          # Token生成工具
│   └── scenes/           # 场景配置文件
├── rag_llm_server/        # Python LLM服务
│   ├── main.py           # FastAPI入口
│   ├── services/         # 业务服务层
│   │   ├── llm_service.py # LLM调用服务
│   │   ├── rag_service.py # RAG检索服务
│   │   └── token_build.py # Token构建工具
│   └── config.py         # 配置文件
└── public/               # 静态资源
```

## 🔧 核心功能模块

### 1. RTC实时通信模块

**位置**: `src/lib/RtcClient.ts`

负责处理所有RTC相关操作，包括：
- 创建和管理RTC引擎
- 加入/离开房间
- 音视频设备控制（麦克风、摄像头、屏幕共享）
- 发布/取消发布媒体流
- AI助手启动/停止控制

**关键方法:**
```typescript
- createEngine(): 创建RTC引擎实例
- joinRoom(): 加入RTC房间
- startAudioCapture(): 开始音频采集
- startVideoCapture(): 开始视频采集
- startAgent(): 启动AI助手
- commandAgent(): 向AI发送指令
```

### 2. 状态管理模块

**位置**: `src/store/`

使用Redux Toolkit进行全局状态管理，主要包含两个slice：

**room slice** (`slices/room.ts`):
- 房间状态（是否已加入）
- 用户信息
- 消息历史
- AI状态
- 场景配置

**device slice** (`slices/device.ts`):
- 设备权限状态
- 可用设备列表
- 当前选中设备

### 3. 页面组件模块

#### 主页面流程

```
Antechamber (等待室) → [点击加入] → Room (房间)
```

**Antechamber** (`MainArea/Antechamber/`):
- 场景选择卡片
- 加入按钮
- 设备预览

**Room** (`MainArea/Room/`):
- AI头像展示区
- 对话记录显示
- 工具栏（麦克风、摄像头、屏幕共享控制）
- 音频控制器

### 4. 后端服务模块

#### Node.js服务 (`Server/app.js`)

**主要功能:**
- 场景配置获取 (`/getScenes`)
- OpenAPI请求代理 (`/proxy`)
- RTC Token自动生成
- 跨域处理

**工作流程:**
1. 前端请求场景配置
2. 服务端读取`scenes/`目录下的JSON配置
3. 自动生成RTC Token
4. 返回配置给前端

#### Python服务 (`rag_llm_server/main.py`)

**主要功能:**
- LLM流式回调处理 (`/api/chat_callback`)
- RAG知识库检索
- 调试接口提供

**核心接口:**
- `POST /api/chat_callback`: 接收RTC的LLM回调请求，返回流式响应
- `GET /debug/rag`: 调试知识库检索结果
- `POST /debug/chat`: 调试聊天功能

### 5. AI交互流程

```
用户说话 → ASR语音识别 → LLM大模型推理 → TTS语音合成 → 播放给用户
     ↑                                                        ↓
     └────────────── 打断机制 ←──────────────────────────────┘
```

**关键技术点:**
- **ASR**: 火山引擎语音识别服务
- **LLM**: 豆包大模型，支持流式输出
- **TTS**: 火山引擎语音合成服务
- **打断机制**: 支持用户在AI回答过程中打断并重新提问

## ⚙️ 配置说明

### 环境变量配置

需要在项目中配置以下环境变量：

**Python服务 (.env文件):**
```env
VOLC_AK=your_access_key
VOLC_SK=your_secret_key
RTC_APP_ID=your_rtc_app_id
RTC_APP_KEY=your_rtc_app_key
SERVER_URL=http://localhost:3001
```

**场景配置 (Server/scenes/Custom.json):**
```json
{
  "SceneConfig": {
    "name": "自定义助手",
    "icon": "..."
  },
  "RTCConfig": {
    "AppId": "...",
    "AppKey": "..."
  },
  "VoiceChat": {
    "AgentConfig": {
      "UserId": "AiAgent",
      "WelcomeMessage": "欢迎语"
    },
    "Config": {
      "ASRConfig": {...},
      "TTSConfig": {...},
      "LLMConfig": {...}
    }
  }
}
```

## 🚀 快速开始

### 前置要求

- Node.js >= 16
- Python >= 3.8
- npm 或 yarn

### 安装步骤

1. **安装前端依赖**
```bash
npm install
```

2. **安装Python依赖**
```bash
cd rag_llm_server
pip install -r requirements.txt
# 或使用 uv
uv sync
```

3. **配置环境变量**
- 复制 `.env.example` 为 `.env`
- 填写必要的密钥和配置

### 启动服务

**方式一：分别启动**

1. 启动Node.js服务
```bash
npm run server:start
# 服务运行在 http://localhost:3001
```

2. 启动Python服务
```bash
cd rag_llm_server
python main.py
# 服务运行在 http://localhost:3001
```

3. 启动前端开发服务器
```bash
npm run dev
# 前端运行在 http://localhost:3000
```

**方式二：一键启动**
```bash
npm run dev
```

### 访问应用

浏览器打开 `http://localhost:3000` 即可体验。

## 💡 使用指南

### 基本操作流程

1. **选择场景**: 在等待室页面选择合适的AI助手场景
2. **加入房间**: 点击"开始对话"按钮
3. **授权设备**: 允许浏览器访问麦克风（和摄像头）
4. **开始对话**: 直接说话，AI会自动识别并回应
5. **控制设备**: 使用底部工具栏控制麦克风、摄像头等
6. **结束对话**: 关闭页面或切换标签页自动离开

### 高级功能

**屏幕共享:**
- 点击工具栏的屏幕共享按钮
- 选择要共享的窗口或整个屏幕
- AI可以"看到"你共享的内容（如果启用了视觉功能）

**打断AI:**
- 在AI回答过程中直接说话
- 系统会自动中断当前回答并开始处理新问题

**查看字幕:**
- 开启字幕功能可实时显示对话内容
- 方便在嘈杂环境中使用

## 🔍 调试技巧

### 前端调试

1. **打开开发者工具**
   - 查看Console日志了解RTC状态
   - Network面板监控API请求

2. **Redux DevTools**
   - 安装Redux DevTools扩展
   - 实时查看状态变化

### 后端调试

1. **Node.js服务日志**
   - 查看控制台输出的请求和响应
   - 检查Token生成是否正确

2. **Python服务日志**
   - 查看LLM回调的详细过程
   - 使用调试接口测试RAG检索
   ```bash
   curl "http://localhost:3001/debug/rag?query=测试问题"
   ```

### 常见问题排查

**问题1: 无法加入房间**
- 检查RTC AppId和Token是否正确
- 确认浏览器支持WebRTC
- 检查网络连接

**问题2: 没有声音**
- 检查麦克风权限是否授予
- 确认扬声器设备正常
- 查看浏览器控制台是否有错误

**问题3: AI不回应**
- 检查Python服务是否正常运行
- 确认LLM配置中的回调地址正确
- 查看Python服务日志了解详细错误

## 📊 性能优化建议

1. **网络优化**
   - 使用CDN加速静态资源
   - 启用gzip压缩
   - 合理设置缓存策略

2. **RTC优化**
   - 根据网络状况调整音视频质量
   - 启用AI降噪功能
   - 合理使用订阅策略

3. **前端优化**
   - 代码分割和懒加载
   - 避免不必要的重渲染
   - 使用React.memo优化组件

## 🔐 安全注意事项

1. **密钥管理**
   - 不要将AK/SK提交到版本控制系统
   - 使用环境变量管理敏感信息
   - 定期轮换密钥

2. **Token安全**
   - Token设置合理的过期时间
   - 使用HTTPS传输
   - 验证Token权限

3. **内容安全**
   - 对用户输入进行过滤
   - 设置LLM的安全策略
   - 记录敏感操作日志

## 📝 开发规范

### 代码风格

- 遵循TypeScript严格模式
- 使用ESLint和Prettier保持代码一致性
- 组件采用函数式写法 + Hooks

### 命名规范

- 组件名: PascalCase (如 `AiAvatarCard`)
- 文件名: kebab-case (如 `ai-avatar-card.tsx`)
- 变量名: camelCase (如 `isJoined`)
- 常量名: UPPER_SNAKE_CASE (如 `MAX_RETRY_COUNT`)

### Git提交规范

```
feat: 新功能
fix: 修复bug
docs: 文档更新
style: 代码格式调整
refactor: 重构
test: 测试相关
chore: 构建/工具链相关
```

## 🤝 贡献指南

欢迎提交Issue和Pull Request！

1. Fork本仓库
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启Pull Request

## 📄 许可证

本项目采用 BSD-3-Clause 许可证。详见 [LICENSE](LICENSE) 文件。

## 📞 支持与反馈

- 📧 问题反馈: 提交GitHub Issue
- 📖 文档: 参考火山引擎官方文档
- 💬 社区: 加入开发者交流群

## 🔗 相关链接

- [火山引擎RTC文档](https://www.volcengine.com/docs/6348)
- [豆包大模型文档](https://www.volcengine.com/docs/82379)
- [React官方文档](https://react.dev/)
- [Arco Design文档](https://arco.design/)

---

**最后更新**: 2026-04-22  
**版本**: 1.6.0

*注: 本文档旨在帮助开发者快速理解和使用本项目，如有任何问题欢迎反馈。*
