"""
    design_variable_continuous(...)
    Continuous variables may or may not vary in optimization.
"""
mutable struct design_variable_continuous



    # design_variable_continuous_dict

    Tref
    pref

    Gearf

    Tt4
    Feng
    BPR

    etab
    epf0
    eplc0
    ephc0
    epht0
    eplt0
    epsl
    epsh
    pifK
    epfK

    Phiinl
    Kinl

    mofft
    Pofft

    pid
    pib
    pifn
    pitn
    pif_D
    pilc_D
    pihc_D

    M2_D
    M25_D

    Tt9
    pt9

    Ttf

    dTstrk
    StA
    efilm
    tfilm
    M4a
    ruc
    Mtexit
    epsrow

end


"""
    design_variable_integer(...)
    Logic variables fixed in optimization.
"""
mutable struct design_variable_integer

    iBLIc
    ifuel
    icool
    ncrowx
    ncrow

end

"""
    operation_design_variable(M0, T0, p0, a0)
    Flight condition.
# Examples
```julia-repl
julia> operation_design_variable(1.1, 300.0, 10^5, 340.0)
```
"""
mutable struct operation_design_variable

    M0
    T0
    p0
    a0

end

"""
    station_state_total(u,Tt,ht,pt,cp,R)
    Station state total state variable.
"""
mutable struct station_state_total

    u
    Tt
    ht
    pt
    cp
    R

end

"""
    station_state_total(u,M,Ts,hs,ps,cps,Rs,A)
    Station state static state variable.
"""
mutable struct station_state_static

    u
    M
    Ts
    hs
    ps
    cps
    Rs
    A

end

"""
    station_state_full_engine(...)
    Station states for the whole engine.
"""
mutable struct station_state_full_engine

    state_0_t::station_state_total
    state_18_t::station_state_total
    state_19_t::station_state_total
    state_2_t::station_state_total
    state_21_t::station_state_total
    state_25_t::station_state_total
    state_3_t::station_state_total
    state_4_t::station_state_total
    state_41_t::station_state_total
    state_45_t::station_state_total
    state_49_t::station_state_total
    state_5_t::station_state_total
    state_7_t::station_state_total

    state_2_s::station_state_static
    state_25_s::station_state_static
    state_5_s::station_state_static
    state_6_s::station_state_static
    state_7_s::station_state_static
    state_8_s::station_state_static
    state_9_s::station_state_static

    Tmrow

end

"""
    component_state(ep,eta,mb,Nb,pratio)
    Component state.
"""
mutable struct component_state

    ep
    eta
    mb
    Nb
    pratio

end

"""
    component_state_full_engine(state_f,state_lc,state_hc,state_ht,state_lt)
    Component state for the whole engine.
"""
mutable struct component_state_full_engine

    state_f::component_state
    state_lc::component_state
    state_hc::component_state
    state_ht::component_state
    state_lt::component_state

end


"""
    performance(TSFC,Fsp,hfuel,ff,mcore,Feng)
    Engine performance.
"""
mutable struct performance

    TSFC
    Fsp
    hfuel
    ff
    mcore
    Feng

end

"""
    output_full_engine(station_state_full_engine_obj, component_state_full_engine_obj, performance_obj)
    State variable (or output)
    Computed for the on-design case.
    Notice some output here are more naturally design variables,
    such as A2--the area of the low pressure compressor inlet.
    Because we use them to satisfy constraint, they are output here.
    Some of the variable here are fixed for the off-design case.
"""
mutable struct output_full_engine

    station_state_full_engine_obj::station_state_full_engine
    component_state_full_engine_obj::component_state_full_engine
    performance_obj::performance

end

"""
    off_design_input(Tt4)
    Engine throttle setting.
"""
mutable struct off_design_input

    Tt4

end

"""
    engine_variable(design_variable_continuous_obj, design_variable_integer_obj, 
    on_design_operation_design_variable_obj, off_design_operation_design_variable_obj, off_design_input_obj,
    on_design_output_full_engine_obj, off_design_output_full_engine_obj)
    Engine variables including design, flight condition, and computed outputs.
"""
mutable struct engine_variable

    # Design variable
    design_variable_continuous_obj::design_variable_continuous
    design_variable_integer_obj::design_variable_integer

    # Mission variable
    on_design_operation_design_variable_obj::operation_design_variable
    off_design_operation_design_variable_obj::operation_design_variable

    # Additional off-design input
    off_design_input_obj::off_design_input

    # Output
    on_design_output_full_engine_obj::output_full_engine
    off_design_output_full_engine_obj::output_full_engine

    # Constructor
    engine_variable() = new()

end
