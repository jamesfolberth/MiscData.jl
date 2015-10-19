# Census1990.jl

This is a simple Julia wrapper around a slightly preprocessed portion of the 1990 US Census data.  The datafiles are hosted by UCI: [Census 1990 dataset](https://archive.ics.uci.edu/ml/datasets/US+Census+Data+(1990))

The big data file is `USCensus1990.data.txt`, but there are others that describe the dataset.

In addition to the papers listed at the UCI repository, this dataset is also used in "Fast and Accurate k-means For Large Datasets" by Michael Shindler et al.

## Usage
Read the dataset into a `DataFrame`.
```
read_df(nrows=-1) -> df
read_df(data_filename, nrows=-1) -> df
```

Read the dataset into an `Array{eltype,2}` of size `(n_ex, n_dim)`.
```
read_array(nrows=-1, eltype=Float64) -> X
read_array(data_filename, nrows=-1, eltype=Float64) -> X
```
