# [MiscData.jl](https://github.com/jamesfolberth/MiscData.jl)

A collection of Julia wrappers for datasets I've used.

[RDatasets.jl](https://github.com/johnmyleswhite/RDatasets.jl) might also be of interest.

## Usage
First note that this isn't a Julia package, so it probably shouldn't be installed in `~/.julia/v0.*`.  Instead, you can add
```
push!(LOAD_PATH, "/path/to/repo")
```
to your `~/.juliarc.jl`.

Consider the `Census1990` dataset.  We can load the data into an array using the following code.
```
import MiscData
X = MiscData.Census1990.read_array(nrows=500000);
```
