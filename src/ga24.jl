
"""
    GA24

Module representing the GA(2,4) geometric algebra.

This is the conformal algebra for spacetime.
Even and odd elements are stored as complex Static Arrays.
"""
module GA24

using SimpleGA
using LinearAlgebra
using StaticArrays

include("core24.jl")
include("common.jl")

const g0 = Odd(id4)
const g1 = Odd(SMatrix{4,4,Complex{Int8},16}([0 1 0 0; 1 0 0 0; 0 0 0 -1; 0 0 -1 0]))
const g2 = Odd(SMatrix{4,4,Complex{Int8},16}([0 -im 0 0; im 0 0 0; 0 0 0 im; 0 0 -im 0]))
const g3 = Odd(SMatrix{4,4,Complex{Int8},16}([1 0 0 0; 0 -1 0 0; 0 0 -1 0; 0 0 0 1]))
const g4 = Odd(SMatrix{4,4,Complex{Int8},16}([0 0 1 0; 0 0 0 1; 1 0 0 0; 0 1 0 0]))
const g5 = Odd(SMatrix{4,4,Complex{Int8},16}([0 0 1 0; 0 0 0 1; -1 0 0 0; 0 -1 0 0]))

const I6 = g0 * g1 * g2 * g3 * g4 * g5

const basis = SA[g0, g1, g2, g3, g4, g5]

#Sets tolerance for not displaying results. Adding 1 to comparison seems to work well.
approxzero(x::Real) = isapprox(1 + x, 1.0)

function mv_to_text(a::Even)
    scl = tr(a)
    res = approxzero(scl) ? "" : " + " * string(scl)
    #! format:off
    tpevenbas = [g1*g0, g2*g0, g3*g0, g4*g0, -g5*g0,
                -g1*g2, -g1*g3, -g1*g4, g1*g5,
                -g2*g3, -g2*g4, g2*g5,
                -g3*g4, g3*g5,
                g4*g5,
                -g1*g0*I6, -g2*g0*I6, -g3*g0*I6, -g4*g0*I6, g5*g0*I6,
                g1*g2*I6, g1*g3*I6, g1*g4*I6, -g1*g5*I6,
                g2*g3*I6, g2*g4*I6, -g2*g5*I6,
                g3*g4*I6, -g3*g5*I6,
                -g4*g5*I6,
                -I6]
    tpevenstr = ["g1g0", "g2g0", "g3g0", "g4g0", "g5g0",
                "g1g2", "g1g3", "g1g4", "g1g5",
                "g2g3", "g2g4", "g2g5",
                "g3g4", "g3g5",
                "g4g5",
                "g1g0I6", "g2g0I6", "g3g0I6", "g4g0I6", "g5g0I6",
                "g1g2I6", "g1g3I6", "g1g4I6", "g1g5I6",
                "g2g3I6", "g2g4I6", "g2g5I6",
                "g3g4I6", "g3g5I6",
                "g4*g5*I6",
                "I6"]
        #! format:on
    for i in 1:31
        scl = dot(a, tpevenbas[i])
        tp = approxzero(scl) ? "" : " + " * string(scl) * tpevenstr[i]
        res *= tp
    end
    if (length(res) == 0)
        res = string(zero(scl))
    else
        res = chop(res; head=3, tail=0)
    end
    return res
end

function mv_to_text(a::Odd)
    #! format:off
    tpoddbas = [g0, -g1, -g2, -g3, -g4, g5,
                g0*g1*g2, -g0*g1*g3, -g0*g1*g4, g0*g1*g5, -g0*g2*g3, -g0*g2*g4, g0*g2*g5, -g0*g3*g4, g0*g3*g5, g0*g4*g5,
                -g0*g1*g2*I6, -g0*g1*g3*I6, -g0*g1*g4*I6, g0*g1*g5*I6, -g0*g2*g3*I6, -g0*g2*g4*I6, g0*g2*g5*I6, -g0*g3*g4*I6, g0*g3*g5*I6, g0*g4*g5*I6,
                g0*I6, -g1*I6, -g2*I6, -g3*I6, -g4*I6, g5*I6 ]
    tpoddstr = ["g0", "g1", "g2", "g3", "g4", "g5",
                "g0g1g2", "g0g1g3", "g0g1g4", "g0g1g5", "g0g2g3", "g0g2g4", "g0g2g5", "g0g3g4", "g0g3g5", "g0g4g5",
                "g0g1g2I6", "g0g1g3I6", "g0g1g4I6", "g0g1g5I6", "g0g2g3I6", "g0g2g4*I6", "g0g2g5I6", "g0g3g4I6", "g0g3g5I6", "g0g4g5I6",
                "g0I6", "g1I6", "g2I6", "g3I6", "g4I6", "g5I6"]
    #! format:on
    res = ""
    for i in 1:32
        scl = dot(a, tpoddbas[i])
        tp = approxzero(scl) ? "" : " + " * string(scl) * tpoddstr[i]
        res *= tp
    end
    if (length(res) == 0)
        res = string(zero(real(a.m[1, 1])))
    else
        res = chop(res; head=3, tail=0)
    end
    return res
end

include("show.jl")

end #Module
