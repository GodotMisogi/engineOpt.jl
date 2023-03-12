# engineOpt.jl

`engineOpt.jl` is a Julia-based engine conceptual design and optimization code.
The code was developed based heavily on Drela's `.f77` code [TAESOPT](https://web.mit.edu/drela/Public/web/tasopt/) engine code.
We use a converter [fort2julia](https://github.com/SichengHe/fort2julia) to expedite the transition from `.f77` code to `.jl` code; however, still quite some manual teak needs to be done after the raw conversion from `fort2julia`.
The additional feastures of our code is:
* Derivatives computed by the forward algorithmic differentiation (FAD) using the Julia [ForwardDiff.jl](https://juliadiff.org/ForwardDiff.jl/stable/) package. (The code is also differentiated using reverse algorithmic differentiation (RAD) using [Zygote.jl](https://github.com/FluxML/Zygote.jl).)
*  The derivatives is used by gradient-based optimization solver which in our case we use [IPOPT](https://github.com/coin-or/Ipopt) wrapped by the Julia-based optimization package [JuMP](https://jump.dev/JuMP.jl/stable/).


## Note on the choice of using FAD instead of RAD
For an optimization problem with more design variables than functions of interest (objective function, constraints, etc.), it is preferable to use RAD than FAD (more details see [MDObook](https://mdobook.github.io/)).
The rationale behind the choice of the FAD is that: the current solver contains multiple Newton and fixed point iteration solvers making a direct implementation of RAD expensive in both computational time and memory (the intermediate steps need to be stored).
In addition, `Zygote.jl` takes very long time to generate the RAD code.
And with a dozen of design variables, we can use FAD + MPI (embarrassingly parallel in this case) to make the derivative computation very fast.