# %% [markdown]
# # Run mod1

# %% [code]
import os
from mod1.utils import mod1_test

# %% [code]
mod1_test()

# %% [code]
param1 = os.getenv("arg1")
param2 = os.getenv("arg2")

print(f"param1: {param1}")
print(f"param2: {param2}")
