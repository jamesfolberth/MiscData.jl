"""
A few wrappers for miscellaneous datasets.
"""

#TODO: we could make this into a package and use Pkg.clone().  Does that automagically update with Pkg.update()?
#TODO: look into precompiling

module MiscData

include("Census1990/Census1990.jl")
include("Iris/Iris.jl")
include("RandCluster/RandCluster.jl")


# attach documentation to a few functions with the same interface.
for mod in (:Iris,)
   @eval begin
      @doc """
      `read_df() -> df`\\
      `read_df(path) -> df`
      
      Read the dataset into a `DataFrame`.
      """ $mod.read_df

      @doc """
      `read_array(eltype=Float64) -> X, y`\\
      `read_array(path, eltype=Float64) -> X, y`
      
      Read the dataset into an `Array{eltype,2}` of size `(n_ex, n_dim)`.
      """ $mod.read_array
   end
end

end
