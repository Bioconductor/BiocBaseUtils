
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
#> R version 4.6.0 Patched (2026-04-24 r89961)
#> Platform: x86_64-pc-linux-gnu
#> Running under: Ubuntu 24.04.4 LTS
#> 
#> Matrix products: default
#> BLAS:   /usr/lib/x86_64-linux-gnu/blas/libblas.so.3.12.0 
#> LAPACK: /usr/lib/x86_64-linux-gnu/lapack/liblapack.so.3.12.0  LAPACK version 3.12.0
#> 
#> locale:
#>  [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C              
#>  [3] LC_TIME=en_US.UTF-8        LC_COLLATE=en_US.UTF-8    
#>  [5] LC_MONETARY=en_US.UTF-8    LC_MESSAGES=en_US.UTF-8   
#>  [7] LC_PAPER=en_US.UTF-8       LC_NAME=C                 
#>  [9] LC_ADDRESS=C               LC_TELEPHONE=C            
#> [11] LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C       
#> 
#> time zone: America/New_York
#> tzcode source: system (glibc)
#> 
#> attached base packages:
#> [1] stats     graphics  grDevices utils     datasets  methods   base     
#> 
#> other attached packages:
#> [1] BiocBaseUtils_1.15.0
#> 
#> loaded via a namespace (and not attached):
#>  [1] compiler_4.6.0      BiocManager_1.30.27 credentials_2.0.3  
#>  [4] yaml_2.3.12         fastmap_1.2.0       R6_2.6.1           
#>  [7] BiocAddins_0.99.26  knitr_1.51          tibble_3.3.1       
#> [10] desc_1.4.3          openssl_2.4.0       rprojroot_2.1.1    
#> [13] pillar_1.11.1       rlang_1.2.0         cachem_1.1.0       
#> [16] xfun_0.57           sys_3.4.3           fs_2.1.0           
#> [19] pkgload_1.5.2       otel_0.2.0          memoise_2.0.1      
#> [22] cli_3.6.6           withr_3.0.2         magrittr_2.0.5     
#> [25] digest_0.6.39       rstudioapi_0.18.0   devtools_2.5.2     
#> [28] askpass_1.2.1       gert_2.3.1          lifecycle_1.0.5    
#> [31] vctrs_0.7.3         evaluate_1.0.5      glue_1.8.1         
#> [34] whisker_0.4.1       codetools_0.2-20    sessioninfo_1.2.3  
#> [37] rsconnect_1.8.0     pkgbuild_1.4.8      rmarkdown_2.31     
#> [40] purrr_1.2.2         tools_4.6.0         usethis_3.2.1      
#> [43] pkgconfig_2.0.3     ellipsis_0.3.3      htmltools_0.5.9
```

Please report minimally reproducible bugs at our [github issue
page](https://github.com/Bioconductor/BiocBaseUtils/issues).
