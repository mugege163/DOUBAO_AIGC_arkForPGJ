# 🚀 快速配置指南 - 5分钟完成所有配置

## 📋 当前状态

✅ **场景配置文件**: Custom.json 已完成脱敏（占位符已设置）  
⏳ **环境变量文件**: .env 需要创建和配置  
⏳ **依赖安装**: Node.js 和 Python 依赖需要安装  

---

## ⚡ 快速开始（3个步骤）

### 步骤 1: 创建并配置 .env 文件（2分钟）

```powershell
# 进入Python后端目录
cd rag_llm_server

# 复制模板文件
copy .env.example .env

# 用记事本打开编辑
notepad .env
```

**需要修改的变量**（将 `YOUR_*_HERE` 替换为真实值）：

```bash
# 🔑 火山引擎凭证（必需）
VOLC_ACCESS_KEY=你的AccessKey_ID
VOLC_SECRET_KEY=你的Secret_Key

# 📡 RTC配置（必需）
RTC_APP_ID=你的RTC_AppId
RTC_APP_KEY=你的RTC_AppKey

# 🤖 AI模型配置（必需）
ARK_API_KEY=你的Ark_API_Key
ARK_ENDPOINT_ID=你的模型端点ID
```

**💡 如何获取这些密钥？**

| 密钥 | 获取地址 |
|------|---------|
| AccessKey/SecretKey | https://console.volcengine.com/iam/keymanage/ |
| RTC AppId/AppKey | https://console.volcengine.com/rtc/aigc/listRTC |
| ARK API Key | https://console.volcengine.com/ark/region:ark+cn-beijing/apiKey |
| ARK Endpoint ID | Ark控制台 → 在线推理 → 创建推理接入点 |

保存后关闭记事本。

---

### 步骤 2: 配置场景文件（1分钟）

```powershell
# 返回项目根目录
cd ..

# 用文本编辑器打开Custom.json
notepad Server\scenes\Custom.json
```

**需要修改的内容**：

找到以下行，将占位符替换为真实值：

```json
{
  "AccountConfig": {
    "accessKeyId": "你的AccessKey_ID",      // ← 修改这里
    "secretKey": "你的Secret_Key"           // ← 修改这里
  },
  "RTCConfig": {
    "AppId": "你的RTC_AppId",               // ← 修改这里
    "AppKey": "你的RTC_AppKey",             // ← 修改这里
    ...
  }
}
```

保存后关闭。

---

### 步骤 3: 验证配置（30秒）

```powershell
# 运行配置检查脚本
.\check-config.ps1
```

如果看到 `🎉 All checks passed!` 说明配置成功！  
如果有红色错误，根据提示修复即可。

---

## 📦 安装依赖（首次运行需要）

### Node.js 依赖

```powershell
# 前端依赖
npm install

# 后端依赖
cd Server
npm install
cd ..
```

### Python 依赖

```powershell
# 创建虚拟环境
cd rag_llm_server
python -m venv .venv

# 激活虚拟环境
.venv\Scripts\Activate

# 安装依赖
pip install -r requirements.txt
```

---

## 🎯 启动服务

### 方式1: 分别启动（推荐用于开发）

```powershell
# 终端1: 启动Node.js后端
npm run server:start

# 终端2: 启动Python后端
cd rag_llm_server
.venv\Scripts\Activate
python main.py

# 终端3: 启动前端
cd ..
npm run dev
```

### 方式2: 使用一键启动（如果配置了）

```powershell
npm run dev:all
```

---

## ✅ 验证是否成功

### 检查点1: Node.js后端

访问 http://localhost:3001  
应该看到服务正常运行，没有报错。

### 检查点2: Python后端

查看控制台输出，应该看到：
```
INFO:     Uvicorn running on http://0.0.0.0:8000
```

### 检查点3: 前端

访问 http://localhost:3000  
应该能看到票管家Ai客服界面。

---

## 🔧 常见问题

### Q1: .env 文件在哪里？

**A**: 在 `rag_llm_server/.env`，需要从 `.env.example` 复制创建。

### Q2: 如何知道密钥是否正确？

**A**: 运行 `.\check-config.ps1`，如果显示 "All checks passed" 说明格式正确。实际有效性需要启动服务后测试。

### Q3: 服务启动失败怎么办？

**A**: 
1. 检查控制台错误信息
2. 确认所有密钥都已正确填写
3. 确认依赖已安装
4. 查看详细文档：CONFIG_GUIDE.md

### Q4: 可以跳过某些配置吗？

**A**: 
- **必需配置**（不填无法运行）:
  - VOLC_ACCESS_KEY / VOLC_SECRET_KEY
  - RTC_APP_ID / RTC_APP_KEY
  - ARK_API_KEY / ARK_ENDPOINT_ID
  
- **可选配置**（有默认值）:
  - VOLC_ACCOUNT_ID（已有默认值）
  - SERVER_URL（默认 localhost:3001）

---

## 📚 详细文档

- [CONFIG_GUIDE.md](./CONFIG_GUIDE.md) - 完整配置说明
- [SENSITIVE_INFO_REPORT.md](./SENSITIVE_INFO_REPORT.md) - 敏感信息报告
- [EASY_README.md](./EASY_README.md) - 项目说明

---

## 💡 小贴士

1. **安全第一**: 永远不要将 `.env` 文件提交到 Git
2. **定期检查**: 每月运行一次 `check-config.ps1`
3. **密钥轮换**: 每90天更换一次密钥
4. **备份配置**: 定期备份配置（记得脱敏）

---

**配置完成后，就可以开始使用票管家Ai客服啦！** 🎉

如有问题，随时查阅文档或联系技术支持~ 😊💕
