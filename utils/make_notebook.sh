#!/usr/bin/env bash
# **************************************************************************** #
#                                                                              #
#                                                                              #
#    make_notebook.sh                                                          #
#                                                                 IBENS        #
#    By: lehmann                                                 CSB team      #
#                                                                              #
#    Created: 2019/09/05 17:34:29 by lehmann                                   #
#    Updated: 2019/09/05 17:34:29 by lehmann                                   #
#                                                                              #
# **************************************************************************** #

usage() { echo "Usage: $0 [-i input.rmd] [-d output_dir]" 1>&2; exit 1; }

# Set default value
d='./output/'

# More on rmdformats: https://github.com/juba/rmdformats

# Get arguments from command line
while getopts ":i:d:" opt; do
    case "${opt}" in
        i)
            i=${OPTARG}
            ;;
        d)
            d=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

# Check arguments
if [ -z "${i}" ] || [ -z "${d}" ]; then
        usage
fi

# Set title name (same as file name)
tmp=$(basename $i)
tit="${tmp%.*}"
echo $tit

# Knit rmarkdown document
Rscript \
    -e "library(rmarkdown)" \
    -e "library(rmdformats)" \
    -e "render( \
                input='$i', \
                output_dir='$d', \
                clean=TRUE, \
                quiet=FALSE, \
                params=list(set_title='$tit', output_dir='$d'))"
