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
    for file in "$1"/*.{heic,jpg}; do
        # HEICをJPEGに変換
        if [[ $file == *.heic ]]; then
            heif-convert "$file" temp.jpg
            # JPEGをWebPに変換
            cwebp -q $quality temp.jpg -o "${file%.heic}.webp"
            # 一時ファイルの削除
            rm temp.jpg
        elif [[ $file == *.jpg ]]; then
            # JPEGをWebPに変換
            cwebp -q $quality "$file" -o "${file%.jpg}.webp"
        fi
    done
# 引数がファイルの場合
elif [ -f "$1" ]; then
    # HEICをJPEGに変換
    if [[ $1 == *.heic ]]; then
        heif-convert "$1" temp.jpg
        # JPEGをWebPに変換
        cwebp -q $quality temp.jpg -o "${1%.heic}.webp"
        # 一時ファイルの削除
        rm temp.jpg
    elif [[ $1 == *.jpg ]]; then
        # JPEGをWebPに変換
        cwebp -q $quality "$1" -o "${1%.jpg}.webp"
    fi
else
    echo "$1 is not a valid file or directory"
    exit 1
fi