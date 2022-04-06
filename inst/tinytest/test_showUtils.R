expect_identical(
    length(selectSome(letters, maxToShow = 5)), 5L
)

expect_identical(
    length(selectSome(letters, maxToShow = 3)), 3L
)

expect_true(
    "??" %in% selectSome(letters, ellipsis = "??", maxToShow = 5)
)

expect_identical(
    match("??", selectSome(letters, ellipsis = "??")), 3L
)

expect_identical(
    match("??",
        selectSome(
            letters, ellipsis = "??", ellipsisPos = "start", maxToShow = 3
        )
    ),
    1L
)

expect_identical(
    match("??",
          selectSome(
              letters, ellipsis = "??", ellipsisPos = "end", maxToShow = 5L
          )
    ),
    5L
)
