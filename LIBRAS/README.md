# LIBRAS.jl

This is a simple Julia wrapper for a dataset of hand movement type in LIBRAS, the official Brazilian sign language.  The dataset is hosted by UCI: [LIBRAS Movements](https://archive.ics.uci.edu/ml/datasets/Libras+Movement)

The main data file is `movement_libras.data`.

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
