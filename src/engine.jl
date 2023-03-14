module engine

import Test
import Zygote
import DelimitedFiles
import ForwardDiff
using LinearAlgebra

include("gasfun.jl")
include("gascalc.jl")
include("tfan.jl")
include("tfmap.jl")
include("tfcool.jl")
include("tfsize.jl")
include("gaussn.jl")
include("compare.jl")
include("tfoper.jl")
include("tfcalc.jl")
include("tfweight.jl")
include("index.inc")
include("constants.inc")

# Main
export tfsize, tfoper, tfcalc!

# Unit test
export gas_N2, gas_Ar, gas_CO2, gas_H2O, gas_CH4
export gas_C2H6, gas_C3H8, gas_C4H10, gas_C8H18, gas_C14H30
export gasfun, gaschem
export gassum, gassumd
export gas_tset, gas_tsetd
export gas_delh, gas_delhd
export gas_burn, gas_burnd
export gas_mach, gas_machd
export gas_mass
export gasfuel
export tfan
export Ncmap, ecmap, Pimap
export mcool, Tmcalc
export gaussn
export compare


end # module
