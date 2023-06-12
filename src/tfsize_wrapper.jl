"""
    Wrapper function for tfsize.jl
"""
function tfsize_wrapper!(engine_variable_obj::engine_variable)

    # ---------------
    # Extract the data
    # ---------------
    # Extract continuous design variables
    gee = 9.81

    Tt4 = engine_variable_obj.design_variable_continuous_obj.Tt4
    Feng = engine_variable_obj.design_variable_continuous_obj.Feng
    BPR = engine_variable_obj.design_variable_continuous_obj.BPR

    Gearf = engine_variable_obj.design_variable_continuous_obj.Gearf

    etab = engine_variable_obj.design_variable_continuous_obj.etab
    epf0 = engine_variable_obj.design_variable_continuous_obj.epf0
    eplc0 = engine_variable_obj.design_variable_continuous_obj.eplc0
    ephc0 = engine_variable_obj.design_variable_continuous_obj.ephc0
    epht0 = engine_variable_obj.design_variable_continuous_obj.epht0
    eplt0 = engine_variable_obj.design_variable_continuous_obj.eplt0
    epsl = engine_variable_obj.design_variable_continuous_obj.epsl
    epsh = engine_variable_obj.design_variable_continuous_obj.epsh
    pifK = engine_variable_obj.design_variable_continuous_obj.pifK
    epfK = engine_variable_obj.design_variable_continuous_obj.epfK

    Phiinl = engine_variable_obj.design_variable_continuous_obj.Phiinl
    Kinl = engine_variable_obj.design_variable_continuous_obj.Kinl

    mofft = engine_variable_obj.design_variable_continuous_obj.mofft
    Pofft = engine_variable_obj.design_variable_continuous_obj.Pofft

    pid = engine_variable_obj.design_variable_continuous_obj.pid
    pib = engine_variable_obj.design_variable_continuous_obj.pib
    pifn = engine_variable_obj.design_variable_continuous_obj.pifn
    pitn = engine_variable_obj.design_variable_continuous_obj.pitn
    pif = engine_variable_obj.design_variable_continuous_obj.pif_D
    pilc = engine_variable_obj.design_variable_continuous_obj.pilc_D
    pihc = engine_variable_obj.design_variable_continuous_obj.pihc_D

    M2 = engine_variable_obj.design_variable_continuous_obj.M2_D
    M25 = engine_variable_obj.design_variable_continuous_obj.M25_D

    Tt9 = engine_variable_obj.design_variable_continuous_obj.Tt9
    pt9 = engine_variable_obj.design_variable_continuous_obj.pt9

    Ttf = engine_variable_obj.design_variable_continuous_obj.Ttf

    dTstrk = engine_variable_obj.design_variable_continuous_obj.dTstrk
    StA = engine_variable_obj.design_variable_continuous_obj.StA
    efilm = engine_variable_obj.design_variable_continuous_obj.efilm
    tfilm = engine_variable_obj.design_variable_continuous_obj.tfilm
    M4a = engine_variable_obj.design_variable_continuous_obj.M4a
    ruc = engine_variable_obj.design_variable_continuous_obj.ruc
    Mtexit = engine_variable_obj.design_variable_continuous_obj.Mtexit
    epsrow = engine_variable_obj.design_variable_continuous_obj.epsrow


    # Integer variable
    iBLIc = engine_variable_obj.design_variable_integer_obj.iBLIc
    ifuel = engine_variable_obj.design_variable_integer_obj.ifuel
    icool = engine_variable_obj.design_variable_integer_obj.icool
    ncrowx = engine_variable_obj.design_variable_integer_obj.ncrowx
    ncrow = engine_variable_obj.design_variable_integer_obj.ncrow

    # Operation variable
    M0 = engine_variable_obj.on_design_operation_design_variable_obj.M0
    T0 = engine_variable_obj.on_design_operation_design_variable_obj.T0
    p0 = engine_variable_obj.on_design_operation_design_variable_obj.p0
    a0 = engine_variable_obj.on_design_operation_design_variable_obj.a0

    # ---------------
    # Run
    # ---------------
    Tmrow,
    TSFC, Fsp, hfuel, ff, mcore,
    Tt0, ht0, pt0, cpt0, Rt0,
    Tt18, ht18, pt18, cpt18, Rt18,
    Tt19, ht19, pt19, cpt19, Rt19,
    Tt2, ht2, pt2, cpt2, Rt2,
    Tt21, ht21, pt21, cpt21, Rt21,
    Tt25, ht25, pt25, cpt25, Rt25,
    Tt3, ht3, pt3, cpt3, Rt3,
    ht4, pt4, cpt4, Rt4,
    Tt41, ht41, pt41, cpt41, Rt41,
    Tt45, ht45, pt45, cpt45, Rt45,
    Tt49, ht49, pt49, cpt49, Rt49,
    Tt5, ht5, pt5, cpt5, Rt5,
    Tt7, ht7, pt7, cpt7, Rt7,
    u0,
    T2, u2, p2, cp2, R2, A2,
    T25, u25, p25, cp25, R25, A25,
    T5, u5, p5, cp5, R5, A5,
    T6, u6, p6, cp6, R6, A6,
    T7, u7, p7, cp7, R7, A7,
    T8, u8, p8, cp8, R8, A8,
    u9, A9,
    epf, eplc, ephc, epht, eplt,
    etaf, etalc, etahc, etaht, etalt,
    mbf, mblc, mbhc, mbht, mblt,
    Nbf, Nblc, Nbhc, Nbht, Nblt,
    Lconv = tfsize(gee, M0, T0, p0, a0, M2, M25,
        Gearf,
        Feng, Phiinl, Kinl, iBLIc,
        BPR, pif, pilc, pihc,
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

    # ---------------
    # Fill in data
    # ---------------
    # Station states
    # Total
    state_0_t = engine.station_state_total(u0, Tt0, ht0, pt0, cpt0, Rt0)
    state_18_t = engine.station_state_total(nothing, Tt18, ht18, pt18, cpt18, Rt18)
    state_19_t = engine.station_state_total(nothing, Tt19, ht19, pt19, cpt19, Rt19)
    state_2_t = engine.station_state_total(nothing, Tt2, ht2, pt2, cpt2, Rt2)
    state_21_t = engine.station_state_total(nothing, Tt21, ht21, pt21, cpt21, Rt21)
    state_25_t = engine.station_state_total(nothing, Tt25, ht25, pt25, cpt25, Rt25)
    state_3_t = engine.station_state_total(nothing, Tt3, ht3, pt3, cpt3, Rt3)
    state_4_t = engine.station_state_total(nothing, nothing, ht4, pt4, cpt4, Rt4)
    state_41_t = engine.station_state_total(nothing, Tt41, ht41, pt41, cpt41, Rt41)
    state_45_t = engine.station_state_total(nothing, Tt45, ht45, pt45, cpt45, Rt45)
    state_49_t = engine.station_state_total(nothing, Tt49, ht49, pt49, cpt49, Rt49)
    state_5_t = engine.station_state_total(nothing, Tt5, ht5, pt5, cpt5, Rt5)
    state_7_t = engine.station_state_total(nothing, Tt7, ht7, pt7, cpt7, Rt7)

    # Static
    state_2_s = engine.station_state_static(u2, nothing, T2, nothing, p2, cp2, R2, A2)
    state_25_s = engine.station_state_static(u25, nothing, T25, nothing, p25, cp25, R25, A25)
    state_5_s = engine.station_state_static(u5, nothing, T5, nothing, p5, cp5, R5, A5)
    state_6_s = engine.station_state_static(u6, nothing, T6, nothing, p6, cp6, R6, A6)
    state_7_s = engine.station_state_static(u7, nothing, T7, nothing, p7, cp7, R7, A7)
    state_8_s = engine.station_state_static(u8, nothing, T8, nothing, p8, cp8, R8, A8)
    state_9_s = engine.station_state_static(u9, nothing, nothing, nothing, nothing, nothing, nothing, A9)

    on_design_station_state_full_engine_obj = engine.station_state_full_engine(state_0_t, state_18_t, state_19_t, state_2_t, state_21_t, state_25_t,
        state_3_t, state_4_t, state_41_t, state_45_t, state_49_t, state_5_t, state_7_t,
        state_2_s, state_25_s, state_5_s, state_6_s, state_7_s, state_8_s, state_9_s,
        Tmrow)

    # Component state
    state_f = engine.component_state(epf, etaf, mbf, Nbf, pif)
    state_lc = engine.component_state(eplc, etalc, mblc, Nblc, pilc)
    state_hc = engine.component_state(ephc, etahc, mbhc, Nbhc, pihc)
    state_ht = engine.component_state(epht, etaht, mbht, Nbht, pt41 / pt45)
    state_lt = engine.component_state(eplt, etalt, mblt, Nblt, pt45 / pt49)

    on_design_component_state_full_engine_obj = engine.component_state_full_engine(state_f, state_lc, state_hc, state_ht, state_lt)

    # Performance variable
    on_design_performance_obj = engine.performance(TSFC, Fsp, hfuel, ff, mcore, nothing)

    # Form the state var
    on_design_output_full_engine_obj = engine.output_full_engine(on_design_station_state_full_engine_obj, on_design_component_state_full_engine_obj, on_design_performance_obj)


    engine_variable_obj.on_design_output_full_engine_obj = on_design_output_full_engine_obj

end