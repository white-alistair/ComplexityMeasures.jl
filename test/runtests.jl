using Test
using ComplexityMeasures

defaultname(file) = uppercasefirst(replace(splitext(basename(file))[1], '_' => ' '))
testfile(file, testname=defaultname(file)) = @testset "$testname" begin; include(file); end
@testset "ComplexityMeasures.jl" begin
    include("probabilities/probabilities.jl")
    include("entropies/entropies.jl")
    include("complexity/complexity.jl")

    # When multiscale is exported, this should be turned on
    # include("multiscale/multiscale.jl")

    # Various
    testfile("utils/fasthist.jl")
    testfile("utils/encoding.jl")
    testfile("convenience.jl")
    testfile("deprecations.jl")
end
