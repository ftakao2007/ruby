# リフレクションプログラミング
# -> プログラミング実行中に、そのプログラムの情報を取得したり操作したりすること

## オブジェクトのインスタンス変数調査
class Foo
  def initialize
    @foo = 1
    @bar = 2
    @baz = 3
  end
end

object1 = Foo.new

### オブジェクトを出力
### 出力例) #<Foo:0x007fa324c3af40 @foo=1, @bar=2>
# p object1

### 配列の要素としてインスタンス変数名をシンボルで返す
### 出力例) [:@foo, :@bar, :@baz]
# p object1.instance_variables

### オブジェクトに対してインスタンス変数名が定義されているか直接問い合わせる
### 出力例) true or false
# p object1.instance_variable_defined?(:@bar)

### インスタンス変数を参照
### (インスタンス変数の値が出力される)
#p object1.instance_variable_get(:@bar)

### 要素を取り出す
### 出力例) :@foo
###        :@bar
###        :@baz
# object1.instance_variables.select do |v|
#   p v
# end

### 各要素にあるインスタンス変数の値を取り出す
### 出力例) 1
###        2
###        3
# object1.instance_variables.select do |v|
#   p object1.instance_variable_get(v)
# end

### インスタンス変数の値を更新する
### 出力例) 4
# object1.instance_variable_set(:@bar, 4)
# p object1.instance_variable_get(:@bar)

### インスタンス変数の値を更新する
### 出力例) #<Foo:0x007f970996f008 @foo=1, @bar=2, @baz=3, @qux=5>
###        5
# object1.instance_variable_set(:@qux, 5)
# p object1
# p object1.instance_variable_get(:@qux)

