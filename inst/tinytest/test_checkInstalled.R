expect_error(
    checkInstalled("abc123xyzjfk"),
    paste0(
        "The calling function requires missing package dependencies:",
        "\n  \"abc123xyzjfk\""
    )
)

tinytest::expect_match(
    trimws(
        capture.output(
            tryCatch({
                checkInstalled("abc123xyzjfk")
            }, error = function(e) {
                invisible()
            })
        )[3]
    ),
    "BiocManager::install\\(\\\"abc123xyzjfk\\\"\\)"
)

expect_true(
    checkInstalled(c("base", "datasets"))
)
