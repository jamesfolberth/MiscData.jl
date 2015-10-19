# [MiscData.jl](https://github.com/jamesfolberth/MiscData.jl)

A collection of Julia wrappers for datasets I've used.

[RDatasets.jl](https://github.com/johnmyleswhite/RDatasets.jl) might also be of interest.

## Usage
First note that this isn't a Julia package, so it probably shouldn't be installed in `~/.julia/v0.*`.  Instead, you can add
```
push!(LOAD_PATH, "/path/to/repo")
```
to your `~/.juliarc.jl`.

Consider the `Iris` dataset.  We can load the data into an `DataFrame` using
```
import MiscData
df = MiscData.Iris.read_df();
```
For the `Iris` dataset, there is also a routine to load the data into an array of data and a vector of class labels

```
X, y = MiscData.Iris.read_array();
```
