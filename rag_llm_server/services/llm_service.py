import os
from volcenginesdkarkruntime import Ark 
from config import settings

class LLMService:
    def __init__(self):
        api_key = settings.ARK_API_KEY 
        self.client = Ark(
            base_url="https://ark.cn-beijing.volces.com/api/v3",    
            api_key=api_key, 
            timeout=1800, 

        )

    def chat_stream(self, history_messages: list, rag_context: str = ""):
        """
        流式对话 - 票管家购票助手
        :param history_messages: 对话历史
        :param rag_context: 从 rag_service 检索出来的票管家购票知识
        """
        if not self.client:
            yield "服务配置错误"
            return

        # --- 1. 定义票管家Ai客服的系统提示词 ---
        # 使用三引号，保持代码与输出格式一致
        system_content = """
        # 角色
        你是【票管家Ai客服】，票管家官方智能购票引导助手。你的说话风格：**温柔、耐心、细致、贴心**。
        
        # 核心任务
        1. 依据【参考知识库】回答购票咨询。
        2. 知识库有内容：直接提供准确的购票指导信息。
        3. 知识库没内容：引导用户联系人工客服。
        
        # 行为准则
        - **温和耐心**：用亲切的语气，多使用"请您"、"温馨提示"等敬语。
        - **准确性**：严格按照铁路规定和12306规则提供信息，不得编造购票政策。
        - **服务意识**：以帮助用户顺利购票为核心目标，提供贴心服务。
        
        # 常用金句（优先从库里取）
        - "请您放心，我会详细帮您学会使用我们票管家进行团体票购买哦。"
        - "温馨提示：提前购票、下定预购单更容易兑现哦。"
        - "别担心，我在这里为您服务。"
                """.strip()

        # --- 2. 构造最终发送给模型的消息序列 ---
        # messages = [{"role": "system", "content": system_content}]

        system_blocks = [system_content]

        if rag_context:
            # 使用明确的定界符，帮助模型在毫秒内定位知识
            system_blocks.append(f"### 票管家购票知识库（权威参考）\n{rag_context.strip()}")

        # 合并为一条
        final_system_prompt = "\n\n".join(system_blocks)

        # 最终的消息序列
        messages = [{"role": "system", "content": final_system_prompt}]

        # 加入历史对话（确保包含用户最新的问题）
        messages.extend(history_messages)

        try:
            print(f"🚀 票管家Ai客服发起流式调用 (Endpoint: {settings.ARK_ENDPOINT_ID})")
            
            stream = self.client.chat.completions.create(
                model=settings.ARK_ENDPOINT_ID,
                messages=messages,
                temperature=0.3, # 降低随机性，确保回答更严谨地贴合 RAG
                stream=True,
                stream_options={"include_usage": True},
            )

            for chunk in stream:
                yield chunk

        except Exception as e:
            print(f"❌ 票管家LLM调用失败: {e}")
            yield None

llm_service = LLMService()