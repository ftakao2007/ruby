# ================================================ #
# 識別子
### クラス名や変数名などを構成するもの。全ての文法の基盤
### 予約語は識別子として利用できない
### nil, true, false, not, or, and, do, then, yield, rescure, unsure,
### class, module, def, undef, define?, alias, super, self, return,
### while, until, for, in, break, next, case, when, if, unless, else, elsif
### BEGIN, END, begin, end, redo, retry, __LINE__, __FILE__, __ENCODING__

# ================================================ #
# 変数
### rubyは変数の初期化時に変数の方を指定しない「動的型言語」
# a = 1
# p a
# p a.class
# a = "foo"
# p a.class

# ローカル変数
### ローカル変数の識別子 : アンダースコアと英数字
###
### 先頭に数字は利用できない
### アンダースコア以外の記号は使えない
### ダメな例 : hoge-1, initialized?, 1_to_10
### スコープ : その代入を含むブロック又はメソッドの終わりまで
### 初期化されてないときの参照
### 1. 代入文が無い場合は例外(NameError)
# p bbb
### 2.代入文が実行されなかったときはnil
# abb =
# p abb

# インスタンス変数
### インスタンス変数の命名規則
### 先頭 : @, 構成文字 : 英数字又はアンダースコア
###
### スコープ : そのインスタンス内
### 初期化されてないときの参照 : nil

# クラス変数
### クラス変数の命名規則
### 先頭 : @@, 構成文字 : 英数字又はアンダースコア
###
### スコープ : そのクラスの全インスタンス
### 初期化されてないときの参照 : 例外発生(NameError)
# p @@aab

# グローバル変数
### グローバル変数の命名規則
### 先頭 : $, 構成文字 : 英数字又はアンダースコア
###
### スコープ : どこからでも参照可能
### 初期化されてないときの参照 : nil

# 定数 (Rubyは定数の値を変更できるので)
### 定数の命名規則
### 先頭 : 英数大文字, 構成文字 : 英数字又はアンダースコア
###
### スコープ :
### 定数が定義されたクラス・モジュール
### そのクラス・モジュールで内で定義されたクラス・モジュール
### もしくはそのクラス・モジュールをインクルードしているモジュール
###
### クラス名やモジュール名で就職すれば外部からアクセス可能
### 初期化されてないときの参照 : 例外発生
### 変数名の先頭を大文字にすると定数になる
# AAA = 1
# p AAA
#
# ### 警告は出るが再代入はできる
# AAA = 2
# p AAA

# ================================================ #
# リテラル
### プログラムにそのまま記述する値のこと
### 変数と対になるもの

# 数値リテラル
### 例 : +12, -12, 0.1, 3.0e2(300.0), 3.0e-2(0.03)
## 基数指示子で進数を表現できる
### 2進数  : 0b      : 0b10 = 2
### 8進数  : 0o or 0 : 0o10 = 010 = 8
### 10進数 : 0d      : 0d10 = 10
### 16進数 : 0x      : 0x10 = 16
## 数値リテラルの中でアンダースコアが使える
### 100_000_000 = 100000000
## 有理数のリテラル
# p 42/10r
# p 3.14r
## 複素数のリテラル
# p 1+3i

# 数値演算 (比較)
### 1 == 1
### 1 != 2
### 1 < 2
### 2 >= 2

# UFO演算子
### 比較の結果を数値で返す
### A <=> B
### AがBより大きい  : 1
### AとBが同じ     : 0
### AがBより小さい  : -1

# 自己代入演算子
### Rubyには++, -- のようなインクリメント、デクリメント演算子は存在しない
### 代わりに自己代入演算子を使う
### a += 1, a -= 1, a *= 2, a **=2
# a = 2
# p a *= 3
# p a **= 2

# 継承クラスの参照
# p 1.class # Fixnum
# p 1.class.superclass # Integer
# p 1.class.superclass.superclass # Numeric
# p 1.class.superclass.superclass.superclass # Object
# p 1.class.superclass.superclass.superclass.superclass # BasicObject
# p 1.class.superclass.superclass.superclass.superclass.superclass # nil

# 加算は実際は「+メソッド」を実行している
# p 1.+(3)

# 再定義できない演算子
### :: スコープ演算子
### =  代入演算子
### ?: 条件演算子
### .., ... 範囲演算子
### && and || or not 論理演算子


# 文字のリテラル
### 「R」を表すString
# p ?R
### Ctrl+vを表すString
# p ?\C-v

# 論理値
### true と false の2つの値が存在する
### TrueClass と FalseClassのインスタンス
# p true.class
### falseとnil以外のオブジェクトはすべて真とみなされる

# 論理演算子
### && : 論理積(かつ)
### || : 論理和(または)
### !  : 否定(でない)
# if true && true;    p "ok01"; end #=> "ok01"
# if true && false;   p "ok02"; end #=>
# if false && true;   p "ok03"; end #=>
# if false && false;  p "ok04"; end #=>
#
# if true || true;    p "ok05"; end #=> "ok05"
# if true || false;   p "ok06"; end #=> "ok06"
# if false || true;   p "ok07"; end #=> "ok07"
# if false || false;  p "ok08"; end #=>
#
# if !true;           p "ok09"; end #=>
# if true && !false;  p "ok10"; end #=> "ok10"
#
# if true && nil;     p "ok11"; end #=>

### 左辺で結果が確定する場合は右辺を評価しない
# if true || false && false;    p "ok12"; end #=> "ok12" ### 最初のtrueで確定している
# if true && true  || false;    p "ok13"; end #=> "ok13" ### 真ん中のtrueで確定している
# if true && true  && false;    p "ok14"; end #=>        ### 最後のfalseで確定している
#
# p nil   && false     #=> nil
# p false && nil       #=> false
# p nil   || false     #=> false
# p false || nil       #=> nil

### 論理演算子を利用した式の評価
# p a = 1     && 2     #=> 2     ### trueが確定する右辺でその値の2が返る
# p a                  #=> 2
# p b = nil   && 3     #=> nil   ### 左辺でnilが確定するので右辺の3は評価されない
# p c = 4     && nil   #=> nil
# p d = 5     && false #=> false
# p e = false && 6     #=> false
#
# p f = 7     || 8     #=> 7     ### 左辺でtrueが確定するのでその値の7が返る
# p f                  #=> 7
# p g = nil   || 9     #=> 9     ### trueが確定する右辺でその値の9が返る
# p g                  #=> 9

### 論理演算子の自己代入
### 最後に評価したオペランドの値を返すことを利用した変数のデフォルト値の設定
# p a b           #=> NameError
# p a = a || 1    #=> 1   ### aが初期化されていないときに1を代入
# p b ||= 2       #=> 2   ### bが初期化されていないときに2を代入
#
# c = 3
# p c &&= 4         #=> 4   ### cが初期化(値は3)されているので4を代入
# p d &&= 5         #=> nil ### dが初期化されていないのでnilが入る

### 特徴的な論理演算子
### and, or, not
### &&や||や!との違い
### 自己代入できない
# p a or= 1        #=> SyntaxEror

### 代入演算子よりも演算子の優先度が低い
# p a = 1 &&  2      #=> 2   ### p (1 and 2)   と同じ。論理積の結果がpに渡される
# p b = (1 and 2)    #=> 2
# p c = 1 and 2      #=> 1   ### p (1) and 2   と同じ。
# p d = 3 and nil    #=> 3   ### p (3) and nil と同じ。

# 条件分岐
### if <条件式> then
### end
### <条件式>が真のとき処理される
###
### 条件が成立したときに値を代入するという書き方ができる
# a = if true
#       1
#     end
# b = 2 if true
# c = 3 if false  ### 3は代入されない (代入文はあるが実行されないが、判定の結果にかかわらず変数自体は確保されている)
# p a
# p b
# p c ### Errorにはならずnilが出力される
#
### elsifとelse
# a = if false then
#       1
#     elsif false
#       2
#     else
#       3
#     end
# p a   # 3
#
### unlessもある

# 三項演算子 (条件演算子)
### 条件式 ? 式1 : 式2
### 条件式を評価し、成立するときは式1、しない場合は式2を評価して返す
# a = true ? 1 : 2
# b = false ? 1 : 2
# p a
# p b

# 擬似変数
### 記述しても新たに値は生成されず、唯一のインスタンスが参照される
### true         : TrueClassのインスタンス
### false        : FalseClassのインスタンス
### nil          : NilClassのインスタンス。何もない事を表現する。他のプログラミング言語ではnullに相当。インスタンス変数の初期値に利用
### self         : 現在のオブジェクト
### __FILE__     : 現在実行しているプログラムのファイル名
### __LINE__     : 現在実行しているプログラムの行番号
### __ENCODING__ : 現在のソースファイルのスクリプトエンコーディング

# ================================================ #
# 文字列
### リテラル書式のバリエーションが豊富 (基本的な書式、ヒアドキュメント、パーセント記法)

## 基本的な書式
### ダブルクオート「"」
### 式展開できる
# a = "xx"
# p a.class     #=> String
# b = "xx" "yy"
# p b           #=> "xxyy"
# p "#{b}zz"    #=> "xxyyzz"   ### b.to_s のようにto_sメソッドが呼び出されている
#
### シングルクオート「'」
### 式展開できない
# e = 'xx' 'yy'
# p e           #=> "xxyy"
# p '#{e}zz'    #=> "\#{e}zz"
#
### 文字列から数値に変換
# p "123".to_i
# p "456hoge789".to_i  #=> 456   ### hogeの前までが変換対象
# p "hoge".to_i        #=> 0     ### 無効の場合は0が返る
# p "1.23".to_i        #=> 1     ### ピリオドの前までが変換対象
# p "1.23".to_f        #=> 1.23
# p "4.56.789".to_f    #=> 4.56  ### 2番目のピリオドの前までが返還対象
# p "4.5hoge6".to_f    #=> 4.5

## バックスラッシュ記法
### \x : xそのもの, \n : 改行, \s : 空白, \b : バックスペース, \t : タブ, \v : 垂直タブ
### \r : キャリッジリターン, \a : ベル, \e : エスケープ,
### \nnn : 8進数表記(nは0-7), \xnn : 16進数表記 (nは0-9,a-f)
### \cx または \C-x : コントロール文字 (xはASCII文字), \M-x : メタx, \M-\C-x メタコントロールx
### \unnnn : ユニコード文字(nは0-9,a-f,A-F), \u{nnnn} : ユニコード文字列 スペースかタブ区切りで複数指定可能
#
### "A"の8進数表記と16進数表記。表示したい文字コードの数値を指定する
# p "\101"
# p "\x41"
#
### p,puts,printの違い
# p "\101"          #=> "A" 引数ごとに改行、inspectメソッド、そのまま出力
# puts "\101"       #=> A　改行しない、to_sメソッド、適用した結果を出力
# print "\101"      #=> A　引数ごとに改行、to_sメソッド、適用した結果を出力

## ヒアドキュメント
### 基本
### 「<<」に続けて文字列の終端を表す任意の識別子を指定
# p <<EOS   #=> "hoge\n"
# hoge
# EOS
#
### 変数に代入
# foo = <<EOS
# var
# EOS
# p foo    #=> "var\n"
#
### 階層が深い場合
### 終端を表す識別子の前にスペースなどの文字を記述してはいけない
### -> これを回避するには識別子の頭に「-」をつける
# p <<EOS
# hoge
#     EOS   #=> SyntaxError
#
# p <<-EOS
# hoge
#      EOS  #=> "hoge\n"
### 式展開
### デフォルト、または「"」で囲むと式展開できる
### 「'」で囲むとそのまま出力される
# a = "var"
# p <<EOS    #=> "var\n"
# #{a}
# EOS
# p <<"EOS"  #=> "var\n"
# #{a}
# EOS
# p <<'EOS'  #=> "#{a}\n"
# #{a}
# EOS

## パーセント記法
### 文字列を囲む記号をプログラマが指定できる
### -> 例えば、文字列の中でダブルクオートを使うときにエスケープしなくてよくなる
# p %&He said "Hello"&   #=> "He said \"Hello\""
# p %@He said "Hello"@   #=> "He said \"Hello\""
# p %+He said "Hello"+   #=> "He said \"Hello\""
#
### カッコを使う場合は終端は対応する閉じカッコを使う
# p %{He said "Hello"{   #=> SyntacError
# p %{He said "Hello"}   #=> "He said \"Hello\""
# p %(He said "Hello")   #=> "He said \"Hello\""
# p %[He said "Hello"]   #=> "He said \"Hello\""
# p %<He said "Hello">   #=> "He said \"Hello\""
#
### パーセント記法と生成される文字列
### %  : ダブルクオート文字列
### %Q : ダブルクオート文字列 (%だけと同じ)
### %q : シングルクオート文字列
### %s : シンボル。式展開無し
### %W : 要素がダブルクオート文字列となる配列。要素の区切りは空白文字列
### %w : 要素がシングルクオート文字列となる配列。要素の区切りは空白文字列
### %I : 要素がシンボルの配列。式展開する
### %i : 要素がシンボルの配列。式展開しない
### %x : コマンド出力。バッククオートと同じ
### %r : 正規表現
# a = "Hello"
# p  %{He said "#{a}"}   #=> "He said \"Hello\""
# p %Q{He said "#{a}"}   #=> "He said \"Hello\""
# p %q{He said "#{a}"}   #=> "He said \"\#{a}\""
# p %s{foo}              #=> :foo
#
# b = "pen"
# p %W{I have a #{b} .}   #=> ["I", "have", "a", "pen", "."]
# p %w{I have a #{b} .}   #=> ["I", "have", "a", "\#{b}", "."]
# p %I{I have a #{b} .}   #=> [:I, :have, :a, :pen, :"."]
# p %i{I have a #{b} .}   #=> [:I, :have, :a, :"\#{b}", :"."]
#
# p %x{date}              #=> "2017年  1月 13日 金曜日 09:33:09 JST\n"
# p %r(^http://)          #=> /^http:\/\//
# p %q(^http://)          #=> "^http://"

## 文字列演算
### +メソッドで文字連結
# p "a" + "b"       #=> "ab"
### *メソッドで繰り返し出力
# p "hoge" * 3      #=> "hogehogehoge"
### 左辺に数値を指定するとエラーになる
# p 3 * "hoge"      #=> TypeError
### << メソッドにより末尾に連結
# p "hoge" << "fuga"  #=> "hogefuga"
### 異なるエンコード間で文字列操作を行うと例外が発生する (Ruby2.1まで？Ruby2.3.1はエラーにならない)
# p "hoge".encoding                 #=> #<Encoding:UTF-8>
# p "fuga".encode("SJIS").encoding  #=> #<Encoding:Windows-31J>
# p "hoge" + "fuga".encode("SJIS")  #=> "hogefuga"  参考書的にはエラーになる
### 文字列は文字コードで大小を比較する
# p "a" < "b"       #=> true
# p "ab" < "ac"     #=> true
# p "Ab" < "Ab"     #=> false
# p "Ab" == "Ab"    #=> true
# p "Aa" <=> "Ab"   #=> -1
# p "Ab" <=> "Ab"   #=> 0
# p "Ac" <=> "Ab"   #=> 1
### 文字数の確認
# p "abcde".length      #=> 5
# p "abcde".size        #=> 5
# p "あいうえお".length  #=> 5
# p "あいうえお".size    #=> 5

## sprintfによる整形
### 帳票などで行数をそろえるときなどに利用
### 第一引数 : フォーマット, 第二引数以降 : フォーマットしたい値
### 進数の指定
# p sprintf("\%#b", 3)    #=> "0b11"  2進数
# p sprintf("\%#o", 8)    #=> "010"   8進数
# p sprintf("\%#x", 10)   #=> "0xa"  16進数
# p sprintf("\%#X", 10)   #=> "0XA"  16進数 (大文字)
### 桁数の指定
# p sprintf("%2d", 1)          #=> " 1"
# p sprintf("%02d",1)          #=> "01"
# p sprintf("%3d", 1)          #=> "  1"
# p sprintf("%03d",1)          #=> "001"
# p sprintf("%05.2f",123.4567) #=> "123.46"
# p sprintf("%05.3f",123.4567) #=> "123.457"
# p sprintf("%05.4f",123.4567) #=> "123.4567"
### sprintf関数はStringクラスの%演算と同じ結果を得られる
# p "%02d" % 1  #=> "01"
# p "%03d" % 1  #=> "001"

# ================================================ #
# シンボル
### 多くのRuby処理系ではシンボルは内部では整数として扱われる
### -> 文字列と比較して処理が速くなる
###    -> 単にラベルとして文字列を使う場合はシンボルの方が効率が良い
###       -> ハッシュのキーなどによく利用される
### (Ruby2.1以前)ガベージコレクションの対象外
### -> キーの数が限られたケース以外では文字列を使う方が適切(Ruby2.1以前)

### シンボルは文字列の先頭にコロンをつける
# p :"foo"       #=> :foo
### 文字列の囲み(ダブルクオート)は省略できる。省略するのが一般的
# p :foo         #=> :foo
### パーセント記法でシンボルを生成
# p %s(foo)      #=> :foo
### 生成された値はSymbolクラスのインスタンスとなる
### -> 「+」といった文字の並びを操作するメソッドが定義されていない
###     -> 動的にシンボルを生成する場合は文字列に変換してからシンボルに変換するという事が良く行われる
# a = "foo"
# p :"#{a*2}bar"             #=> :foofoobar
# p "#{a*2}bar".to_sym       #=> :foofoobar
# p "#{a*2}bar".to_sym.to_s  #=> "foofoobar"

### オブジェクトの同値性と同一性
### 同値性 : 同じ値である。オブジェクトは異なる可能性がある
### 同一性 : 同じオブジェクトである。(値が同じである必要は無いが、必然的に値は同じになるはず。。)
### シンボルについて : 文字の並びが同じであれば同一のオブジェクトを参照する
### 文字列について : 文字の並びが同じでも、指定するごとにあらたなStringオブジェクトが生成される
### オブジェクトID : リテラル(数値や文字列など)を指定
###                -> Rubyインタプリタがそのリテラル型に対応するクラスのインスタンスを生成
###                -> 生成されたインスタンスはすべてオブジェクトであり、一意のオブジェクトIDを持つ
# p "foo".object_id     #=> (70353350030900などオブジェクトIDが表示される)
# p "foo".object_id     #=> (70353350030760など上と違う値)
# p :foo.object_id    #=> (2465848などオブジェクトIDが表示される)
# p :foo.object_id    #=> (2465848など上と同じ値)
#
### nilやtrue、falseなども一つのオブジェクトを参照するためobject_idは変わらない
# p nil.object_id       #=> 8
# p nil.object_id       #=> 8
# p true.object_id      #=> 20
# p true.object_id      #=> 20
# p false.object_id     #=> 0
# p false.object_id     #=> 0

### オブジェクトの比較
# p "foo".equal? "foo"  #=> false ### オブジェクトが同一かどうかを判定。同一でないのでfalse
# p "foo" === "foo"     #=> false ### equal?と同じ。case式でよく使われる
# p "foo".eql? "foo"    #=> true  ### 等価演算子で二つのオブジェクトが等しいかどうかを判定。等しいのでtrue
# p "foo" == "foo"      #=> true  ### 基本的にeql?と同様だが、型の比較は行わない
# p 1.to_f.eql? 1       #=> false ### 値は同じでも型が違うのでfalse
# p 1.to_f == 1         #=> true  ### 型は違うが値が同じなのでtrue

# ================================================ #
### 変数代入の挙動の詳細
### 1. リテラルを指定すると対応するオブジェクトがメモリ上に生成される
### 2. 変数を宣言すると変数にオブジェクトへの参照が与えられる
###    -> 変数を他の変数に代入すると両者は同じオブジェクトを指す
### 3. 変数を参照すると参照先のオブジェクトが返される
### 4. 変数に代入すると大部分は再代入になる
###    -> 片方の変数に代入しても、もう片方の変数に影響しない
###       -> 代入した方の変数には新たなオブジェクトへの参照が与えられる
###       -> 代入してない方の変数のオブジェクトへの参照はそのまま
# a = "hoge"
# b = a
# p a.object_id  #=> (70169318563740など)
# p b.object_id  #-> (70169318563740などaと同じ)
# a = "fuga"     ### (aに別の値を代入)
# p a            #=> "fuga"
# p b            #=> "hoge"
# p a.object_id  #=> (70353658141280など先ほどと違う)
# p b.object_id  #=> (70169318563740など先ほどと同じまま)
#
### メソッドの引数も同様
### -> 実引数に指定された変数の参照が仮引数にコピーされる
# def func(y)       ### メソッドfuncを定義。yを仮引数と呼ぶ。
#   p y.object_id   ### 1.仮引数yのオブジェクトIDを表示する
#   y = "var"
#   p y.object_id   ### 2.代入後のオブジェクトIDを表示
# end
#
# x = "foo"       ### 変数を宣言
# p x.object_id   ### 変数xのオブジェクトIDを表示                            (70151085970820など)
# func(x)         ### 1.仮引数yのオブジェクトIDを表示                        (70151085970820など上と同じ)
#                 ### -> 変数xのオブジェクトの参照が、仮引数yにコピーされている
#                 ### -> funcのスコープ内からスコープ外のメモリ領域を参照できている
#                 ### 2.続けてy = "var"が代入された後のyのオブジェクトIDを表示 (70181934504580など上と異なる)
#                 ### func(x)としたとき、変数xをメソッドfuncの「実引数」と呼ぶ。
#                 ### -> 二つ目のyのオブジェクトIDは再代入が行われているので値が異なる
#                 ### -> funcのスコープ内のメモリ領域に別のオブジェクトが生成され、そのオブジェクトへの参照が与えられる

### 破壊的メソッド
### 自分自身の内容を変更するメソッド
### -> 他の変数の参照先にも影響する
### メソッド名に「!」をつけるのが慣習(例外もある)
# v1 = "foo1"
# v2 = v1     ### v2はv1と同じ文字列を参照する
# p v1        #=> "foo1"
# p v2        #=> "foo1" v2はv1と同じ文字列を参照
# p v1.chop   #=> "foo"
# p v1        #=> "foo1" chopの後でも参照先は変更されない
# p v2        #=> "foo1"
# p v1.chop!  #=> "foo"
# p v1        #=> "foo"  chop!の後はv1の参照先が変更されている
# p v2        #=> "foo"  chop!の後はv2の参照先まで変更されている！！

### 文字列とシンボルの違い
### 文字列   : 変数に代入すると、たとえ同じ値であってもそれぞれ異なるオブジェクトを指す
### シンボル : 変数が同じオブジェクトを指す
# v1="foo"
# v2="foo"
# v3="foo"
# p v1.object_id   #=> (69836757139180など)  ※ すべて異なるオブジェクトID
# p v2.object_id   #=> (69836757139160など)
# p v3.object_id   #=> (69836757139140など)
# v1=:foo
# v2=:foo
# v3=:foo
# p v1.object_id   #=> (2466908など)  ※ すべて同じオブジェクトID
# p v2.object_id   #=> (2466908など)
# p v3.object_id   #=> (2466908など)

# ================================================ #
# 配列
### Arrayクラスのインスタンス
### 配列リテラル : 要素を角カッコで囲み、要素の間をカンマで区切ることで生成する
# p a = [10, true, "foo", :bar]   #=> [10, true, "foo", :bar]
# p a[0]                          #=> 10
### Arrayクラスのインスタンスを生成することで配列を作成可能
### 初期値は第二引数やブロックで指定
# p v1 = Array.new(3)               #=> [nil, nil, nil]
# p v1.length                       #=> 3
# p v2 = Array.new(3,"foo")         #=> ["foo", "foo", "foo"]
# p v3 = Array.new(3){"bar"}        #=> ["bar", "bar", "bar"]
# p Array.new(3){|v| v = "hoge"}    #=> ["hoge", "hoge", "hoge"]
# p Array.new(3){|v| v}             #=> [0, 1, 2]
# p Array.new(3){|v| v + 1}         #=> [1, 2, 3]
# p Array.new(3){|v| v + 3}         #=> [3, 4, 5]
### 第二引数で指定したオブジェクトは同一オブジェクト
# p v4 = Array.new(3,"fuga")        #=> ["fuga", "fuga", "fuga"]
# p v4[0].object_id                 #=> (69924207752260など)
# p v4[1].object_id                 #=> (69924207752260など上と同じ)
# p v4[2].object_id                 #=> (69924207752260など上と同じ)
### 破壊的メソッドで変更するとすべての配列の値が変更されることになる
# p v5 = Array.new(3,"haga")        #=> ["haga", "haga", "haga"]
# v5[0].replace("zzz")
# p v5                              #=> ["zzz", "zzz", "zzz"]
### ブロックで初期化することですべての配列の値が変更されることを防ぐことができる
# p v6 = Array.new(3){"xxx"}          #=> ["xxx", "xxx", "xxx"]
# v6[0].replace("yyy")
# p v6                                #=> ["yyy", "xxx", "xxx"]

### 二次元配列
# p b = [[1,2],["a","b"]]         #=> [[1, 2], ["a", "b"]]
# p b[0]                          #=> [1,2]
# p b[0][1]                       #=> 2

### パーセント記法による配列の生成
### %Wでダブルクオート、%wでシングルクオート区切りの配列
### 要素間は空白区切り
# foo="foo"
# bar="bar"
# p %W(abc def #{foo})              #=> ["abc", "def", "foo"]
# p %w(ghi jkl #{bar})              #=> ["ghi", "jkl", "\#{bar}"]
# p %W(abc def #{foo}).join("&")    #=> "abc&def&foo"

### サイズを超えた要素への代入
### 配列のサイズは要素への代入によって動的に変わる
### 上限を超えた場合はnilを返す
# p v1 = ["hoge"]                  #=> ["hoge"]
# v1[3] = "fuga"
# p v1                             #=> ["hoge", nil, nil, "fuga"]
# p v1[9]                          #=> nil

### 添え字演算子
### 配列の要素への参照や代入 : 構文ではなくArrayクラスのメソッドとして実装されている
### 参照 : []メソッド
### 代入 : []=メソッド
### 添え字として負の整数や複数の整数を指定できる
p v1 = ["a","b","c","d","e"]      #=> ["a", "b", "c", "d", "e"]
p v1[0]                           #=> "a"   ### 先頭の要素
p v1[-1]                          #=> "e"   ### 末尾の要素
p v1[4-1]                         #=> "d"   ### 4-1 = 3  先頭を0番目として3の要素
p v1[-4]                          #=> "b"   ### 末尾を1番目として4番目の要素
p v1[-9]                          #=> nil   ### 上限を超えたらnil
p v1[2,3]                         #=> ["c", "d", "e"]  ### 先頭を0番目としてインデックス2(2番目の要素)からそれ自身を含めて後ろ3つの要素を表示
### 要素を指定して代入
p v2 = ["a","b","c","d","e"]      #=> ["a", "b", "c", "d", "e"] ### 先頭を0番目の要素として1,2番目の要素b,cが操作対象
v2[1,2] = "f"                     ### インデックス1を含めて2要素分を1要素として"f"を代入。
p v2                              #=> ["a", "f", "d", "e"]  ### 1,2番目の要素だったb,cが1つの要素fになった
v2[1,2] = ["g","h"]               ### インデックス1を含めて1要素目にg,2要素目にhを代入。
p v2                              #=> ["a", "g", "h", "e"]  ### 1,2番目の要素f,dにg,hが代入されて置き換わった

# ================================================ #
# メソッド(関数)
### メソッドaddの定義
# def add(a,b)  # def式で指定する引数(ここでは a, b) は仮引数と呼ぶ
#   a + b
# end
#
# ### セミコロンを使うと1行で書ける
# def add2(a,b); a + b; end
#
# ### メソッドの実行
# p add(1,2)   # メソッドを実行する際に記述する引数(ここでは1, 2)を実引数と呼ぶ
# p add2(3,4)

### 仮引数はデフォルト値を設定できる
# def add3(a, b=100)
#   a + b
# end
#
# p add3(1,2)   # 3
# p add3(1)     # 101

### キーワード引数 (Ruby2.0以降)
### 仮引数名とデフォルト値をコロンで結びつけて定義できる
### -> 呼び出しにハッシュオブジェクトを渡すことで呼び出し側でどの引数にどのような値を渡したかを明示できる
# def add4(a:, b: 100)
#   a + b
# end
#
# p add4(a: 1, b: 2)  # 3
# p add4(a: 1)        # 101
# p add4(b: 1)        # ArgumentError

### キーワード引数に任意の引数を使う
# def add5(a:, b: 100, **z)
#   p z
#   a + b
# end
#
# p add5(a: 1, b: 2, c: 3, d: 4)   # 3, コンソール上には {:c=>3, :d=>4} が表示される

### 一番最後に評価した値が返る
# def add6(a, b)
#   a + b
#   a + b + b
# end
#
# p add6(3,4)   # 11

### returnで明示的に返り値を指定できる
# def add7(a, b)
#   return a + b
#   a + b + b
# end
#
# p add7(3,4)   # 7





# ================================================ #
# クラス
### BasicFooクラスの定義
# class BasicFoo
#   ### testメソッドの定義
#   def test
#     1
#   end
# end
#
# ### BasicFooクラスのインスタンスの生成
# foo = BasicFoo.new
#
# ### BasicFooクラスのtestメソッドを実行
# p foo.test

