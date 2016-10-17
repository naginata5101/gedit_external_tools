#!/bin/bash -eu

# Pandoc を用いて Markdown から PDF を作成する
# $1 入力ファイル
# $2 出力ファイル（デフォルト値：'[input].pdf'）

input=${GEDIT_CURRENT_DOCUMENT_NAME}
output=${2:-${input%.*}.pdf}

pandoc ${input} -o ${output} -V documentclass=ltjarticle --latex-engine=lualatex
qpdfview --unique ${output}

