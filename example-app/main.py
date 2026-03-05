import example_lib
import pydantic

def main():
    print(f"Pydantic version: {pydantic.__version__}")
    print(example_lib.hello())


if __name__ == "__main__":
    main()
