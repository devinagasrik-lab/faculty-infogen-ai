import os
import openai
from dotenv import load_dotenv
load_dotenv()
openai.api_key = os.getenv("OPENAI_API_KEY")

def generate_faculty_summary(db_summary_text, max_tokens=300):
    prompt = f"Given this faculty data summary:\n\n{db_summary_text}\n\nWrite a clear, concise faculty achievement summary and top research highlights, and 3 professional development suggestions."
    resp = openai.ChatCompletion.create(
        model="gpt-4o-mini", # or gpt-4o, replace with what you have access to
        messages=[{"role":"system","content":"You are a university analytics assistant."},
                  {"role":"user","content":prompt}],
        max_tokens=max_tokens,
        temperature=0.2
    )
    return resp['choices'][0]['message']['content'].strip()
