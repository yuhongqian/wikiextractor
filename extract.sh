#!/bin/bash
#SBATCH -n 1 # Number of cores
#SBATCH -N 1 # Ensure that all cores are on one machine
#SBATCH --mem=8192 # Memory - Use up to 8G
#SBATCH --time=0 # No time limit
#
# NOTES
#
# - Must expand templates to avoid a large loss of content.
# - Text will not (redundantly) contain the title string.
# - Keep sections. Section title will be marked by "Section::::".
# - Keep lists. List bullets will be marked by "BULLET::::".
# - Keep tables. They're mostly garbage but can be removed later (remove "^!*").
# - Remove disambiguation pages. Right now there is no use for them.

INPUT="/bos/tmp10/hongqiay/enwiki-20191220-pages-articles-multistream.xml"
processes=4
TEMPLATES=$3
OUTPUT="/bos/tmp10/hongqiay/extractorOut"

python WikiExtractor.py $INPUT \
       --json \
       --processes $PROCESSES \
	   --no-templates
       --output $OUTPUT \
       --bytes 1M \
	   --filter_disambig_pages=True \
       --compress \
       --links \
       --sections \
       --lists \
       --keep_tables \
       --min_text_length 0 \
       --filter_disambig_pages
