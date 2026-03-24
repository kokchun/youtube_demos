from pydantic_ai import Agent
from customer_support.utils.constants import MODEL_MEDIUM
from dotenv import load_dotenv
from mlflow.genai.prompts import load_prompt

load_dotenv()

support_agent = Agent(
    model=MODEL_MEDIUM, system_prompt=load_prompt("support-agent-system-prompt").format()
)


@support_agent.tool_plain
def lookup_faq(category: str) -> str:
    f"""{load_prompt("lookup-faq-tool-description").format()}"""
    faq = {
        "refund": "Full refunds within 30 days with receipt.",
        "shipping": "Standard: 5-7 days. Express available.",
        "warranty": "1-year manufacturer warranty included.",
    }

    return faq.get(
        category,
        "Question not found. Inform customer that available categories are: refund, shipping, warranty",
    )
