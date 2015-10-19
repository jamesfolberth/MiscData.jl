"""
Module to load the LIBRAS movements dataset.

https://archive.ics.uci.edu/ml/datasets/Libras+Movement
"""

module LIBRAS

import DataFrames
DF = DataFrames

# this is the main datafile
path_to_datafile = dirname(@__FILE__)*"/movement_libras.data"

function read_df{S<:AbstractString}(path::S=path_to_datafile)

   path = UTF8String(path)
   df = DF.readtable(path, header=false, separator=',')
   
   return df
end


function read_array{S<:AbstractString}(
      path::S=path_to_datafile;
      eltype=Float64)

   df = read_df(path)

   X = Array{eltype,2}(df[:,1:end-1])
   y = Array{Int64,1}(df[:,end]) # class names are already enumerated 
   
   return X, y
end

end
