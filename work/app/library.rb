# ================================================ #
# ライブラリ
### 組み込みライブラリ : requireしなくても使える
### 標準添付ライブラリ : requireしないと使えない

# ================================================ #
# thread (マルチスレッドプログラミング)
### 組み込みライブラリ以外に標準添付ライブラリも有る
### -> Queue(キュー)や状態変数を使えるようになる

## Queue
### スレッドセーフ(複数のスレッドから同時にアクセスしても壊れない)なFIFOキュー
### pushやpop(もしくはenqやdeq)メソッドが有る
### -> Arrayを利用する感覚で使える
### キューにデータが無いときにpopを呼ぶと新しいキューにデータが入るまで呼び出し元はブロックされる
### -> かんたんにワーカースレッドを実装できる

# require 'thread'
#
# queue = Queue.new
#
# # ワーカースレッドを３つ用意
# workers = 3.times.map {|t|
#   Thread.fork {
#     while req = queue.deq
#       puts "Worker#{t} processing.."
#       req.call
#     end
#   }
# }
#
# # 10個のリクエストをenqueueする
# 10.times do |t|
#   queue.enq -> {
#     sleep 1 # 何らかの処理
#   }
# end
#
# # 全てのキューが処理されるまで待つ
# p "wait1"
# sleep 1 until queue.empty?
#
# # キューが空になったので全てのthreadがキューを待っている
# p "workers.map"
# p workers.map(&:status)
#
# # 再度キューに追加
# 3.times do |t|
#   queue.enq -> {
#     sleep 1 # 何らかの処理
#   }
# end
#
# # キューを処理している最中の状態を表示
# p workers.map(&:status)
#
# # 全てのキューが処理されるまで待つ
# p "wait2"
# sleep 1 until queue.empty?

### 他にSizedQueueという引数にサイズの上限を指定できるものもある

## ConditionVariable
### (以下今の段階では省略)

# ================================================ #
# yaml
### 構造化されたデータをプレーンな文字列で表現するためのデータ形式のひとつ
### XMLよりも読みやすく書きやすい
### インデントでハッシュの構造を表現する
### YAMLで表現できるデータ型 : 文字列、整数、浮動小数点、真偽値、nil、配列、ハッシュ

# require 'yaml'
#
# p YAML::ENGINE.yamler
#
# yaml_string = <<EOS
# ---
# remote:
#   host: localhost
#   port: 22
#   ssh: true
#   username: user
#   password: pass
# EOS
#
# setting = YAML.load(yaml_string)
#
# ### hostの値を取り出す
# p setting['remote']['host']
#
# ### hostの値を変更する
# setting['remote'].update('host' => 'example.com')
# p setting
#
# setting['remote']['host'] = 'example2.com'
# p setting
#
# ### オブジェクトをYAMLとしてdump
# p YAML.dump(setting)
# p setting.to_yaml

### YAMLはバックエンドにPsychと呼ばれるモジュールを利用している
### -> Ruby1.9まではSyckを利用していた
### SyckはYAMLバージョン1.0、Psychはバージョン1.1を扱うことができる
### -> 古いYAMLをどうしても読み込む必要がある場合はSyckを使う
### -> gem instllしてから requireする必要がある
### -> Ruby1.9からOBSOLETEになっている。普通は使わない。


# ================================================ #
# json
### jsonで表現できるデータ型 : 文字列、整数、浮動小数点、真偽値、nil、ハッシュ
### -> 配列は無し？ : 以下の例ではいけたように見える。

# require 'json'
# p data = [1, 2.0, "徳島", {"key" => "value"}, [1,2], nil, true, false]
#
# ### JSONとしてdump
# p JSON.dump(data)
# p data.to_json
#
# ### ロードする
# json = data.to_json
# p JSON.load(json)

### これ以外のオブジェクトをJSONにダンプした場合
### to_jsonメソッドが定義されていない場合、to_sメソッドの結果が返される
### -> Time, Regexp, Object, Range, Symbolなど
### -> 自分で定義したクラスがハッシュや配列、文字列を継承していない場合でto_sでの結果以外にしたい場合はto_jsonメソッドを上書きする

### YAMLはSymbolがそのまま使えるが、jsonはSymbolに相当する型が無いので文字列に変換される

# ================================================ #
# csv
### 2次元の情報をコンマと改行で区切る形式
### Array#to_csvで配列をCSV形式の文字列に変換できる
### String#parse_csvでレシーバの文字列をCSV形式の1行としてparseした結果を返す

require 'csv'
### 配列をcsvに変換
p csv = ["すだち", "うどん", "みかん", "かつお"].to_csv

### csvを配列に変換
p csv.parse_csv

### フィールドはダブルクオートで囲んでも囲まなくても処理できる
p %(foo,"bar",baz).parse_csv

### 明示的にダブルクオートを含めたい場合はダブルクオートでエスケープし、かつフィールド全体をダブルクオートで囲む
p %("徳島:""すだち""","香川:""うどん""").parse_csv

### (以下今の段階では省略)