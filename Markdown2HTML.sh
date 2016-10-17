#!/bin/sh -eu

# 編集中ファイルの拡張子を除いた名前を取得する
file=$(basename ${GEDIT_CURRENT_DOCUMENT_NAME} .md)


# pandocを用いて変換
# "--mathjax":MathJaxを用いて数式を実現
# （"-s"がないと正常に動作しない）
echo ">> pandoc ${file}.md <<"
pandoc -s --mathjax "${file}.md" -o "${file}.html"
# 完成ファイルをFirefoxで確認
firefox "${file}.html"

