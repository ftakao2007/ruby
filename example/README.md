ruby
====

rubyいろいろ

## 001_sample.rb
こんにちはと出力する
```
vagrant@rails-dev-box:~/ruby$ ./001_sample.rb 
こんにちは
```

## 002_print_argb.rb
引数を出力する(たのしいRuby P47)
```
ls-dev-box:~/ruby$ ./002_print_argb.rb 1 hello てすと
最初の引数: 1
2番目の引数: hello
3番目の引数: てすと
```

## 003_arg_arith.rb
文字列をintegerに変換して計算(たのしいruby P49)
```
vagrant@rails-dev-box:~/ruby$ ./003_arg_arith.rb 5 2
5 + 2 = 7
5 - 2 = 3
5 * 2 = 10
5 / 2 = 2
```

## 004_read_text.rb
ファイルを読み込んで出力する(たのしいruby P50)
```
vagrant@rails-dev-box:~/ruby$ ./004_read_text.rb read_text.txt 
hoge hoge
fuga
hoge fuga haga
```

## 005_gets_text.rb
ファイルを読み込んで出力する(たのしいruby P52)  
ただし、先ほどと違い一行ずつ読み込むのでメモリを節約できる
```
vagrant@rails-dev-box:~/ruby$ ./005_gets_text.rb read_text.txt 
hoge hoge
fuga
hoge fuga haga
```

## 006_simple_grep.rb
grepをパターンマッチでつくる(たのしいruby P52)  
```
vagrant@rails-dev-box:~/ruby$ ./006_simple_grep.rb haga read_text.txt 
hoge fuga haga
```
===

## tmp_regexp.rb
正規表現オブジェクトテスト
```
vagrant@rails-dev-box:~/ruby$ ./tmp_regexp.rb 
text
vagrant@rails-dev-box:~/ruby$ vi tmp_regexp.rb 
vagrant@rails-dev-box:~/ruby$ ./tmp_regexp.rb 
no
```
