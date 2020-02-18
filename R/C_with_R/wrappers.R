#!/usr/bin/env Rscript

# Wrapper function to invoke "helloA" at the shell.
dyn.load()
helloA <- function() {
      system(paste(getwd(),"fc_printf",sep="/"))
}
