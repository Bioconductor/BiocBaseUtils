setClass("A", representation = representation(slotA = "character"))
aclass <- new("A", slotA = "A")
aclass <- setSlots(aclass, slotA = "B")
expect_identical(aclass@slotA, "B")

invObj <- BiocBaseUtils:::unsafe_replaceSlots(aclass, slotA = 42)
expect_error(
    methods::validObject(invObj)
)
expect_error(
    setSlots(aclass, slotA = 42)
)
