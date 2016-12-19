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

require 'thread'

queue = Queue.new

# ワーカースレッドを３つ用意
workers = 3.times.map {|t|
  Thread.fork {
    while req = queue.deq
      puts "Worker#{t} processing.."
      req.call
    end
  }
}

# 10個のリクエストをenqueueする
10.times do |t|
  queue.enq -> {
    sleep 1 # 何らかの処理
  }
end

# 全てのキューが処理されるまで待つ
p "wait1"
sleep 1 until queue.empty?

# キューが空になったので全てのthreadがキューを待っている
p "workers.map"
p workers.map(&:status)

# 再度キューに追加
3.times do |t|
  queue.enq -> {
    sleep 1 # 何らかの処理
  }
end

# キューを処理している最中の状態を表示
p workers.map(&:status)

# 全てのキューが処理されるまで待つ
p "wait2"
sleep 1 until queue.empty?
