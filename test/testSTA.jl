#Test suite for STA.
#Test STAnd-alone results and compares with GA(4,4)

(g0,g1,g2,g3) = g0 = (basSTA[1], basSTA[2], basSTA[3], basSTA[4])
I4 = g0*g1*g2*g3

@test map(x->dot(x,x), basSTA) == [1,-1,-1,-1]
@test testbas(basSTA) 

me1 = rand() + rand()*g1*g2 + g1*g3*rand() + g3*rand()*g2 - rand()*g1*g0 + g2*g0/rand() + rand()*g3*g0 + rand()*I4
me2 = rand() + rand()*g1*g2 + g1*g3*rand() + g3*rand()*g2 - rand()*g1*g0 + g2*g0/rand() + rand()*g3*g0 + rand()*I4
me3 = rand() + rand()*g1*g2 + g1*g3*rand() + g3*rand()*g2 - rand()*g1*g0 + g2*g0/rand() + rand()*g3*g0 + rand()*I4
mo1 = rand()*g1 + rand()*g2 + g3*rand() + g0*rand() + I4*(rand()*g1 + rand()*g2 + g3*rand() + g0*rand())
mo2 = rand()*g1 + rand()*g2 + g3*rand() + g0*rand() + I4*(rand()*g1 + rand()*g2 + g3*rand() + g0*rand())
mo3 = rand()*g1 + rand()*g2 + g3*rand() + g0*rand() + I4*(rand()*g1 + rand()*g2 + g3*rand() + g0*rand())



#Comparison with GA(4,4)
G0 = bas44[1]
G1 = bas44[5]
G2 = bas44[6]
G3 = bas44[7]
arr1 = rand(4)
v1 = inject(arr1,basSTA)
V1 = inject(arr1,[G0,G1,G2,G3])
arr2 = rand(4)
v2 = inject(arr2,basSTA)
V2 = inject(arr2,[G0,G1,G2,G3])
arr3 = rand(4)
v3 = inject(arr3,basSTA)
V3 = inject(arr3,[G0,G1,G2,G3])
arr4 = rand(4)
v4 = inject(arr4,basSTA)
V4 = inject(arr4,[G0,G1,G2,G3])
@test isapprox(dot(v1,v1),dot(V1,V1))
@test isapprox(dot(v1*v2*v3,g1), dot(V1*V2*V3,G1))
@test isapprox(dot(v1*v2*v3,g2), dot(V1*V2*V3,G2))
@test isapprox(dot(v1*v2*v3,g3), dot(V1*V2*V3,G3))
@test isapprox(dot(v1*v2*v3,g0), dot(V1*V2*V3,G0))
@test isapprox(embed(v1*v2*v3), V1*V2*V3)
@test isapprox(embed(v1*v2*v3*v4), V1*V2*V3*V4)
@test isapprox(embed(exp(v1*v2)),exp(V1*V2))
@test isapprox(embed(expb(v1*v2)),expb(V1*V2))

include("testcommon.jl")