# ================================================ #
# 変数
### rubyは変数の初期化時に変数の方を指定しない「動的型言語」
# a = 1
# p a
# p a.class
# a = "foo"
# p a.class

# ================================================ #
# 定数
### 変数名の先頭を大文字にすると定数になる
# AAA = 1
# p AAA
#
# ### 警告は出るが再代入はできる
# AAA = 2
# p AAA

# ================================================ #
# 関数
### 関数addの定義
# def add(a,b)
#   a + b
# end
#
# ### セミコロンを使うと1行で書ける
# def add2(a,b); a + b; end
#
# ### 関数の実行
# p add(1,2)
# p add2(3,4)

# ================================================ #
# クラス
### BasicFooクラスの定義
class BasicFoo
  ### testメソッドの定義
  def test
    1
  end
end

### BasicFooクラスのインスタンスの生成
foo = BasicFoo.new

### BasicFooクラスのtestメソッドを実行
p foo.test

