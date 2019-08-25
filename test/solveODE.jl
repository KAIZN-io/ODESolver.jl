import Pkg

Pkg.add("DifferentialEquations")
Pkg.add("DataFrames")
Pkg.add("Plots")

using DifferentialEquations
using DataFrames 
using Plots 

function lorenz(du,u,p,t)
    du[1] = 10.0*(u[2]-u[1])
    du[2] = u[1]*(28.0-u[3]) - u[2]
    du[3] = u[1]*u[2] - (8/3)*u[3]
end

# define the initial Values --> [1*m] vector 
u0 = [0.1; 0.0; 0.0]

start = 0.0
stop = 30.0
timeSteps = 0.1 

# time array (must be a tuple)
tspan = (start,stop)

problem = ODEProblem(lorenz,u0,tspan)
solution = solve(problem, saveat=timeSteps)

# view solution in DataFrame
simulatedResultsDf = DataFrame(solution')

# transform Df into Matrix
simulatedResultsMx = simulatedResultsDf |> Matrix 

# plot the solution
# plot(solution, linewidth=3,title="Solution of the SDE system")