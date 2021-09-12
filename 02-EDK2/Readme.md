# EDK2
Intelが作ったUEFIとかを作るためのやつ

リポジトリ

https://github.com/tianocore/edk2

クローンする時にはsubmoduleも取得するので
```
git clone --recursive https://github.com/tianocore/edk2
```
のがいい

# EDK2でのハローワールド

## 必要なもの
- パッケージ宣言ファイル (.dec)
- パッケージ記述ファイル (.dsc)
- コンポーネント定義ファイル (.inf)
- ソースコード (.c)

まとめたものをMiLoaderPkgに入れておいた



## EDKを使ってビルド
dockerコンテナに接続してedk2のディレクトリで作業

### 準備 
まずはLoaderのソースコードのリンクを作る。
EDK2の直下で良い
```:/root/edk2
ln -s /root/dir/MiLoaderPkg ./
```

あと、EDK2のベースツールのインストール
```
make -C BaseTools
```
正直この辺は自動化したいと思っていなくもない

### EDKの初期化
以下のコマンド実行時、`Conf/target.txt`が自動生成される
```
source edksetup.sh
```

### ターゲット設定
`Conf/target.txt`の編集。ターゲットの設定などがここでできる。とりあえず以下のように値を設定する。

| 設定項目 | オプション | 設定値 | 
| -- | -- | -- |
ACTIVE_PLATFORM | -p, --platform | MiLoaderPkg/MiLoaderPkg.dsc
TARGET | -d, --debug=DEBUG| DEBUG
TARGET_ARCH | -a , --arch | X64
TOOL_CHAIN_TAG |-t , --tagname | CLANG38

macOSで実行する場合、最後の`TOOL_CHAIN_TAG`を変える必要がある的な記事もあった。

### ビルドしてefiファイルを作る
以下のコマンドでビルド。なお、上記のオプションを使ってもできると思われる（やったことない）
```:edk2/
build 
```



これが完了すると`edk2/Build/MiLoaderX64/DEBUG_CLANG38/X64/Loader.efi`が作成されている。

このファイルを`BOOTX64.efi`として起動させるとソースコードで指定した文字列になっている。




