module ODESolver

function solveODE(start, stop, stepSize, model, initialValues, parameters)
  return Dict(
  "t" => collect(0:0.1:30),
  "x" => collect(0:0.1:30),
  "y" => collect(0:0.1:30),
  "z" => collect(0:0.1:30),
)

end

end

