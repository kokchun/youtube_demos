import logfire
from logfire import VariablesOptions
from dotenv import load_dotenv

load_dotenv()

# LOGFIRE_API_KEY
logfire.configure(variables=VariablesOptions())


def get_prompt(
    name: str = "coach_agent_instructions",
    default: str = "jokey assistant",
    label: str = "latest",
):
    prompt = logfire.var(name=f"prompt__{name}", type=str, default=default)
    prompt.refresh_sync(force=True)
    resolved = prompt.get(label=label)
    # print(resolved.label)
    return resolved.value

if __name__ == "__main__":
    prompt = get_prompt(name = "study_agent_instructions",label="production")
    print(prompt)
