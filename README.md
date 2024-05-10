# heif-to-webp

Script to convert HEIF to WebP

## インストール

このプロジェクトでは、`heif-convert`と`cwebp`というツールを使用します。以下の手順でそれぞれをインストールしてください。

### heif-convert のインストール

`heif-convert`は HEIF 形式の画像を他の形式に変換するためのツールです。以下のコマンドでインストールできます。

# Ubuntu の場合

sudo apt-get install libheif-examples

# macOS の場合

brew install libheif

### cwebp のインストール

`cwebp`は JPEG や PNG などの画像を WebP 形式に変換するためのツールです。以下のコマンドでインストールできます。

# Ubuntu の場合

sudo apt-get install webp

# macOS の場合

brew install webp

## スクリプトの使用方法

スクリプトの使用方法は以下の通りです。

1. スクリプトをダウンロードし、実行可能にします。

chmod +x script_name.sh

2. スクリプトを実行します。

`./script_name.sh ~/YourDirectory 70`

第一引数が対象の HEIF ファイルまたは HEIF ファイルを含むディレクトリ、第二引数が WebP の画質です

このスクリプトは、指定されたディレクトリ内のすべての HEIF 画像を WebP 形式に変換します。変換された画像は元の画像と同じディレクトリに保存されます。

## ライセンス

このプロジェクトは MIT ライセンスの下で公開されています。詳細は[LICENSE](./LICENSE)をご覧ください。
