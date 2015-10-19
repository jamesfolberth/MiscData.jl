"""
A few wrappers for miscellaneous datasets.
"""

#TODO: we could make this into a package and use Pkg.clone().  Does that automagically update with Pkg.update()?

module MiscData

include("Census1990/Census1990.jl")
include("Iris/Iris.jl")
include("RandCluster/RandCluster.jl")

end
