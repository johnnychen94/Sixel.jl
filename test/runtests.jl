using Sixel
using Test
using ImageCore, IndirectArrays, TestImages
using ImageQualityIndexes
using LinearAlgebra

sixel_output = Sixel.is_sixel_supported()
sixel_output || @info "Current terminal does not support sixel format sequence. Display tests to stdout will be marked as broken."
function test_sixel_display(f)
    if sixel_output
        @test_nowarn f()
    else
        @test_broken false
    end
end

@testset "Sixel.jl" begin
    include("backend/libsixel.jl")
end
