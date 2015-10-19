"""
Module to load Fisher's Iris dataset.

https://archive.ics.uci.edu/ml/datasets/Iris
"""

module Iris

import DataFrames
DF = DataFrames

# this contains a couple differences from Fisher's original paper
#path_to_datafile = dirname(@__FILE__)*"/iris.data"

# this fixes those errors
path_to_datafile = dirname(@__FILE__)*"/bezdekIris.data"

"""
`read_df() -> df`
`read_df(path) -> df`

Read the dataset into a DataFrame.
"""
function read_df{S<:AbstractString}(path::S=path_to_datafile)

   path = UTF8String(path)
   df = DF.readtable(path, header=false, separator=',')
   
   return df
end


"""
`read_array() -> X, y`
`read_array(path) -> X, y`

Read the dataset into an Array of type eltype.
"""
function read_array{S<:AbstractString}(
      path::S=path_to_datafile;
      eltype=Float64)

   df = read_df(path)

   X = Array{eltype,2}(df[:,1:4])
   
   # enumerate the iris names
   y = Array{Int64,1}(size(df,1))
   names_to_enum = Dict{typeof(df[1,end]),Int64}()
   e = Int64(1)
   for (ind, name) in enumerate(df[:,end])
      if !(name in keys(names_to_enum))
         names_to_enum[name] = e
         e += 1
      end
      y[ind] = names_to_enum[name]
   end
   
   return X, y
end

end
