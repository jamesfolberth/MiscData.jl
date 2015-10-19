"""
Module to parse and subsample the Census 1990 dataset.  Note that the Census1990 
dataset is pre-shuffled, so we do not shuffle in this module.

https://archive.ics.uci.edu/ml/datasets/US+Census+Data+(1990)
"""

module Census1990

import DataFrames
DF = DataFrames

path_to_datafile = dirname(@__FILE__)*"/USCensus1990.data.txt"

"""
`read_df(nrows=-1) -> df`\\
`read_df(data_filename, nrows=-1) -> df`

Read the dataset into a `DataFrame`.
"""
function read_df{S<:AbstractString}(
      path::S=path_to_datafile;
      nrows::Integer=-1)

   path = UTF8String(path)
   df = DF.readtable(path, header=true, separator=',', nrows=nrows)
   
   return df
end


"""
`read_array(nrows=-1, eltype=Float64) -> X`\\
`read_array(data_filename, nrows=-1, eltype=Float64) -> X`

Read the dataset into an `Array{eltype,2}` of size `(n_ex, n_dim)`.
"""
function read_array{S<:AbstractString}(
      path::S=path_to_datafile;
      nrows::Integer=-1,
      eltype=Float64)

   df = read_df(path, nrows=nrows)

   # strip first column (index)
   X = Array{eltype,2}(df[:,2:end])
   return X
end

end
