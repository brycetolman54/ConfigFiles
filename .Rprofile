# change to the right working directory
setwd("C:/Users/bat20/OneDrive\ -\ Brigham\ Young\ University/BYU/2024/Fall/BIO564/Codes")

# load some libraries I always use
suppressMessages({library(tidyverse)})
suppressMessages({library(tidymodels)})
suppressMessages({library(keras3)})
suppressMessages({library(reticulate)})

# set the virtual env location for reticulate
use_virtualenv(paste0("C:/Users/bat20/.virtualenvs/r-keras"), required = TRUE)

# Settings based on if I am in the terminal or not
if(interactive()) {

    # clear the screen on startup
    cat("\014")

} else {
    
    # allow autocomplete in the terminal
    options(repl.tab.complete = TRUE)

    # let me clear the screen in the terminal
    c = function() {
        invisible(system("clear"))
    }
}

# Let's me change the working directory to a set of presets
cd = function(name = "class") {
    paths = list(
        "home" = "C:/Users/bat20",
        "class" = "C:/Users/bat20/OneDrive - Brigham Young University/BYU/2024/Fall/BIO564/Codes",
        "lab" = "C:/Users/bat20/OneDrive - Brigham Young University/BYU/2024/Fall/Lab"
    )

    if (!is.null(paths[[name]])) {
        setwd(paths[[name]])
        cat("Changed directory to", paths[[name]], "\n")
    } else {
        cat("Directory name not found.\n")
    }
}
