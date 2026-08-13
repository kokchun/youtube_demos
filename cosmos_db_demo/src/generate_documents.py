import json
from azure.cosmos import CosmosClient, PartitionKey
from constants import (
    COSMOS_KEY,
    COSMOS_URI,
    DB_ID,
    CONTAINER_ID,
    PARTITION_KEY,
    FILMS_PATH,
)


def create_cosmos_db_container(url, key, db_id, container_id, partition_key):
    client = CosmosClient(url, credential=key)

    database = client.create_database_if_not_exists(id=db_id)

    container = database.create_container_if_not_exists(
        id=container_id, partition_key=PartitionKey(path=partition_key)
    )

    return container


def connect_cosmos_db_container(url, key, db_id, container_id):
    client = CosmosClient(url, credential=key)
    database = client.get_database_client(db_id)
    container = database.get_container_client(container_id)
    return container


def insert_documents(container, document_path):
    with open(document_path, "r", encoding="utf-8") as f:
        films = json.load(f)

    for film in films:
        container.upsert_item(film)
        print(f"Film inserted: {film['title']}")


if __name__ == "__main__":
    # film_container = create_cosmos_db_container(
    #     COSMOS_URI, COSMOS_KEY, DB_ID, CONTAINER_ID, PARTITION_KEY
    # )

    film_container = connect_cosmos_db_container(
        COSMOS_URI, COSMOS_KEY, DB_ID, CONTAINER_ID
    )

    insert_documents(film_container, document_path=FILMS_PATH)
