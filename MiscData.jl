"""
A few wrappers for miscellaneous datasets.
"""

#TODO: we could make this into a package and use Pkg.clone().  Does that automagically update with Pkg.update()?
#TODO: look into precompiling
#TODO: how can we do a variable number of output arguments (e.g. normally X,y, but user just wants X)?
#TODO: automagically download data files from UCI?

module MiscData

include("Census1990/Census1990.jl")
include("Iris/Iris.jl")
include("LIBRAS/LIBRAS.jl")
include("RandCluster/RandCluster.jl")


# attach documentation to a few functions with the same interface.
for mod in (:Iris,:LIBRAS)
   @eval begin
      @doc """
      `read_df() -> df`\\
      `read_df(data_filename) -> df`
      
      Read the dataset into a `DataFrame`.
      """ $mod.read_df

      @doc """
      `read_array(eltype=Float64) -> X, y`\\
      `read_array(data_filename, eltype=Float64) -> X, y`
      
      Read the dataset into an `Array{eltype,2}` of size `(n_ex, n_dim)`.
      """ $mod.read_array
   end
end

end
