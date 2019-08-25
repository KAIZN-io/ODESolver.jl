# import Pkg; 
# Pkg.add("CSV")

using CSV

# cd("/Users/janpiotraschke/GithubRepository/ODESolver.jl/test")

# read CSV data and transform it into a matrix 
# CSV.read(source; copycols::Bool=false, kwargs...) => DataFrame |> Matrix
resultsLorenzDf = CSV.read("resultsLorenz.csv"; header=true, delim=',') 
resultsLorenzMx = resultsLorenzDf |> Matrix

