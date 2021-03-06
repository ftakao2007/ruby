# ================================================ #
# 組み込み定数
### 主な組み込み定数
# STDIN  : 標準入力
# STDOUT : 標準出力
# STDERR : 標準エラー出力
# ENV    : 環境変数
# ARGF   : 仮想ファイル
# ARGV   : Rubyスクリプトに与えられた引数
# DATA   : __END__ 以降をアクセスするFileオブジェクト

### コマンドライン引数を出力
# p ARGV[0]

### 環境変数を出力
# p ENV
# p ENV["PATH"]

# ================================================ #
# 組み込み変数
### 主な組み込み変数
# $LOAD_PATH : Rubyをインストールしたディレクトリやカレントディレクトリが入っている

### 例
# p $LOAD_PATH
# ["/usr/local/rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.13.6/lib",
#  "/home/ftakao2007/.rubymine_helpers/rb/testing/patch/common",
#  "/home/ftakao2007/.rubymine_helpers/rb/testing/patch/testunit",
#  "/usr/local/rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.13.6/lib/gems/bundler-1.13.6/lib",
#  "/usr/local/rbenv/versions/2.3.1/lib/ruby/site_ruby/2.3.0",
#  "/usr/local/rbenv/versions/2.3.1/lib/ruby/site_ruby/2.3.0/x86_64-linux",
#  "/usr/local/rbenv/versions/2.3.1/lib/ruby/site_ruby",
#  "/usr/local/rbenv/versions/2.3.1/lib/ruby/vendor_ruby/2.3.0",
#  "/usr/local/rbenv/versions/2.3.1/lib/ruby/vendor_ruby/2.3.0/x86_64-linux",
#  "/usr/local/rbenv/versions/2.3.1/lib/ruby/vendor_ruby",
#  "/usr/local/rbenv/versions/2.3.1/lib/ruby/2.3.0",
#  "/usr/local/rbenv/versions/2.3.1/lib/ruby/2.3.0/x86_64-linux"]
#  ※ コマンドラインで実行している場合はRubyを実行したカレントディレクトリも入る
#  ※ ここになければRUBYLIBを検索する

# ================================================ #
# Rubyインタプリタが利用する環境変数
### 主な環境変数
# $RUBYOPT : デフォルトで指定するコマンドラインオプション
# $RUBYLIB : デフォルトでライブラリを検索するPATH。これより先に $LOAD_PATHが読み込まれる。
# $PATH    : Ruby上から実行したコマンドを検索するPATH
### おまけ
# $RAILS_ENV : Railsの環境(production, environment, testなど)を指定

# ================================================ #
# コマンドラインオプション
### 主なコマンドラインオプション
# -h  : ヘルプの表示
# -v  : バージョンの表示
# -c  : プログラムの文法チェック (実行はしない)
# -e  : ワンライナー実行する
# -w  : 冗長モードで実行 (普段は出ないワーニングが出る)
# -Wn : (n = 0,1,2,(無し)) 出力範囲を指定した冗長モードでの実行。-W2もしくは-W は全て出力
# -I  : (大文字のアイ) 組み込み変数 $LOAD_PATH に指定された文字列を追加する
# -r  : スクリプト実行前に指定されたスクリプトを実行する
# -d  : デバッグモードで実行する

# ================================================ #
# require,load など

### 違い
# require : 何度実行しても1回しか実行されない。ファイルの拡張子を省略できる。ライブラリの読み込み用途
# load    : 実行された回数だけ実行する。ファイルの拡張子は省略できない。設定情報の読み込み用途
# include :

### コマンドラインオプション「-I」の挙動について
# 絶対PATHで指定 : そのPATHにファイルが存在するかどうかだけ見る。
# 相対PATHで指定 : 組み込み変数 $LOAD_PATH に格納されたPATH順に探していく。
#
# -Iで指定したPATHを最優先で検索する
#

# ================================================ #
# 特殊変数

### 特殊変数とは
# 組み込み変数のうち、「$」と数字や記号で構成されたもの

### 例 (組み込み変数$LOAD_PATHを特殊変数で参照)
# p $:

### 主な特殊変数
# $_ : 最後にgetsかreadlineで読み込んだ文字列
# $& : 最後にマッチした文字列
# $~ : 最後に成功したマッチに対する結果。$~[n]で参照できる
# $` : マッチした部分より前の文字列
# $' : マッチした部分より後ろの文字列
# $+ : マッチした中で最後のカッコに対応する文字列
# $1, $2, ... : n番目のカッコに対応する文字列
# $? : 最後に終了した子プロセスのステータス
# $! : 直近で捕捉した例外オブジェクト
# $@ : バックトレースを表す配列
# $0 : 現在実行中のプログラムファイル名
# $* : Rubyスクリプトに与えられた引数。 ARGVと同じ。
# $: : loadやrequireの検索PATH。 $LOAD_PATHと同じ。


# ================================================ #
# リファレンス表示ツールri
### riの使い方
# クラス             : ri クラス名
# クラスメソッド      : ri クラス名.メソッド名
# インスタンスメソッド : ri クラス名#メソッド名

# ================================================ #
# RDoc書式

### マジックコメント
# /coding[:=]\s*[\w.-]+/ という正規表現にマッチする形式で記述する

### 埋め込みドキュメント
=begin
 ここに任意のドキュメントを記載できる
=end

