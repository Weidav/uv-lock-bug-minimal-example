#!/bin/bash

echo "-- lock and run the script, which should work fine --"
cd scripts/
uv lock --script example-script.py
uv run --script example-script.py

echo -e "\n\n-- same for the app --"
cd ../example-app/
uv lock
uv run --locked main.py

echo -e "\n\n-- upgrad pydantic in the example-lib --"
cd ../example-lib/
uv add pydantic==2.12.5

echo -e "\n\n-- clean the cache to make sure its not a caching issue --"
uv cache clean

echo -e "\n\n-- now the script should fail but still runs with the old version of pydantic, which is a bug --"
cd ../scripts/
uv run --locked --script example-script.py

echo -e "\n\n-- the lockfile doesnt update to the new version of pydantic, which is a bug and still runs with the old version of pydantic --"
uv lock --script example-script.py
uv run --locked --script example-script.py

echo -e "\n\n-- explicitly upgrading the package works, but it shouldnt be necessary --"
uv lock --script example-script.py --upgrade-package example-lib
uv run --locked --script example-script.py

echo -e "\n\n-- the app fails as expected --"
cd ../example-app/
uv run --locked main.py

echo -e "\n\n-- after a new lock it updates the lockfile to the new version of pydantic, as expected and runs fine --"
uv lock
uv run --locked main.py
