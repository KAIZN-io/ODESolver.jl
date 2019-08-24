using Test: @test
using ODESolver: solveODE

start = 0
stop = 30
stepSize = 0.1

model = Dict(
  "algebraic"=>[
    Dict("var"=>"c", "orres"=>["x^2"]),
  ],
  "differential"=>[
    Dict("var"=>"x", "orres"=>["sigma * (y - x)"]),
    Dict("var"=>"y", "orres"=>["x * (rho - z) - y"]),
    Dict("var"=>"z", "orres"=>["x * y - beta * z"]),
  ]
)

initialValues = [
  Dict("var"=>"x", "orres"=>"0.1"),
  Dict("var"=>"y", "orres"=>"0"),
  Dict("var"=>"z", "orres"=>"0"),
]

parameters = [
  Dict("var"=>"sigma", "orres"=>"10"),
  Dict("var"=>"rho",   "orres"=>"28"),
  Dict("var"=>"beta",  "orres"=>"8 / 3"),
]

@test solveODE(start, stop, stepSize, model, initialValues, parameters) == Dict(
  "t" => collect(0:0.1:30),
  "x" => collect(0:0.1:30),
  "y" => collect(0:0.1:30),
  "z" => collect(0:0.1:30),
)

