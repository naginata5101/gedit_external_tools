#!/bin/bash -eu
# BibTeX用の（BIB）ファイルを用いた、LaTeXの包括的なコンパイルを行うコマンド

# ファイル名が "*.tex" であるか確認
if [[ ! ${GEDIT_CURRENT_DOCUMENT_NAME} =~ .*\.tex ]]; then
echo "!! This isn't a LaTeX file. !!"
exit
fi


# 編集中ファイルの拡張子を除いた名前を取得する
file=$(basename ${GEDIT_CURRENT_DOCUMENT_NAME} .tex)

# 一度TEXファイルのコンパイルを行い、AUXファイルを仮作成
echo ""
echo ">> platex ${file} <<"
platex ${file}

# 同一フォルダ内にBIBファイルが存在した場合、
if [ -e *.bib ]; then
# AUXを元にBIBファイルをコンパイルし、BBLファイルを作成
echo ">> pbibtex -kanji=utf8 ${file} <<"
pbibtex -kanji=utf8 ${file}
fi

# BBLを元にAUXファイルを再度作成
echo ""
echo ">> platex -synctex=1 ${file} [first] <<"
platex -synctex=1 ${file}
# 必要なファイルが揃ったところで、最終コンパイル
echo ""
echo ">> platex -synctex=1 ${file} [second] <<"
platex -synctex=1 ${file}

# 完成したDVIファイルをPDFファイルに変換
echo ""
echo ">> dvipdfmx "${file}.dvi" <<"
dvipdfmx "${file}.dvi"

# 作成したPDFファイルを表示
# echo ""
# echo ">> qpdfview --unique "${file}.pdf#src:${file}.tex:${GEDIT_CURRENT_LINE_NUMBER}:0" <<"
# qpdfview --unique "${file}.pdf#src:${file}.tex:${GEDIT_CURRENT_LINE_NUMBER}:0"

