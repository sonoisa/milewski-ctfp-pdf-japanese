# プログラマのための圏論 (Category Theory For Programmers 日本語版）

これは[Category Theory For Programmers 非公式PDF版](https://github.com/hmemcpy/milewski-ctfp-pdf)を日本語に翻訳するプロジェクトです。

![Category Theory for Programmers][ctfp image]
画像の出典: https://github.com/hmemcpy/milewski-ctfp-pdf

## 日本語版PDF

プログラマのための圏論 (Category Theory For Programmers 日本語版) のPDFファイルは下記からダウンロードできます。  
まだ翻訳の修正途中であるため、変な部分が多々あると思います。

- 閲覧用
  - [Standard Edition](https://github.com/sonoisa/milewski-ctfp-pdf-japanese/blob/master/build/ctfp.pdf)
  - [Scala Edition](https://github.com/sonoisa/milewski-ctfp-pdf-japanese/blob/master/build/ctfp-scala.pdf)
  - [OCaml Edition](https://github.com/sonoisa/milewski-ctfp-pdf-japanese/blob/master/build/ctfp-ocaml.pdf)

- 印刷用
  - [Standard Edition](https://github.com/sonoisa/milewski-ctfp-pdf-japanese/blob/master/build/ctfp-print.pdf)
  - [Scala Edition](https://github.com/sonoisa/milewski-ctfp-pdf-japanese/blob/master/build/ctfp-print-scala.pdf)
  - [OCaml Edition](https://github.com/sonoisa/milewski-ctfp-pdf-japanese/blob/master/build/ctfp-print-ocaml.pdf)


## 翻訳の進捗状況

- [x] ChatGPTを用いた全ページの機械翻訳
- [x] サンプリングしたページにおける単語レベルの誤訳の修正
- 各ページの翻訳修正
  - [x] 0.0
  - [ ] 1.1
  - [ ] 1.2
  - [ ] 1.3
  - [ ] 1.4
  - [ ] 1.5
  - [ ] 1.6
  - [ ] 1.7
  - [ ] 1.8
  - [ ] 1.9
  - [ ] 1.10
  - [ ] 2.1
  - [ ] 2.2
  - [ ] 2.3
  - [ ] 2.4
  - [ ] 2.5
  - [ ] 2.6
  - [ ] 3.1
  - [ ] 3.2
  - [ ] 3.3
  - [ ] 3.4
  - [ ] 3.5
  - [ ] 3.6
  - [ ] 3.7
  - [ ] 3.8
  - [ ] 3.9
  - [ ] 3.10
  - [ ] 3.11
  - [ ] 3.12
  - [ ] 3.13
  - [ ] 3.14
  - [ ] 3.15
  - [ ] その他のページ


## 組版の手順

1. Dockerイメージをビルドします。
```
$ docker build -t ctfp:latest .
```
2. Dockerコンテナを起動します。以降、コンテナ内で作業をします。
```
$ docker run -it -v .:/doc ctfp:latest
```
3. 組版に必要なライブラリをインストールします。
```
$ cd /doc
$ nix develop
```
4. 組版を実行します。例えば、Scala版の組版をするには次のコマンドを実行します。その他のターゲットはMakefileをご確認ください。
```
$ make ctfp-scala
```

組版が成功すると、`build`ディレクトリにPDFファイルが見つかるでしょう。


## License

本書のPDFや、`src/fig` と `src/content` に格納されたTeXファイルや画像ファイルは[Creative Commons
Attribution-ShareAlike 4.0 International License][license cc by sa]ライセンスに従います。

スクリプトファイル `scraper.py` などは[GNU General Public
License version 3][license gnu gpl]ライセンスに従います。

[download badge]:
  https://img.shields.io/badge/Download-latest-green.svg?style=flat-square
[github actions link]: https://github.com/hmemcpy/milewski-ctfp-pdf/actions
[github stars]:
  https://img.shields.io/github/stars/hmemcpy/milewski-ctfp-pdf.svg?style=flat-square
[github workflow status]:
  https://img.shields.io/github/actions/workflow/status/hmemcpy/milewski-ctfp-pdf/nix-flake-check.yaml?branch=master&style=flat-square
[github latest release]:
  https://github.com/hmemcpy/milewski-ctfp-pdf/releases/latest
[license badge]:
  https://img.shields.io/badge/License-CC_By_SA-green.svg?style=flat-square
[ctfp image]:
  https://user-images.githubusercontent.com/601206/47271389-8eea0900-d581-11e8-8e81-5b932e336336.png
[bartosz github]: https://github.com/BartoszMilewski
[nixos wiki flake]: https://nixos.wiki/wiki/Flakes
[andres raba github]: https://github.com/sarabander
[contributors]: https://github.com/hmemcpy/milewski-ctfp-pdf/graphs/contributors
[license cc by sa]: https://spdx.org/licenses/CC-BY-SA-4.0.html
[license gnu gpl]: https://spdx.org/licenses/GPL-3.0.html
[blogpost series]:
  https://bartoszmilewski.com/2014/10/28/category-theory-for-programmers-the-preface/
[buy regular edition on blurb]:
  https://www.blurb.com/b/9621951-category-theory-for-programmers-new-edition-hardco
[buy scala edition on blurb]:
  https://www.blurb.com/b/9603882-category-theory-for-programmers-scala-edition-pape
[v1.3.0 github release link]:
  https://github.com/hmemcpy/milewski-ctfp-pdf/releases/tag/v1.3.0
[nix website]: https://nixos.org/nix/
[nix download website]: https://nixos.org/download.html
