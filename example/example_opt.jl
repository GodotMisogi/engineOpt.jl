using Pkg
Pkg.activate("../")
Pkg.instantiate()
using engine
using ForwardDiff
using DualNumbers
using JuMP
import Ipopt

function g(x)

    gee = 9.8100000000000005
    M0 = 0.80000000000000004
    T0 = 219.43067572699252
    p0 = 23922.608843328788
    a0 = 296.85578884697560
    M2 = 0.59999999999999998
    M25 = 0.59999999999999998
    Feng = 22182.101361240744
    Phiinl = 0.0000000000000000
    Kinl = 0.0000000000000000
    iBLIc = 0
    BPR = 5.0999999999999996
    pif = 1.6850000000000001
    pilc = 8.0000000000000000
    pihc = 3.7500000000000000
    pid = 0.99800000000000000
    pib = 0.93999999999999995
    pifn = 0.97999999999999998
    pitn = 0.98899999999999999
    Ttf = 280.00000000000000
    ifuel = 24
    etab = 0.98499999999999999
    epf0 = 0.89480000000000004
    eplc0 = 0.88000000000000000
    ephc0 = 0.87000000000000000
    epht0 = 0.88900000000000001
    eplt0 = 0.89900000000000002
    pifK = 1.6850000000000001
    epfK = -7.6999999999999999E-002
    mofft = 0.56969999999999998
    Pofft = 89407.867373646965
    Tt9 = 300.00000000000000
    pt9 = 30000.000000000000
    epsl = 1.0000000000000000E-002
    epsh = 2.1999999999999999E-002
    icool = 1
    Mtexit = 1.0000000000000000
    dTstrk = 200.00000000000000
    StA = 8.9999999999999997E-002
    efilm = 0.69999999999999996
    tfilm = 0.29999999999999999
    M4a = 0.90000000000000002
    ruc = 0.14999999999999999
    ncrowx = 4
    ncrow = 4
    epsrow = zeros(ncrowx)
    epsrow[1] = 0.12811308404512714
    epsrow[2] = 5.4411331284501797E-002
    epsrow[3] = 1.5791188045605239E-002
    epsrow[4] = 0.0000000000000000
    Tt4 = 1587.0000000000000

    Tmrow, # 1
    TSFC, Fsp, hfuel, ff, mcore, # 2
    Tt0, ht0, pt0, cpt0, Rt0, # 7
    Tt18, ht18, pt18, cpt18, Rt18, # 12
    Tt19, ht19, pt19, cpt19, Rt19, # 17
    Tt2, ht2, pt2, cpt2, Rt2, # 22
    Tt21, ht21, pt21, cpt21, Rt21, # 27
    Tt25, ht25, pt25, cpt25, Rt25, # 32
    Tt3, ht3, pt3, cpt3, Rt3, # 37
    ht4, pt4, cpt4, Rt4, # 42
    Tt41, ht41, pt41, cpt41, Rt41, # 46
    Tt45, ht45, pt45, cpt45, Rt45, # 51
    Tt49, ht49, pt49, cpt49, Rt49, # 56
    Tt5, ht5, pt5, cpt5, Rt5, # 61
    Tt7, ht7, pt7, cpt7, Rt7, # 66
    u0, # 71
    T2, u2, p2, cp2, R2, A2, # 72
    T25, u25, p25, cp25, R25, A25, # 78
    T5, u5, p5, cp5, R5, A5, # 84
    T6, u6, p6, cp6, R6, A6, # 90
    T7, u7, p7, cp7, R7, A7, # 96
    T8, u8, p8, cp8, R8, A8, # 102
    u9, A9, # 108
    epf, eplc, ephc, epht, eplt, # 110
    etaf, etalc, etahc, etaht, etalt, # 115
    Lconv = engine.tfsize(gee, M0, T0, p0, a0, M2, M25,
        Feng, Phiinl, Kinl, iBLIc,
        BPR, pif, pilc, pihc * x,
        pid, pib, pifn, pitn,
        Ttf, ifuel, etab,
        epf0, eplc0, ephc0, epht0, eplt0,
        pifK, epfK,
        mofft, Pofft,
        Tt9, pt9, Tt4,
        epsl, epsh,
        icool,
        Mtexit, dTstrk, StA, efilm, tfilm,
        M4a, ruc,
        ncrowx, ncrow,
        epsrow)

    return TSFC

end


model = Model(Ipopt.Optimizer)
# set_silent(model)

@variable(model, 0.95 <= x <= 1.05, start = 1.0)
@NLobjective(model, Min, g(x))
optimize!(model)
@show value(x)

# # Now, update the value of x to solve a different problem.
# set_value(x, 5.0)
# optimize!(model)
# @show value(z) # Equals 5.0



