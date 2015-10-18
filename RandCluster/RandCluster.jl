"""
Routines to generate some simple example data for clustering algorithms.
"""

module RandCluster

import Distributions

export dist_nd

"""
`dist_nd(n::Integer, K::Integer, N::Integer, kwargs...)`

Sample N points from a random GMM in n dimensions with K components.

Args:\\
`n` - number of dimensions\\
`K` - number of clusters\\
`N` -  number of samples\\
`T=Float64` - data type of the returned array\\
`cov_type=:wishart` - method used to construct covariance matrices for the GMM.\\
   `:simple` Construct `A` via `A = rand(n,n); A = A + A.' + n*eye(n)`\\
   `:randn` Construct `A` via `A = randn(n,n); A = A\*A.'`\\
   `:wishart` Sample `A` from `Wishart_n(n*eye(n), n)`\\
`print=false` - print the generated cluster to `STDOUT`\\


Returns:\\
`X` - Data matrix (`N`,`n`)\\
`y` - vector of cluster indexes, entries 1:`K`\\
"""
function dist_nd(n::Integer, K::Integer, N::Integer;
      T=Float64, cov_type=:wishart, print=false)
   
   # mixture weights, sum to one via softmax
   mix = Array{T}(randn((K,)))
   mix = exp(mix)
   mix /= sum(mix)

   # means
   mean = Array{T}(10*randn((n, K)))

   # covariances
   covs = Array{Array{T,2},1}(K)

   if cov_type == :simple
      # fill with A \gets A + A^T + nI
      for k in 1:K
         A = Array{T}(rand(n,n))
         A += A.'
         A += T(n)*Array{T}(eye(n))
         covs[k] = A
      end
   
   elseif cov_type == :randn
      # fill with A \gets randn(), A \gets A*A.'
      for k in 1:K
         A = Array{T}(randn(n,n))
         A *= A.'
         covs[k] = A
      end

   elseif cov_type == :wishart
      # fill with samples from Wishart_n(nI, n)
      S = T(n)*Array{T}(eye(n))
      W_n = Distributions.Wishart(T(n), S)
      for k in 1:K
         covs[k] = rand(W_n)
      end
   else
      error("unknown covariance type $(cov_type).")
   end

   # precompute spectral decomposition
   # precompute linear part of affine transformation mapping N(0,1) 
   # to N(mu, Sigma): x <- sqrt(D)*U*x+mu
   Q = Array{Any}(K)
   for ind in 1:K
      cov = covs[ind]
      eig = eigfact(cov)
      Q[ind] = eig[:vectors]*diagm(sqrt(eig[:values]))
   end

   X = randn((n,N))
   y = Array{Int}(N)
   
   mix_cumsum = cumsum(mix)
   for ind in 1:N
      # select a cluster from which to sample
      u = rand()
      k = searchsortedfirst(mix_cumsum, u)
      
      # sample from that cluster
      X[:,ind]  = Q[k]*X[:,ind] + mean[:,k]
      y[ind] = k

   end

   if print
      println("Example data in $(n) dimensions with $(K) components using cov_type=$(cov_type).")
      for k in 1:K
         println("  Component $(k):")
         println("    weight:     $(mix[k])")

         println("    mean:")
         pretty_print_vector(mean[:,k], indent_level=6)

         println("    cov (full):")
         pretty_print_matrix(covs[k], indent_level=6)

      end
   end

   return X.', y
end


## Pretty printing ##
function pretty_print_vector{T}(io::IO, x::AbstractArray{T}; indent_level::Integer=0)
   for val in x
      println(io, join([repeat(" ",indent_level), @sprintf "% 7.3f" val]))
   end
end
#TODO: is there a way to clean this up?  Like python's dict unpacking with param'd types?
#      one constraint is that we want to mimic the call to println which has io optional in front
pretty_print_vector{T}(x::AbstractArray{T}; indent_level::Integer=0) = 
   pretty_print_vector(STDOUT, x, indent_level=indent_level)

function pretty_print_matrix{T}(io::IO, mat::AbstractArray{T,2}; indent_level::Integer=0)
   for i in 1:size(mat, 1)
      print(io, repeat(" ", indent_level))
      for val in mat[i,:]
         print(io, @sprintf "% 7.3f  " val)
      end
      println(io,"")
   end
end
pretty_print_matrix{T}(mat::AbstractArray{T,2}; indent_level::Integer=0) = 
   pretty_print_matrix(STDOUT, mat, indent_level=indent_level)


end
