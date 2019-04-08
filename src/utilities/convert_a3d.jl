# convert_a3d

# Function that allows federation by setting the `output_format`  in the Stanmodel().

function convert_a3d(a3d_array, cnames, ::Val{:mcmcchains})
  pi = filter(p -> length(p) > 2 && p[end-1:end] == "__", cnames)
  p = filter(p -> !(p in  pi), cnames)

  MCMCChains.Chains(a3d_array,
    cnames,
    Dict(
      :parameters => p,
      :internals => pi
    )
  )
end
