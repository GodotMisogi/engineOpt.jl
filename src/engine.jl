module engine

import Test
import Zygote
import DelimitedFiles
import ForwardDiff
using LinearAlgebra

include("engine_data_struct.jl")
include("gasfun.jl")
include("gascalc.jl")
include("tfmap.jl")
include("tfcool.jl")
include("tfsize.jl")
include("tfsize_wrapper.jl")
include("tfoper_wrapper.jl")
include("gaussn.jl")
include("compare.jl")
include("tfoper.jl")
include("tfcalc.jl")
include("tfweight.jl")
include("index.inc")
include("constants.inc")

# Main
export tfsize, tfoper!, tfcalc!
export tfsize_wrapper!, tfoper_wrapper!
export design_variable_continuous, design_variable_integer, operation_design_variable
export station_state_total, station_state_static, station_state_full_engine
export component_state, component_state_full_engine
export performance
export output_full_engine
export off_design_input
export engine_variable





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
