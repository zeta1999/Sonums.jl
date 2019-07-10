module SoftSonum

__precompile__(false)

export AbstractSonum, Sonum8, Sonum16, trainSonum,
    fillSonumTables, returnSonumList, returnSonumBounds

import Base: Float64, Float32, Float16, Int32, Int64, Int,
    (+), (-), (*), (/), sqrt, bitstring, round,
    one, zero, promote_rule, floatmin, floatmax,
    signbit, sign, isfinite, nextfloat, prevfloat, abs, inv

using Random, LinearAlgebra

include("typedef.jl")
include("helpers.jl")
include("feedback.jl")
include("conversionsInt.jl")
include("sign.jl")
include("print.jl")
include("constants.jl")
include("preallocate.jl")

# set-up zeroed number lists and bounds as constants
const sonum8 = createSonumList(Float64,8)
const sonum16 = createSonumList(Float64,16)
const bounds8 = createSonumList(Float64,8)
const bounds16 = createSonumList(Float64,16)

# set-up empty (undef) look up tables and their symmetric views
const TableMul8S, TableMul8 = createSonumTable(Sonum8,8)
const TableAdd8S, TableAdd8 = createSonumTable(Sonum8,8)
const TableSub8S, TableSub8 = createSonumTable(Sonum8,8)

const TableMul16S, TableMul16 = createSonumTable(Sonum16,16)
const TableAdd16S, TableAdd16 = createSonumTable(Sonum16,16)
const TableSub16S, TableSub16 = createSonumTable(Sonum16,16)

# set-up zeroed look up lists
const ListSqrt8 = createSonumList(Sonum8,8)
const ListInv8 = createSonumList(Sonum8,8)

const ListSqrt16 = createSonumList(Sonum16,16)
const ListInv16 = createSonumList(Sonum16,16)

# include functions that rely on sonum8, sonum16, bounds8, bounds16
include("returnSonumList.jl")
include("conversionsFloat.jl")

# define arithmetics based on lookup tables and lists
include("arithmetics8.jl")
include("arithmetics16.jl")

# functions for training and filling the lookup tables/lists
include("training.jl")
include("lookup_tables.jl")

end