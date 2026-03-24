from fastapi import FastAPI
from contextlib import asynccontextmanager
import mlflow
from customer_support.utils.constants import MONITORING_PATH
from customer_support.backend.middlewares import logging_middleware

mlflow.set_tracking_uri(f"sqlite:///{MONITORING_PATH / 'mlflow.db'}")
mlflow.set_experiment("customer-support-bot")
mlflow.pydantic_ai.autolog()

from customer_support.backend.agents import support_agent


@asynccontextmanager
async def lifespan(app: FastAPI):

    app.state.support_agent = support_agent

    yield

    mlflow.end_run()


app = FastAPI(lifespan=lifespan)
logging_middleware(app)

@app.get("/health")
async def health():
    return {"status": "ok"}

@app.get("/customer_support")
async def customer_support_faq(question: str) -> str:
    """ask question to our customer support bot"""
    result = await app.state.support_agent.run(question)
    return result.output


