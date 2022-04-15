expect_true(isTRUEorFALSE(TRUE))
expect_true(isTRUEorFALSE(FALSE))
expect_true(isTRUEorFALSE(NA, na.ok = TRUE))
expect_false(isScalarCharacter(LETTERS))

expect_true(isScalarCharacter("L"))
expect_true(isCharacter(LETTERS))
expect_true(isCharacter(NA_character_, na.ok = TRUE))
expect_false(isZeroOneCharacter(""))
expect_true(isZeroOneCharacter("", zchar = TRUE))

expect_true(isScalarInteger(1L))
expect_false(isScalarInteger(1))

expect_true(isScalarNumber(1))
expect_false(isScalarNumber(1:2))
