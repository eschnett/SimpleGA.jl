#Tests of GA(32,32)
#Full fat products are slow in this algebra, so test with random subsets

bas64 = GA3232.basis
#! format:off
@test map(x->dot(x,x), bas64) == [  1,-1,1,-1,1,-1,1,-1,
                                    1,-1,1,-1,1,-1,1,-1,
                                    1,-1,1,-1,1,-1,1,-1,
                                    1,-1,1,-1,1,-1,1,-1,
                                    1,-1,1,-1,1,-1,1,-1,
                                    1,-1,1,-1,1,-1,1,-1,
                                    1,-1,1,-1,1,-1,1,-1,
                                    1,-1,1,-1,1,-1,1,-1]
#! format:on
@test testbas(bas64)

function randvec(n)
    rints = rand(1:64, n)
    bas = map(i -> GA3232.basis[i], rints)
    return inject(rand(n), bas)
end

v1 = randvec(10)
v2 = randvec(10)
v3 = randvec(10)

#Distributivity
@test isapprox(v1 * (v2 + v3), v1 * v2 + v1 * v3)

#Associativity
@test isapprox(v1 * (v2 * v3), (v1 * v2) * v3)

v1 = randvec(2)
v2 = randvec(2)
v3 = randvec(2)
v4 = randvec(2)
v5 = randvec(2)
v6 = randvec(2)
v7 = randvec(2)
v8 = randvec(2)

me1 = v1 * v2 * v3 * v4 * v5 * v6 * v7 * v8
@test isapprox(
    me1,
    project(me1, 0) + project(me1, 2) + project(me1, 4) + project(me1, 6) + project(me1, 8),
)
mo1 = v1 * v2 * v3 * v4 * v5 * v6 * v7
@test isapprox(mo1, project(mo1, 1) + project(mo1, 3) + project(mo1, 5) + project(mo1, 7))
