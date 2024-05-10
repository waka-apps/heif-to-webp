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
    for file in "$1"/*.heic; do
        # HEICをJPEGに変換
        heif-convert "$file" temp.jpg
        # JPEGをWebPに変換
        cwebp -q $quality temp.jpg -o "${file%.heic}.webp"
    done
    # 一時ファイルの削除
    rm temp.jpg
# 引数がファイルの場合
elif [ -f "$1" ]; then
    # HEICをJPEGに変換
    heif-convert "$1" temp.jpg
    # JPEGをWebPに変換
    cwebp -q $quality temp.jpg -o "${1%.heic}.webp"
    # 一時ファイルの削除
    rm temp.jpg
else
    echo "$1 is not a valid file or directory"
    exit 1
fi
