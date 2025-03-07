#Test suite for GA(2,4).
#Test stand-alone results and compares with GA(2,4)

bas24 = GA24.basis
(g0, g1, g2, g3, g4, g5) = (bas24[1], bas24[2], bas24[3], bas24[4], bas24[5], bas24[6])

@test map(x -> dot(x, x), bas24) == [1, -1, -1, -1, -1, 1]
@test testbas(bas24)

#! format:off
me1 = rand() + rand()*g0*g1 + g0*g3*rand() + g0*rand()*g4 - rand()*g3*g1 + g1*g4/rand() + rand()*g3*g4 + rand()*g0*g1*g3*g4 +
    g2*(rand()*g0 + rand()*g1 + g3*rand() + g4*rand() + g0*g1*g3*g4*(rand()*g0 + rand()*g1 + g3*rand() + g4*rand() ) ) +
    g5*(rand()*g0 + rand()*g1 + g3*rand() + g4*rand() + g0*g1*g3*g4*(rand()*g0 + rand()*g1 + g3*rand() + g4*rand() ) ) +
    g2*g5*(rand() + rand()*g0*g1 + g0*g3*rand() + g0*rand()*g4 - rand()*g3*g1 + g1*g4/rand() + rand()*g3*g4 + rand()*g0*g1*g3*g4)
me2 = rand() + rand()*g0*g1 + g0*g3*rand() + g0*rand()*g4 - rand()*g3*g1 + g1*g4/rand() + rand()*g3*g4 + rand()*g0*g1*g3*g4 +
    g2*(rand()*g0 + rand()*g1 + g3*rand() + g4*rand() + g0*g1*g3*g4*(rand()*g0 + rand()*g1 + g3*rand() + g4*rand() ) ) +
    g5*(rand()*g0 + rand()*g1 + g3*rand() + g4*rand() + g0*g1*g3*g4*(rand()*g0 + rand()*g1 + g3*rand() + g4*rand() ) ) +
    g2*g5*(rand() + rand()*g0*g1 + g0*g3*rand() + g0*rand()*g4 - rand()*g3*g1 + g1*g4/rand() + rand()*g3*g4 + rand()*g0*g1*g3*g4)
me3 = rand() + rand()*g0*g1 + g0*g3*rand() + g0*rand()*g4 - rand()*g3*g1 + g1*g4/rand() + rand()*g3*g4 + rand()*g0*g1*g3*g4 +
    g2*(rand()*g0 + rand()*g1 + g3*rand() + g4*rand() + g0*g1*g3*g4*(rand()*g0 + rand()*g1 + g3*rand() + g4*rand() ) ) +
    g5*(rand()*g0 + rand()*g1 + g3*rand() + g4*rand() + g0*g1*g3*g4*(rand()*g0 + rand()*g1 + g3*rand() + g4*rand() ) ) +
    g2*g5*(rand() + rand()*g0*g1 + g0*g3*rand() + g0*rand()*g4 - rand()*g3*g1 + g1*g4/rand() + rand()*g3*g4 + rand()*g0*g1*g3*g4)
mo1 = (rand()*g0 + rand()*g1 + g3*rand() + g4*rand() + g0*g1*g3*g4*(rand()*g0 + rand()*g1 + g3*rand() + g4*rand() ) ) +
    g2*( rand() + rand()*g0*g1 + g0*g3*rand() + g0*rand()*g4 - rand()*g3*g1 + g1*g4/rand() + rand()*g3*g4 + rand()*g0*g1*g3*g4) +
    g5*( rand() + rand()*g0*g1 + g0*g3*rand() + g0*rand()*g4 - rand()*g3*g1 + g1*g4/rand() + rand()*g3*g4 + rand()*g0*g1*g3*g4) +
    g2*g5*(rand()*g0 + rand()*g1 + g3*rand() + g4*rand() + g0*g1*g3*g4*(rand()*g0 + rand()*g1 + g3*rand() + g4*rand() ))
mo2 = (rand()*g0 + rand()*g1 + g3*rand() + g4*rand() + g0*g1*g3*g4*(rand()*g0 + rand()*g1 + g3*rand() + g4*rand() ) ) +
    g2*( rand() + rand()*g0*g1 + g0*g3*rand() + g0*rand()*g4 - rand()*g3*g1 + g1*g4/rand() + rand()*g3*g4 + rand()*g0*g1*g3*g4) +
    g5*( rand() + rand()*g0*g1 + g0*g3*rand() + g0*rand()*g4 - rand()*g3*g1 + g1*g4/rand() + rand()*g3*g4 + rand()*g0*g1*g3*g4) +
    g2*g5*(rand()*g0 + rand()*g1 + g3*rand() + g4*rand() + g0*g1*g3*g4*(rand()*g0 + rand()*g1 + g3*rand() + g4*rand() ))
mo3 = (rand()*g0 + rand()*g1 + g3*rand() + g4*rand() + g0*g1*g3*g4*(rand()*g0 + rand()*g1 + g3*rand() + g4*rand() ) ) +
    g2*( rand() + rand()*g0*g1 + g0*g3*rand() + g0*rand()*g4 - rand()*g3*g1 + g1*g4/rand() + rand()*g3*g4 + rand()*g0*g1*g3*g4) +
    g5*( rand() + rand()*g0*g1 + g0*g3*rand() + g0*rand()*g4 - rand()*g3*g1 + g1*g4/rand() + rand()*g3*g4 + rand()*g0*g1*g3*g4) +
    g2*g5*(rand()*g0 + rand()*g1 + g3*rand() + g4*rand() + g0*g1*g3*g4*(rand()*g0 + rand()*g1 + g3*rand() + g4*rand() ))
#! format:on

#Comparison with GA(4,4)
bas44 = GA44.basis
(G0, G1, G2, G3, G4, G5) = (bas44[1], bas44[5], bas44[6], bas44[7], bas44[8], bas44[4])
arr1 = rand(6)
v1 = inject(arr1, bas24)
V1 = inject(arr1, [G0, G1, G2, G3, G4, G5])
arr2 = rand(6)
v2 = inject(arr2, bas24)
V2 = inject(arr2, [G0, G1, G2, G3, G4, G5])
arr3 = rand(6)
v3 = inject(arr3, bas24)
V3 = inject(arr3, [G0, G1, G2, G3, G4, G5])
arr4 = rand(6)
v4 = inject(arr4, bas24)
V4 = inject(arr4, [G0, G1, G2, G3, G4, G5])
@test isapprox(dot(v1, v1), dot(V1, V1))
@test isapprox(dot(v1 * v2 * v3, g1), dot(V1 * V2 * V3, G1))
@test isapprox(dot(v1 * v2 * v3, g2), dot(V1 * V2 * V3, G2))
@test isapprox(dot(v1 * v2 * v3, g3), dot(V1 * V2 * V3, G3))
@test isapprox(dot(v1 * v2 * v3, g0), dot(V1 * V2 * V3, G0))
@test isapprox(embed(v1 * v2 * v3), V1 * V2 * V3)
@test isapprox(embed(v1 * v2 * v3 * v4), V1 * V2 * V3 * V4)
@test isapprox(embed(exp(v1 * v2)), exp(V1 * V2))
@test isapprox(embed(bivector_exp(v1 * v2)), bivector_exp(V1 * V2))

run_common_tests(me1, me2, me3, mo1, mo2, mo3, v1, v2)

# Conversion
run_conversion_tests(me1, me2, mo1, mo2, GA24.Even{Float32}, GA24.Odd{Float32})
