# change to the right working directory
setwd("C:/Users/bat20/OneDrive\ -\ Brigham\ Young\ University/BYU/2024/Fall/BIO564/Codes")

suppressMessages({library(reticulate)})

# set the virtual env location for reticulate
use_python("C:/Users/bat20/AppData/Local/Programs/Python/Python311/Python11/python.exe", required = TRUE)

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
    } else {
        cat("Directory name not found.\n")
    }
}

# Source some functions that I will often use
lf = function(which = 'all') {
    if(which == 'all') {
        files = list.files("C:/Users/bat20/OneDrive - Brigham Young University/BYU/2024/Fall/Lab/BreastCancer/functions/", pattern = "\\.R$", full.names = TRUE)
        for(file in files) {
            source(file)
        }
    }
    else {
        paths = list(
            "bf" = "C:/Users/bat20/OneDrive - Brigham Young University/BYU/2024/Fall/Lab/BreastCancer/functions/bakeFiles.R",
            "cm" = "C:/Users/bat20/OneDrive - Brigham Young University/BYU/2024/Fall/Lab/BreastCancer/functions/collectMerged.R",
            "mm" = "C:/Users/bat20/OneDrive - Brigham Young University/BYU/2024/Fall/Lab/BreastCancer/functions/mdMetrics.R",
            "pp" = "C:/Users/bat20/OneDrive - Brigham Young University/BYU/2024/Fall/Lab/BreastCancer/functions/plotPCA.R",
            "rf" = "C:/Users/bat20/OneDrive - Brigham Young University/BYU/2024/Fall/Lab/BreastCancer/functions/readFiles.R",
            "rc" = "C:/Users/bat20/OneDrive - Brigham Young University/BYU/2024/Fall/Lab/BreastCancer/functions/rocCurve.R",
            "t" = "C:/Users/bat20/OneDrive - Brigham Young University/BYU/2024/Fall/Lab/BreastCancer/functions/timer.R"
        )
        if (!is.null(paths[[which]])) {
            source(paths[[which]])
        } else {
            cat("Function not found.\n")
        }
    }
}

# set an environment variable
Sys.setenv(TF_ENABLE_ONEDNN_OPTS = 0)

# move to lab
cd("lab")

# clear the screen
if(interactive()) {
    cat("\014")
}
