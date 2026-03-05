from pydantic import BaseModel

def hello() -> str:
    class Greeting(BaseModel):
        message: str

    greeting = Greeting(message="Hello from example-lib!")
    print(greeting)
