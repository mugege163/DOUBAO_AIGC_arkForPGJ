# 环境配置说明 - 票管家Ai客服项目

## 📋 概述

本文档说明项目中所有需要配置的敏感信息和环境变量。为了保护您的密钥安全，请勿将真实的密钥提交到版本控制系统。

---

## 🔐 敏感信息清单

### 1. 火山引擎账号凭证

**位置**: `Server/scenes/Custom.json`

```json
{
  "AccountConfig": {
    "accessKeyId": "YOUR_VOLC_ACCESS_KEY_HERE",
    "secretKey": "YOUR_VOLC_SECRET_KEY_HERE"
  }
}
```

**说明**:
- `accessKeyId`: 火山引擎 AccessKey ID
- `secretKey`: 火山引擎 Secret Key
- **获取方式**: https://console.volcengine.com/iam/keymanage/
- **用途**: 用于签名火山引擎 OpenAPI 请求

**⚠️ 安全提示**:
- 切勿将真实密钥提交到 Git
- 定期轮换密钥
- 使用最小权限原则

---

### 2. RTC 服务配置

**位置**: `Server/scenes/Custom.json`

```json
{
  "RTCConfig": {
    "AppId": "YOUR_RTC_APP_ID_HERE",
    "AppKey": "YOUR_RTC_APP_KEY_HERE",
    "RoomId": "ChatRoom01",
    "UserId": "Huoshan01",
    "Token": ""
  }
}
```

**说明**:
- `AppId`: RTC 应用ID
- `AppKey`: RTC 应用密钥（用于生成 Token）
- `RoomId`: 房间ID（可自定义）
- `UserId`: 用户ID（可自定义）
- `Token`: 会自动生成，无需手动填写

**获取方式**: https://console.volcengine.com/rtc/aigc/listRTC

---

### 3. VoiceChat 配置

**位置**: `Server/scenes/Custom.json`

```json
{
  "VoiceChat": {
    "AppId": "YOUR_RTC_APP_ID_HERE",
    "RoomId": "ChatRoom01",
    "TaskId": "ChatTask01"
  }
}
```

**说明**:
- `AppId`: 与 RTCConfig.AppId 保持一致
- `RoomId`: 与 RTCConfig.RoomId 保持一致
- `TaskId`: 任务ID，可自定义

---

### 4. ASR 语音识别配置

**位置**: `Server/scenes/Custom.json`

```json
{
  "ASRConfig": {
    "ProviderParams": {
      "AppId": "YOUR_ASR_APP_ID_HERE",
      "Cluster": "volcengine_streaming_common"
    }
  }
}
```

**说明**:
- `AppId`: ASR 服务 AppId
- `Cluster`: ASR 集群名称
- **获取方式**: 火山引擎控制台 - 语音技术

---

### 5. TTS 语音合成配置

**位置**: `Server/scenes/Custom.json`

```json
{
  "TTSConfig": {
    "ProviderParams": {
      "app": {
        "appid": "YOUR_TTS_APP_ID_HERE",
        "cluster": "volcano_tts"
      }
    }
  }
}
```

**说明**:
- `appid`: TTS 服务 AppId
- `cluster`: TTS 集群名称
- **获取方式**: 火山引擎控制台 - 语音技术

---

## 🌍 Python 后端环境变量

**位置**: `rag_llm_server/.env` (需自行创建)

### 环境变量清单

```bash
# ============================================
# 火山引擎凭证
# ============================================
VOLC_ACCESS_KEY=YOUR_VOLC_ACCESS_KEY_HERE
VOLC_SECRET_KEY=YOUR_VOLC_SECRET_KEY_HERE

# 火山引擎主账号ID (知识库服务需要)
VOLC_ACCOUNT_ID=kb-2580e8a6357082fb

# ============================================
# RTC 配置
# ============================================
RTC_APP_ID=YOUR_RTC_APP_ID_HERE
RTC_APP_KEY=YOUR_RTC_APP_KEY_HERE

# ============================================
# 豆包大模型配置
# ============================================
ARK_API_KEY=YOUR_ARK_API_KEY_HERE
ARK_ENDPOINT_ID=ep-2024xxxxxxxxxxxxx  # 你的模型端点ID

# ============================================
# 服务器配置
# ============================================
SERVER_URL=http://localhost:3001

# ============================================
# 知识库配置
# ============================================
KB_COLLECTION_NAME=ticket_guide
KB_PROJECT_NAME=default
```

### 变量详细说明

| 变量名 | 说明 | 获取方式 |
|--------|------|----------|
| `VOLC_ACCESS_KEY` | 火山引擎 AccessKey | IAM 控制台 |
| `VOLC_SECRET_KEY` | 火山引擎 SecretKey | IAM 控制台 |
| `VOLC_ACCOUNT_ID` | 火山引擎主账号ID | 账号中心 |
| `RTC_APP_ID` | RTC 应用ID | RTC 控制台 |
| `RTC_APP_KEY` | RTC 应用密钥 | RTC 控制台 |
| `ARK_API_KEY` | 豆包大模型 API Key | Ark 控制台 |
| `ARK_ENDPOINT_ID` | 模型端点ID | Ark 控制台 - 在线推理 |
| `SERVER_URL` | 服务器地址 | 本地开发用 localhost |
| `KB_COLLECTION_NAME` | 知识库集合名称 | 自定义 |
| `KB_PROJECT_NAME` | 知识库项目名称 | 自定义 |

---

## 📝 配置步骤

### 步骤 1: 创建 .env 文件

```bash
cd rag_llm_server
cp .env.example .env  # 如果存在示例文件
# 或者手动创建
touch .env
```

### 步骤 2: 填写环境变量

编辑 `rag_llm_server/.env` 文件，填入真实的配置值。

### 步骤 3: 配置场景文件

编辑 `Server/scenes/Custom.json`，将所有 `YOUR_*_HERE` 占位符替换为真实值。

### 步骤 4: 验证配置

启动服务后，检查日志确认配置是否正确加载。

---

## 🔒 安全最佳实践

### 1. .gitignore 配置

确保以下文件已添加到 `.gitignore`：

```gitignore
# 环境变量文件
.env
.env.local
.env.production

# 包含密钥的配置文件
Server/scenes/*.local.json
```

### 2. 使用环境变量管理工具

推荐使用以下工具管理敏感信息：

- **开发环境**: `.env` 文件
- **生产环境**: 
  - Docker Secrets
  - Kubernetes Secrets
  - AWS Secrets Manager
  - HashiCorp Vault

### 3. 密钥轮换

建议每 90 天轮换一次密钥：

1. 在火山引擎控制台创建新密钥
2. 更新项目配置
3. 重启服务
4. 删除旧密钥

### 4. 最小权限原则

为不同的服务创建独立的 AccessKey：

- RTC 服务专用密钥
- ASR/TTS 服务专用密钥
- LLM 服务专用密钥

---

## 🆘 常见问题

### Q1: 如何获取火山引擎 AccessKey？

**A**: 
1. 登录火山引擎控制台
2. 进入 IAM - 访问控制
3. 点击"密钥管理"
4. 创建或查看 AccessKey

### Q2: RTC AppId 和 AppKey 在哪里获取？

**A**:
1. 登录火山引擎控制台
2. 进入 RTC - AIGC 场景
3. 创建或选择应用
4. 查看 AppId 和 AppKey

### Q3: 如何获取 ARK API Key？

**A**:
1. 登录火山引擎控制台
2. 进入 Ark - 大模型服务
3. 创建 API Key
4. 复制并保存（只显示一次）

### Q4: 配置后服务启动失败怎么办？

**A**:
1. 检查 `.env` 文件格式是否正确
2. 确认所有必填变量都已填写
3. 查看服务日志中的错误信息
4. 验证密钥是否有效且未过期

### Q5: 如何在生产中管理密钥？

**A**:
不要使用 `.env` 文件，改用：
- 容器编排平台的 Secrets 功能
- 云服务商的密钥管理服务
- 专业的密钥管理工具（如 Vault）

---

## 📚 相关文档

- [火山引擎 IAM 文档](https://www.volcengine.com/docs/6257/64975)
- [RTC 控制台](https://console.volcengine.com/rtc/aigc/listRTC)
- [Ark 大模型文档](https://www.volcengine.com/docs/82379)
- [语音技术文档](https://www.volcengine.com/docs/6561)

---

## ⚠️ 重要提醒

1. **永远不要**将真实密钥提交到 Git
2. **定期轮换**所有密钥
3. **使用最小权限**原则分配密钥权限
4. **监控密钥使用**情况，发现异常立即撤销
5. **备份配置**时确保密钥已脱敏

---

**最后更新**: 2026-04-22  
**版本**: v1.0.0

如有配置问题，请参考本文档或联系技术支持~ 😊
