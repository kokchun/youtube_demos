from pathlib import Path

MONITORING_PATH = Path(__file__).parents[1] / "monitoring"

MODEL_SMALL = "openrouter:openai/gpt-oss-20b:free"
MODEL_MEDIUM = "openrouter:nvidia/nemotron-3-nano-30b-a3b:free"
MODEL_LARGE = "openrouter:openai/gpt-oss-120b:free"

LLM_JUDGE = "openrouter:/openai/gpt-oss-120b:free"