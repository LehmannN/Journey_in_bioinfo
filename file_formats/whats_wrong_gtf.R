#!/usr/bin/env Rscript


get_extension <- function(x) {
        ext <- strsplit(basename(x), split="\\.")[[1]]
    return(ext[length(ext)])
}
