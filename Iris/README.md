# Iris.jl

This is a simple Julia wrapper around Fisher's Iris dataset.  The dataset is hosted by UCI: [Iris dataset](https://archive.ics.uci.edu/ml/datasets/Iris)

The main data file is `bezdekIris.data`, but there is also `iris.data`.  Note that `iris.data` contains a couple differences from Fisher's original paper.

## Usage
Read the dataset into a `DataFrame`.
```
read_df() -> df
read_df(data_filename) -> df
```

Read the dataset into an `Array{eltype,2}` of size `(n_ex, n_dim)`.
```
read_array(eltype=Float64) -> X, y
read_array(data_filename, eltype=Float64) -> X, y
```
