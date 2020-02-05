#!/usr/bin/env bash

# **************************************************************************** #
#                                                                              #
#                                                                              #
#    gtf2bed.sh                                                                #
#                                                                 IBENS        #
#    By: lehmann                                                 CSB team      #
#                                                                              #
#    Created: 2020/01/21 18:14:06 by lehmann                                   #
#    Updated: 2020/01/21 18:14:06 by lehmann                                   #
#                                                                              #
# **************************************************************************** #

usage() { echo "Usage: $0 [-i GTF] [-d output_dir]" 1>&2; exit 1; }

# Set default value
d='.'

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


TMP=""$d"/$(basename "$i" .gtf).tmp"
BED=""$d"/$(basename "$i" .gtf).bed"
echo Building $BED

 src/bioinfo-tools/file_formats/gtfToGenePred -genePredExt -geneNameAsName2 $i $TMP
awk '{print $2"\t"$4"\t"$5"\t"$1"\t0\t"$3"\t"$6"\t"$7"\t0\t"$8"\t"$9"\t"$10}' $TMP >  $BED
rm $TMP
