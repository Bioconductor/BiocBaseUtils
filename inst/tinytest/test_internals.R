setClass("A", representation = representation(slotA = "character"))
aclass <- new("A", slotA = "A")
aclass <- replaceSlots(aclass, slotA = "B")
expect_identical(aclass@slotA, "B")

invObj <- BiocUtils:::unsafe_replaceSlots(aclass, slotA = 42)
expect_error(
    methods::validObject(invObj)
)
expect_error(
    replaceSlots(aclass, slotA = 42)
)
