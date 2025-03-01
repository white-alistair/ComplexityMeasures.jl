using ComplexityMeasures
using Test

@testset "Common literature names" begin
    x = randn(1000)

    @test entropy_permutation(x) == entropy(SymbolicPermutation(), x)
    @test entropy_wavelet(x) == entropy(WaveletOverlap(), x)
    @test entropy_dispersion(x) == entropy(Dispersion(), x)
    @test entropy_sample(x) == complexity_normalized(SampleEntropy(x), x)
    @test entropy_approx(x) == complexity(ApproximateEntropy(x), x)

end

@testset "probabilities(x)" begin
    x = [1, 1, 2, 2, 3, 3]
    @test probabilities(x) == probabilities(CountOccurrences(), x) == [1/3, 1/3, 1/3]
end
