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
### 2.代入分が実行されなかったときはnil
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

