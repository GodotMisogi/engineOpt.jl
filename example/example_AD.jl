using Pkg
Pkg.activate("../")
Pkg.instantiate()

using engine
using ForwardDiff
using DualNumbers



function tfsize_wrapper(x)

    gee = 9.8100000000000005
    M0 = 0.80000000000000004
    T0 = 219.43067572699252
    p0 = 23922.608843328788
    a0 = 296.85578884697560
    M2 = 0.59999999999999998
    M25 = 0.59999999999999998
    Gearf = 1.0
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
    mbf, mblc, mbhc, mbht, mblt,
    Nbf, Nblc, Nbhc, Nbht, Nblt,
    Lconv = engine.tfsize(gee * x, M0 * x, T0 * x, p0 * x, a0 * x, M2 * x, M25 * x,
        Gearf,
        Feng * x, Phiinl * x, Kinl * x, iBLIc,
        BPR * x, pif * x, pilc * x, pihc * x,
        pid * x, pib * x, pifn * x, pitn * x,
        Ttf * x, ifuel, etab * x,
        epf0 * x, eplc0 * x, ephc0 * x, epht0 * x, eplt0 * x,
        pifK * x, epfK * x,
        mofft * x, Pofft * x,
        Tt9 * x, pt9 * x, Tt4 * x,
        epsl * x, epsh * x,
        icool,
        Mtexit * x, dTstrk * x, StA * x, efilm * x, tfilm * x,
        M4a * x, ruc * x,
        ncrowx, ncrow,
        epsrow * x)

    return TSFC

end

# Conduct a directional FAD
println(ForwardDiff.derivative(tfsize_wrapper, 1.0))



function tfoper_wrapper(x)
    gee = 9.8100000000000005
    M0 = 0.26302467815397762
    T0 = 288.00000000000000
    p0 = 101320.00000000000
    a0 = 340.08940001123227
    Tref = 288.19999999999999
    pref = 101320.00000000000

    Phiinl = 0.0
    Kinl = 0.0
    iBLIc = 0

    pid = 0.99800000000000000
    pib = 0.93999999999999995
    pifn = 0.97999999999999998
    pitn = 0.98899999999999999
    Gearf = 1.0000000000000000
    pifD = 1.6850000000000001
    pilcD = 8.0000000000000000
    pihcD = 3.7500000000000000
    pihtD = 2.1601257635200488
    piltD = 6.2886975330083716
    mbfD = 235.16225770724063
    mblcD = 46.110246609262873
    mbhcD = 7.8056539219349039
    mbhtD = 4.3594697284253883
    mbltD = 8.7016090343744406
    NbfD = 1.0790738309310697
    NblcD = 1.0790738309310697
    NbhcD = 0.77137973563891493
    NbhtD = 0.44698693289691338
    NbltD = 0.48396724306758404
    A2 = 1.3863121762890294
    A25 = 3.8585338087708761E-002
    A5 = 0.19210855588408102
    A7 = 0.64211443204484309
    iTFspec = 1
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
    Pofft = 77800.595231538944
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
    epsrow3 = [0.12061791584226822, 5.1292591721870069E-002, 1.5478853228971187E-002, 0.0000000000000000]
    Tmrow3 = [1000.0, 1000.0, 1000.0, 1000.0]

    M2 = 1.0
    pif = 0.0000000000000000
    pilc = 0.0000000000000000
    pihc = 0.0000000000000000
    mbf = 0.0000000000000000
    mblc = 0.0000000000000000
    mbhc = 0.0000000000000000
    Tt4 = 1783.8000000000002
    pt5 = 0.0000000000000000
    mcore = 0.0
    M25 = 0.0

    Tmrow, #1
    TSFC, Fsp, hfuel, ff, # 2
    Feng, mcore, # 6
    pif, pilc, pihc, # 8
    mbf, mblc, mbhc, # 11
    Nbf, Nblc, Nbhc, # 14
    Tt0, ht0, pt0, cpt0, Rt0, # 17
    Tt18, ht18, pt18, cpt18, Rt18, # 22
    Tt19, ht19, pt19, cpt19, Rt19, # 27
    Tt2, ht2, pt2, cpt2, Rt2, # 32
    Tt21, ht21, pt21, cpt21, Rt21, # 37
    Tt25, ht25, pt25, cpt25, Rt25, # 42
    Tt3, ht3, pt3, cpt3, Rt3, # 47
    Tt4, ht4, pt4, cpt4, Rt4, # 52
    Tt41, ht41, pt41, cpt41, Rt41, # 57
    Tt45, ht45, pt45, cpt45, Rt45, # 62
    Tt49, ht49, pt49, cpt49, Rt49, # 67
    Tt5, ht5, pt5, cpt5, Rt5, # 72
    Tt7, ht7, pt7, cpt7, Rt7, # 77
    u0, # 82
    T2, u2, p2, cp2, R2, M2, # 83
    T25, u25, p25, cp25, R25, M25, # 89
    T5, u5, p5, cp5, R5, M5, # 95
    T6, u6, p6, cp6, R6, M6, A6, # 101
    T7, u7, p7, cp7, R7, M7, # 108
    T8, u8, p8, cp8, R8, M8, A8, # 114
    u9, A9, # 121
    epf, eplc, ephc, epht, eplt, # 123
    etaf, etalc, etahc, etaht, etalt, # 128
    Lconv = engine.tfoper!(gee * x, M0 * x, T0 * x, p0 * x, a0 * x, Tref * x, pref * x,
        Phiinl * x, Kinl * x, iBLIc * x,
        pid * x, pib * x, pifn * x, pitn * x,
        Gearf * x,
        pifD * x, pilcD * x, pihcD * x, pihtD * x, piltD * x,
        mbfD * x, mblcD * x, mbhcD * x, mbhtD * x, mbltD * x,
        NbfD * x, NblcD * x, NbhcD * x, NbhtD * x, NbltD * x,
        A2 * x, A25 * x, A5 * x, A7 * x,
        iTFspec,
        Ttf * x, ifuel, etab * x,
        epf0 * x, eplc0 * x, ephc0 * x, epht0 * x, eplt0 * x,
        pifK * x, epfK * x,
        mofft * x, Pofft * x,
        Tt9 * x, pt9 * x,
        epsl * x, epsh * x,
        icool,
        Mtexit * x, dTstrk * x, StA * x, efilm * x, tfilm * x,
        M4a * x, ruc * x,
        ncrowx, ncrow,
        epsrow3 * x, Tmrow3 * x,
        M2 * x, pif * x, pilc * x, pihc * x, mbf * x, mblc * x, mbhc * x, Tt4 * x, pt5 * x, mcore * x, M25 * x)

    return TSFC
end

# Conduct a directional FAD
println(ForwardDiff.derivative(tfoper_wrapper, 1.0))