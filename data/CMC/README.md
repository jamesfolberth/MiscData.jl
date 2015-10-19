# CMC.jl

This is a simple Julia wrapper around the contraceptive method choice (CMC) dataset.  The dataset is hosted by UCI: [CMC dataset](https://archive.ics.uci.edu/ml/datasets/Contraceptive+Method+Choice)

The main data file is `cmc.data`.

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
