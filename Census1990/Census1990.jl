"""
Module to parse and subsample the Census 1990 dataset

https://archive.ics.uci.edu/ml/datasets/US+Census+Data+(1990)
"""

module Census1990

import DataFrames
DF = DataFrames

path_to_datafile = dirname(@__FILE__)*"/USCensus1990.data.txt"

"""
Read nrows of the Census1990 data (pre-shuffled) into a DataFrame.
This includes the header.
"""
function read_df{S<:AbstractString}(
      path::S=path_to_datafile;
      nrows::Integer=-1)

   path = UTF8String(path)
   df = DF.readtable(path, header=true, separator=',', nrows=nrows)
   
   return df
end


"""
Load nrows of the Census1990 data (pre-suffled) into an Array{eltype,2}.
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
