from pydantic_ai import Agent
from rag.backend.constants import VECTOR_DB_PATH, MODEL
import lancedb
from rag.backend.data_models import RagResponse

vector_db = lancedb.connect(uri=VECTOR_DB_PATH)

rag_agent = Agent(
    model=MODEL,
    system_prompt="You are an animal expert who loves helping young pet owners (ages 10-15).",
    output_type=RagResponse,
)


@rag_agent.tool_plain
def retrieve_top_documents(query: str, k: int = 3) -> str:
    """retrieves top k documents"""
    k = int(k)

    results = _retrieve(query, k)

    return "\n\n".join(
        f"""Filename: {result["metadata"]["source"]}\
        Filepath: {result["metadata"]["filepath"]}\
        Content: {result["page_content"]}"""
        for result in results
    )


def _retrieve(query: str, k: int) -> list[dict]:
    results = vector_db["articles"].search(query=query).limit(k).to_list()
    return [
        {
            "page_content": result["content"],
            "metadata": {
                "source": result.get("document_name", ""),
                "filepath": result.get("filepath", ""),
            },
        }
        for result in results
    ]


async def bot_answer(question: str):
    result = await rag_agent.run(question)
    return result.output
