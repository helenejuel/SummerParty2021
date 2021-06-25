# SummerParty2021:

This project was done for the Hansen group Summer Party on 18/6 2021. 
Data collected in a google spreadsheet from all participating from the group and copied to excel, then saved as csv before import.
Emil Jørsboe ran the statistical correlations elsewhere, these are the 7 significant findings.

# Brief description of folder and file contents

The following folders contain:

- `data/`: raw data to analyse in .csv format
- `doc/`: markdown files (and plots, if applicable)
- `R/`: R script(s) for trying out code

# Installing project R package dependencies

If dependencies have been managed by using `usethis::use_package("packagename")`
through the `DESCRIPTION` file, installing dependencies is as easy as opening the
`SummerParty2021.Rproj` file and running this command in the console:

    # install.packages("remotes")
    remotes::install_deps()

You'll need to have remotes installed for this to work.

# Resource

For more information on this folder and file workflow and setup, check
out the [prodigenr](https://rostools.github.io/prodigenr) online
documentation.
