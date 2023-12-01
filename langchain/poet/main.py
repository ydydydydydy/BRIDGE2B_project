from dotenv import load_dotenv
load_dotenv()

import streamlit as st
from langchain.chat_models import ChatOpenAI
import langchain
import openai
import pandas as pd
import os
from langchain.chains import RetrievalQA
from langchain.llms import OpenAI
from langchain.document_loaders import TextLoader
from langchain.chat_models import ChatOpenAI
from langchain.llms import OpenAI
from langchain.agents.agent_types import AgentType
from langchain_experimental.agents.agent_toolkits import create_csv_agent

# 기존 코드
# 기존 코드
os.environ['OPENAI_API_KEY'] = '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'
df = pd.read_csv('C:\langchain\poet\company2.csv')

# create_csv_agent 함수를 통해 agent 변수 생성
agent = create_csv_agent(
    ChatOpenAI(temperature=0, model="gpt-4"),
    'C:\langchain\poet\company2.csv',
    verbose=True,
    agent_type=AgentType.OPENAI_FUNCTIONS
)

# 핵심 기술 부분
def ask_question(question):
    try:
        result = agent.run(question)
        return result
    except Exception as e:
        st.error(f"에러 발생: {e}")

# 나머지 코드
chat_model = ChatOpenAI()
st.title('회사 정보 프로그램')
content = st.text_input("원하는 정보를 검색하세요")
if st.button('정보 요청하기'):
    result = ask_question(content)
    st.write(result)
