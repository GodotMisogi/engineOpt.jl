using Pkg
Pkg.activate("../")
Pkg.instantiate()
using engine

# =====================================
# On design sizing
# =====================================

# -------------------------------------
# Design variable (continuous)
# -------------------------------------

# Reference value
Tref = 288.19999999999999
pref = 101320.00000000000

# Gear ratio
Gearf = 1.0000000000000000

# Combustion temperature
Tt4 = 1587.0000000000000
# Required thrust
Feng = 22182.101361240744
# By-pass ratio
BPR = 5.0999999999999996
# Efficiencies and related par
etab = 0.98499999999999999
epf0 = 0.89480000000000004
eplc0 = 0.88000000000000000
ephc0 = 0.87000000000000000
epht0 = 0.88900000000000001
eplt0 = 0.89900000000000002
epsl = 1.0000000000000000E-002
epsh = 2.1999999999999999E-002
pifK = 1.6850000000000001
epfK = -7.6999999999999999E-002
# inlet
Phiinl = 0.0000000000000000
Kinl = 0.0000000000000000
# Station 2.5 off take (bleeding flow)
mofft = 0.56969999999999998
# Pofft = 89407.867373646965
Pofft = 77800.595231538944
# Pressure ratios
pid = 0.99800000000000000
pib = 0.93999999999999995
pifn = 0.97999999999999998
pitn = 0.98899999999999999
pif_D = 1.6850000000000001
pilc_D = 8.0000000000000000
pihc_D = 3.7500000000000000
# Mach
M2_D = 0.59999999999999998
M25_D = 0.59999999999999998
# Exit
Tt9 = 300.00000000000000
pt9 = 30000.000000000000
# Fuel 
Ttf = 280.00000000000000
# Cooling 
dTstrk = 200.00000000000000
StA = 8.9999999999999997E-002
efilm = 0.69999999999999996
tfilm = 0.29999999999999999
M4a = 0.90000000000000002
ruc = 0.14999999999999999
Mtexit = 1.0000000000000000
# epsrow = [0.12811308404512714, 5.4411331284501797E-002, 1.5791188045605239E-002, 0.0000000000000000]
epsrow = [0.12061791584226822, 5.1292591721870069E-002, 1.5478853228971187E-002, 0.0000000000000000]

Tmrow = [1000.0, 1000.0, 1000.0, 1000.0]

design_variable_continuous_obj = engine.design_variable_continuous(
    Tref,
    pref,
    Gearf,
    Tt4,
    Feng,
    BPR,
    etab,
    epf0,
    eplc0,
    ephc0,
    epht0,
    eplt0,
    epsl,
    epsh,
    pifK,
    epfK,
    Phiinl,
    Kinl,
    mofft,
    Pofft,
    pid,
    pib,
    pifn,
    pitn,
    pif_D,
    pilc_D,
    pihc_D,
    M2_D,
    M25_D,
    Tt9,
    pt9,
    Ttf,
    dTstrk,
    StA,
    efilm,
    tfilm,
    M4a,
    ruc,
    Mtexit,
    epsrow,
    Tmrow)

# -------------------------------------
# integer design variable
# -------------------------------------
# Bleeding flow
iBLIc = 0
# Fuel
ifuel = 24
# Cooling
icool = 1
ncrowx = 4
ncrow = 4

design_variable_integer_obj = engine.design_variable_integer(iBLIc, ifuel, icool, ncrowx, ncrow)

# -------------------------------------
# Mission variable
# -------------------------------------
M0 = 0.80000000000000004
T0 = 219.43067572699252
p0 = 23922.608843328788
a0 = 296.85578884697560

on_design_operation_design_variable_obj = engine.operation_design_variable(M0, T0, p0, a0)

# -------------------------------------
#  Construct engine
# -------------------------------------

# Construct the engine object
# It is composed of the design variables (continuous/integer), the operation condition, and the design and off-design state variables.
engine_variable_obj = engine.engine_variable()

engine_variable_obj.design_variable_continuous_obj = design_variable_continuous_obj
engine_variable_obj.design_variable_integer_obj = design_variable_integer_obj
engine_variable_obj.on_design_operation_design_variable_obj = on_design_operation_design_variable_obj

engine.tfsize_wrapper!(engine_variable_obj)

println(engine_variable_obj.on_design_output_full_engine_obj.performance_obj.TSFC)
# println(engine_variable_obj.on_design_output_full_engine_obj.performance_obj.mcore)


# =====================================
# Off design sizing
# =====================================
M0 = 0.26302467815397762
T0 = 288.00000000000000
p0 = 101320.00000000000
a0 = 340.08940001123227

off_design_operation_design_variable_obj = engine.operation_design_variable(M0, T0, p0, a0)
Tt4_OD = 1783.0
iTFspec = 1
off_design_input_obj = engine.off_design_input(Tt4_OD, iTFspec)

engine_variable_obj.off_design_operation_design_variable_obj = off_design_operation_design_variable_obj
engine_variable_obj.off_design_input_obj = off_design_input_obj

tfoper_wrapper!(engine_variable_obj)

println(engine_variable_obj.off_design_output_full_engine_obj.performance_obj.TSFC)