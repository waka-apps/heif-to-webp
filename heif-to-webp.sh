#!/bin/bash
# 引数のチェック
if [ $# -lt 1 ]; then
    echo "Usage: $0 <file or directory> [quality]"
    exit 1
fi
# 画質の設定
quality=${2:-80}
# 引数がディレクトリの場合
if [ -d "$1" ]; then
    # findコマンドを使用して大文字小文字を区別しない検索
    find "$1" -type f \( -iname "*.heic" -o -iname "*.jpg" -o -iname "*.png" \) | while read file; do
        if [[ $file == *.heic || $file == *.HEIC ]]; then
            heif-convert "$file" temp.jpg
            cwebp -q $quality temp.jpg -o "${file%.*}.webp"
            rm temp.jpg
        elif [[ $file == *.jpg || $file == *.JPG || $file == *.png || $file == *.PNG ]]; then
            cwebp -q $quality "$file" -o "${file%.*}.webp"
        fi
    done
# 引数がファイルの場合
elif [ -f "$1" ]; then
    file="$1"
    if [[ $file == *.heic || $file == *.HEIC ]]; then
        heif-convert "$file" temp.jpg
        cwebp -q $quality temp.jpg -o "${file%.*}.webp"
        rm temp.jpg
    elif [[ $file == *.jpg || $file == *.JPG || $file == *.png || $file == *.PNG ]]; then
        cwebp -q $quality "$file" -o "${file%.*}.webp"
    fi
else
    echo "$1 is not a valid file or directory"
    exit 1
fi