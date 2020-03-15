# STAT302PACKAGEDH
[![Build Status](https://travis-ci.com/NauticaSunwind/STAT302PACKAGEDH.svg?branch=master)](https://travis-ci.com/NauticaSunwind/STAT302PACKAGEDH)
[![codecov](https://codecov.io/gh/NauticaSunwind/STAT302PACKAGEDH/branch/master/graph/badge.svg)](https://codecov.io/gh/NauticaSunwind/STAT302PACKAGEDH)
# Installation
To download the STAT302PACKAGEDH package, use the code below.
```{r}
# install.packages("devtools")
devtools::install_github("NauticaSunwind/STAT302PACKAGEDH")
library(STAT302PACKAGEDH)
```
# Use
The vignette demonstrates example usage of all main functions. Please file an issue if you have a request for a tutorial that is not currently included. You can see the vignette by using the following code (note that this requires a TeX installation to view properly):
```{r}
# install.packages("devtools")
devtools::install_github("NauticaSunwind/STAT302PACKAGEDH", build_vignette = TRUE, build_opts = c())
library(STAT302PACKAGEDH)
# Use this to view the vignette in the STAT302PACKAGEDH HTML help
help(package = "STAT302PACKAGEDH", help_type = "html")
# Use this to view the vignette as an isolated HTML file
utils::browseVignettes(package = "STAT302PACKAGEDH")
```
