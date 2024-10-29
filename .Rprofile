# change to the right working directory
setwd("C:/Users/bat20/OneDrive\ -\ Brigham\ Young\ University/BYU/2024/Fall/BIO564/Codes")

# load some libraries I always use
suppressMessages({library(tidyverse)})
suppressMessages({library(tidymodels)})
suppressMessages({library(keras3)})
suppressMessages({library(reticulate)})

# set the virtual env location for reticulate
use_virtualenv(paste0("C:/Users/bat20/.virtualenvs/r-keras"), required = TRUE)

# allow autocomplete in the terminal
options(repl.tab.complete = TRUE)

# let me clear the screen in the terminal
cc = function() {
    invisible(system("clear"))
}

# Let's me change the working directory to a set of presets
cd = function(name = "cds") {
    paths = list(
        "home" = "C:/Users/bat20",
        "cds" = "C:/Users/bat20/OneDrive - Brigham Young University/BYU/Coding/Stats",
        "class" = "C:/Users/bat20/OneDrive - Brigham Young University/BYU/2024/Fall/BIO564/Codes",
        "lab" = "C:/Users/bat20/OneDrive - Brigham Young University/BYU/2024/Fall/Lab/BreastCancer"
    )

    if (!is.null(paths[[name]])) {
        setwd(paths[[name]])
        cat("Changed directory to", paths[[name]], "\n")
        load(".RData")
        cat("Loaded Data\n")
        loadhistory(".Rhistory")
        cat("Loaded History\n")
    } else {
        cat("Directory name not found.\n")
    }
}

# Source some functions that I will often use
source("C:/Users/bat20/OneDrive - Brigham Young University/BYU/2024/Fall/Lab/BreastCancer/functions/mdMetrics.R")
source("C:/Users/bat20/OneDrive - Brigham Young University/BYU/2024/Fall/Lab/BreastCancer/functions/rocCurve.R")
source("C:/Users/bat20/OneDrive - Brigham Young University/BYU/2024/Fall/Lab/BreastCancer/functions/collectMerged.R")
source("C:/Users/bat20/OneDrive - Brigham Young University/BYU/2024/Fall/Lab/BreastCancer/functions/readFiles.R")

# go to my home


# clear the screen
if(interactive()) {
    cat("\014")
}
