# /// script
# requires-python = ">=3.12"
# dependencies = [
#     "example-lib",
# ]
#
# [tool.uv.sources]
# example-lib = { path = "../example-lib", editable = true }
# ///

import example_lib
import pydantic

def main() -> None:
    print(f"Pydantic version: {pydantic.__version__}")
    print(example_lib.hello())


if __name__ == "__main__":
    main()
