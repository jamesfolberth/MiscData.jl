"""
Module to load contraceptive method choice (CMC) dataset.

https://archive.ics.uci.edu/ml/datasets/Contraceptive+Method+Choice
"""

module CMC

import DataFrames
DF = DataFrames

path_to_datafile = dirname(@__FILE__)*"/cmc.data"

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
   y = Array{Int64,1}(df[:,end]) 
   
   return X, y
end

end
