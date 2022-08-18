
# BiocBaseUtils

The `BiocBaseUtils` package provides a suite of helper functions
designed to help developers. Currently, it covers three topics often
encountered during the development process.

1.  Assertions - Type checks for logical, character, and numeric inputs
2.  Slot replacement - Replacing the value of object slots
3.  `show` method - Limiting the output of internal components of a
    class

# Installation

Install the package directly from Bioconductor:

``` r
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("BiocBaseUtils")
```

# Load Package

``` r
library(BiocBaseUtils)
```

# Assertions

We provide a number of functions that helps the developer establish the
type of class of a particular object. These include `integer`,
`numeric`, `character`, and `logical`; types often used in R /
Bioconductor.

## Logical

``` r
isTRUEorFALSE(TRUE)
#> [1] TRUE
isTRUEorFALSE(FALSE)
#> [1] TRUE
isTRUEorFALSE(NA, na.ok = TRUE)
#> [1] TRUE
```

## Character

``` r
isScalarCharacter(LETTERS)
#> [1] FALSE
isScalarCharacter("L")
#> [1] TRUE
isCharacter(LETTERS)
#> [1] TRUE
isCharacter(NA_character_, na.ok = TRUE)
#> [1] TRUE
isZeroOneCharacter("")
#> [1] FALSE
isZeroOneCharacter("", zchar = TRUE)
#> [1] TRUE
```

## Numeric

``` r
isScalarInteger(1L)
#> [1] TRUE
isScalarInteger(1)
#> [1] FALSE

isScalarNumber(1)
#> [1] TRUE
isScalarNumber(1:2)
#> [1] FALSE
```

# Slot replacement

This function is often used in packages that establish formal S4
classes. When updating the value of a slot, one often uses the
`setSlots` function.

``` r
setClass("A", representation = representation(slot1 = "numeric"))
aclass <- new("A", slot1 = 1:10)
aclass
#> An object of class "A"
#> Slot "slot1":
#>  [1]  1  2  3  4  5  6  7  8  9 10
```

Now we use the `setSlots` function to update the values in the object.

``` r
aclass <- setSlots(aclass, slot1 = 11:20)
aclass
#> An object of class "A"
#> Slot "slot1":
#>  [1] 11 12 13 14 15 16 17 18 19 20
```

Note that `setSlots` provides the same functionality as
`BiocGenerics:::replaceSlots` but is more consistent with Bioconductor
the setter and getter language.

# `show` method

The `selectSome` function allows the developer to display a limited
amount of information from a developed class. Note that the use of the
`@` here is due to the minimal implementation in the examples provided.
The developer should always provide an interface to access the internal
components of the class via an ‘accessor’ function.

``` r
setMethod("show", signature = "A", function(object) {
    s1info <- getElement(object, "slot1")
    cat("A sequence:", selectSome(s1info))
})
aclass
#> A sequence: 11 12 ... 19 20
```

# Contributing

`BiocBaseUtils` is a work in progress and we welcome contributions.
There are quite a few often-used utility functions that are yet to be
included in the package. We would like to keep the dependencies in this
package minimal; therefore, contributions should mostly use base R.

# Session Info

``` r
sessionInfo()
#> R version 4.2.1 (2022-06-23)
#> Platform: x86_64-pc-linux-gnu (64-bit)
#> Running under: Ubuntu 20.04.4 LTS
#> 
#> Matrix products: default
#> BLAS:   /usr/lib/x86_64-linux-gnu/blas/libblas.so.3.9.0
#> LAPACK: /usr/lib/x86_64-linux-gnu/lapack/liblapack.so.3.9.0
#> 
#> locale:
#>  [1] LC_CTYPE=C.UTF-8       LC_NUMERIC=C           LC_TIME=C.UTF-8       
#>  [4] LC_COLLATE=C.UTF-8     LC_MONETARY=C.UTF-8    LC_MESSAGES=C.UTF-8   
#>  [7] LC_PAPER=C.UTF-8       LC_NAME=C              LC_ADDRESS=C          
#> [10] LC_TELEPHONE=C         LC_MEASUREMENT=C.UTF-8 LC_IDENTIFICATION=C   
#> 
#> attached base packages:
#> [1] stats     graphics  grDevices datasets  utils     methods   base     
#> 
#> other attached packages:
#> [1] BiocBaseUtils_0.99.10
#> 
#> loaded via a namespace (and not attached):
#>  [1] compiler_4.2.1   magrittr_2.0.3   fastmap_1.1.0    htmltools_0.5.3 
#>  [5] tools_4.2.1      yaml_2.3.5       codetools_0.2-18 stringi_1.7.8   
#>  [9] rmarkdown_2.15   knitr_1.39       stringr_1.4.0    xfun_0.32       
#> [13] digest_0.6.29    rlang_1.0.4      renv_0.15.5      evaluate_0.16
```

Please report minimally reproducible bugs at our [github issue
page](https://github.com/Bioconductor/BiocBaseUtils/issues).
