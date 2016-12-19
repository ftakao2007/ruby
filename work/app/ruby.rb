# リフレクションプログラミング
# -> プログラミング実行中に、そのプログラムの情報を取得したり操作したりすること

## オブジェクトのインスタンス変数調査
class Foo
  def initialize
    @foo = 1
    @bar = 2
    @baz = 3
  end

  def sample_method
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

# オブジェクトが持つメソッドの確認
class ParentClass
  def super_public_method
    'super_public_method'
  end

  private

  def super_private_method
    'super_private_method'
  end

  protected

  def super_protected_method
    'super_protected_method'
  end
end

class ChildClass < ParentClass

  def public_method
  end

  private

  def private_method
  end

  protected

  def protected_method
  end
end

child = ChildClass.new

def child.singleton_method
end

### メソッドの一覧表示
# child.methods.each do |v|
#   p v
# end

### publicメソッドの表示
# child.public_methods.each do |v|
#   p v
# end

### privateメソッドの表示
# child.private_methods.each do |v|
#   p v
# end

### protectedメソッドの表示
# child.protected_methods.each do |v|
#   p v
# end

### singletonメソッドの表示
# child.singleton_methods.each do |v|
#   p v
# end

### 引数にfalseを渡すとsingletonメソッドのみ表示
# p child.methods(false)

# (以下今の段階では飛ばし)

# オブジェクトにメソッドが定義されているかを確認する

# has_method = ParentClass.new
# ### super_public_methodがあるのでtrue
# p has_method.respond_to?(:super_public_method)
#
# ### privateのメソッドはデフォルトではfalse
# p has_method.respond_to?(:super_private_method)
#
# ### 第二引数をtrueにするとprivate_methodも確認できるようになる
# p has_method.respond_to?(:super_private_method, true)

# (以下今の段階では飛ばし)

# Object#sendで任意のメソッドを呼び出す

### protectedやprivateメソッドも呼び出せる
# send_method = ParentClass.new
# p send_method.send(:super_public_method)
# p send_method.send(:super_protected_method)
# p send_method.send(:super_private_method)

### ライブラリを作るときはライブラリ使用者側でsendがオーバーライドされている可能性を考慮して__send__を使う
# p send_method.__send__(:super_public_method)

# ----------------------- #
# クラスについて調べる

module FooModule
  MODULE_CONST_VAR = 1
end

class FooClassValiables

  include FooModule
  CLASS_CONST_VAR = 2
  @@class_val = "fooclassval"

  class InnerFooClassValiables
    INNER_CLASS_CONST_VAR = 3
  end

  def def_lazy_class_val
    @@lazy_class_val = "foolazyclassval"
  end
end

### 呼び出し時点で定義されているクラス変数の一覧を表示
# p FooClassValiables.class_variables

### lazy_class_valを定義して呼び出し
# FooClassValiables.new.def_lazy_class_val
# p FooClassValiables.class_variables

### クラス変数が定義されているか直接問い合わせる
# p FooClassValiables.class_variable_defined?('@@class_val')

### クラス変数の値を取得
# p FooClassValiables.class_variable_get('@@class_val')

### クラス変数に値を設定
# FooClassValiables.class_variable_set('@@class_val', 'hoge')
# p FooClassValiables.class_variable_get('@@class_val')

### 定数の一覧取得
# p FooClassValiables.constants

# 第二引数をfalseにすると継承したクラスやincludeしたモジュールの定数は表示されない
# p FooClassValiables.constants(false)

# innerクラスの定数のみ表示
# p FooClassValiables::InnerFooClassValiables.constants

