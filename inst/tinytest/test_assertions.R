expect_true(isTRUEorFALSE(TRUE))
expect_true(isTRUEorFALSE(FALSE))
expect_true(isTRUEorFALSE(NA, na.ok = TRUE))
expect_false(isSingleCharacter(LETTERS))

expect_true(isSingleCharacter("L"))
expect_true(isCharacter(LETTERS))
expect_true(isCharacter(NA_character_, na.ok = TRUE))
expect_false(is01character(""))
expect_true(is01character("", zchar = TRUE))

expect_true(isSingleInteger(1L))
expect_false(isSingleInteger(1))

expect_true(isSingleNumber(1))
expect_false(isSingleNumber(1:2))
