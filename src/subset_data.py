# %% [code]
from os import path

import pandas as pd


# handle the path in a tidy way
current_path = path.abspath("")

input_filepath = path.join(current_path, "..", "data/data.csv")


df = pd.read_csv(input_filepath)

print("Full data:")
print(df.shape)
print(df.head())


# %% [code]
# get a 5% sample of the data
df_sample = df.sample(frac=0.05)

print("Sampled data:")
print(df_sample.shape)
print(df_sample.head())


# %% [code]
# write the sample to a new csv file
output_filepath = path.join(current_path, "..", "data/data_sample.csv")

df_sample.to_csv(output_filepath, index=False)
