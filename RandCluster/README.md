# RandCluster.jl

Generate random clustering datasets.

## Usage
Sample N points from a random GMM in n dimensions with K components.

`dist_nd(n::Integer, K::Integer, N::Integer, kwargs...)`

Args:
* `n` - number of dimensions
* `K` - number of clusters
* `N` -  number of samples
* `T=Float64` - data type of the returned array
* `cov_type=:wishart` - method used to construct covariance matrices for the GMM.
  - `:simple` Construct `A` via `A = rand(n,n); A = A + A.' + n*eye(n)`
  - `:randn` Construct `A` via `A = randn(n,n); A = A\*A.'`
  - `:wishart` Sample `A` from `Wishart_n(n*eye(n), n)`
* `print=false` - print the generated cluster to `STDOUT`


Returns:
* `X` - Data matrix (`N`,`n`)
* `y` - vector of cluster indexes, entries `1:K`
