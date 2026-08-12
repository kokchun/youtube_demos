from pathlib import Path
import os 
from dotenv import load_dotenv

load_dotenv()

COSMOS_URI = os.getenv("COSMOS_URI")
COSMOS_KEY = os.getenv("COSMOS_KEY")

FILMS_PATH = Path(__file__).parent / "films.json"
DB_ID = "FilmReviewDB"
CONTAINER_ID = "Films"
PARTITION_KEY = "/year"