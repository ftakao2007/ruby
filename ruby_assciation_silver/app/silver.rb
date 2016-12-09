# http://www.ruby.or.jp/ja/certification/examination/index.data/exam_prep_jp.pdf
# やること
# 予約語を覚える
# ヒアドキュメント覚える
# 正規表現のマッチ
# sliceとslice!の挙動
# 例外処理
# 論理演算子の評価方法 29
# 配列の中身の指定の仕方 12

#1. X X (2つ選ぶ)
# goto

#2. OK OK
# def foo(a, *b)
#   p a
# end
# foo(1,2,3,4)

#3. OK X
#puts({"members" => 193, "year" => 2014}.size)

#4. OK OK
#t = Time.now + (60*60*24)
#p t

#5. OK X


#6. X OK
# (5..8).each_with_index do |val,i|
#   puts "#{i} #{val}"
# end

#7. OK OK
#p 100.downto(90).select{|x| x%2==0}

#8. OK OK
#p [1,1,2,3,5,8].map{|x| x*2}

#9. X OK
#puts "Ruby on Rails".delete("Rails")

#10. x OK
# doc = <<EOF
#   The quick brown fox
#   jump over the lazy dog
#   EOF
# print doc

#11. x OK
# h = {1=>2, 3=>4}
# ary = [1,2]
# p h
# p ary

#12. OK OK
# a = [1,2,3,4,5]
# p a[2...4]
# p a.slice(0,3)

#13. OK OK
#str = "RubyAssociation\n".chomp
#print str

#14. x OK
#str = "RubyAssociation\r\n".chop
#print str

#15. OK OK
# File.open("foo.txt","r") do |io|
#   puts io.gets
#   puts io.read
#   io.rewind
#   p lines = io.readlines
# end

# 16. OK OK
# mozart = ["Symphony", "Piano Concerto", "Violin Concerto", "Horn Concerto", "Violin Sonata"]
# listend = ["Symphony", "Violin Concerto", "Horn Concerto"]
# p mozart - listend

#17. OK OK
#odd = [1,3,5]
#even = [2,4,6]
#num = odd + even
#p num.sort

#18. X OK

#19. OK OK
#Greeting = "Hello Ruby"
#Greeting = "Hi Ruby"
#p Greeting

#20. OK OK
#p File.join("ruby","exam","silver")

#21. OK OK
# class Surface
#   attr_reader :s
#   def initialize(x, y)
#     @s = x * y
#   end
# end
#
# class Volume < Surface
#   attr_reader :v
#   def initialize(x, y, z)
#     super(x,y)
#     @v = x * y * z
#   end
# end
#
# a = Volume.new(2,5,5)
# puts "#{a.v}, #{a.s}"

#22. X X
# string = "test code"
# string.slice(0,4)
# p string

#23. X OK
#puts "ruby".encoding
#puts "ruby".encoding.name

#24. X OK
# cc = {"nz" =>"New Zealand", "ru"=>"Russia", "ar"=>"Argentina"}
# p cc.has_key?('nz')
# p cc.contain?('nz')
# p cc.key?('nz')
# p cc.include?('nz')
# p cc.member?('nz')

#25. X OK
# p "Hello there".class
# p String.superclass
#
# class Foo; end
# class Bar < Foo; end
# p Foo.superclass
# p Bar.superclass

#26. X
# s = "to be or not to be, that is the question."
# hash = Hash.new(0)
# s.hoge(/\w+/){|i| hash[i] += 1}
# p hash["be"]

#27. X
#p 12354.chr(Encoding::UTF_8)

#28. OK
# s = "foo"
# begin
#   s[4] = ?b
# rescue IndexError
#   puts "error"
# end

#29. X
# ary = []
# ary << 1 && false
# true || ary << 2
# false && ary << 3
# false || ary << 4
# p ary

#30. X
#p "foo" * 2 ** 2

#31. X
# foo = [1,2,3]
# bar = foo
# baz = foo.dup
#
# p foo.object_id
# p bar.object_id
# p baz.object_id
#
# bar[3] = 4
# p foo
# p bar
# p baz

#32. X

#33. X
# str = "a,b,c,d"
# p str.split(/,/, 2)

#34. X
# class Object
#   def greeting
#     print "How are you?\n"
#   end
# end
#
# [1,2].greeting
# 100.greeting
# #p 100.class
# #p [1,2].class
# #p greeting.class

#35. OK
# p "323-5647".match(/[0-9]{3}-[0-9]{4}/)
# p "b55323-5647".match(/[0-9]{3}-[0-9]{4}/)
# p "5532a3-5647".match(/[0-9]{3}-[0-9]{4}/)
# p "23-5647".match(/[0-9]{3}-[0-9]{4}/)

#36. OK
# p "a".upto("f").map{|s| s}
# p "a".upto("f").to_a

#37. X
# File.open("foo.txt", mode = "w") do |io|
#   io.write(Time.now.strftime("%Y/%m/%d")+"\n")
# end

#38. X
#Dir.rmdir("hoge")
#p Dir.pwd
#p Dir.getwd

#39. OK
# puts "0123456789".delete("0-5")
# puts "0123456789".delete("8-")
# puts "0123456789".delete("8-9")
# puts "0123456789".delete("0-58-")

#40. OK
#p "100,200,300,400,500".split(",").join("\n")

#41. OK
# a = "foo"
# b = "foo"
# puts a.eql?(b)
# puts a.equal?(b)
# p a.object_id
# p b.object_id

#42. X
# numbers = [3,89,40,39,29,10,50,59,69]
# num = numbers.inject do |i,j|
#   p i
#   p j
#   p "---"
#   i > j ? i : j
# end
# p num

#43. OK
#p String.instance_methods.grep(/strip/)

#44. X
# capital1 ={:Sweden =>"Stockholm", :Norway=>"Oslo", :Finland=>"Helsinki"}
# capital2 = {Sweden: "Stockholm", Norway: "Oslo", Finland: "Helsinki"}
# capital3 = {"Sweden" = "Stockholm", "Norway" = "Oslo", "Finland" = "Helsinki"}
# capital4 = Hash[:Sweden, "Stockholm", :Norway ,"Oslo", :Finland, "Helsinki"]
# p capital1
# p capital2
# p capital3
# p capital4

#45. OK
# require 'uri'
# uri = URI::HTTP.build({host:'www.ruby.or.jp', path:'/ja/certification/examination/'})
# puts uri

#46. OK
# class Foo
#   @@num = 0
#   def self.count
#     @@num += 1
#   end
# end
#
# class Bar < Foo
# end
#
# puts Foo.count
# puts Bar.count

#47. X
# unless false || nil
#   print "u1 Hello\n"
# end
#
# unless false
#   print "u2 Hello\n"
# end
#
# unless nil
#   print "u3 Hello\n"
# end
#
# if false || nil
#   print "i1 Hello\n"
# end
#
# if false
#   print "i2 Hello\n"
# end
#
# if nil
#   print "i3 Hello\n"
# end

#48. X
# numbers = (1..20).to_a
# p numbers.detect{|x| x % 5 == 0}

# 49. X
# class NonasciiError < StandardError
# end
# File.open("sample.txt") do |io|
#   io.each_line do |str|
#     begin
#       raise(NonasciiError, "non ascii character detected") unless
#           str.ascii_only?
#     rescue => ex
#       puts "#{ex.message} : #{str}"
#     end
#   end
# end

# 50. X

### Kobo RUBY技術者認定合格教本 SILVER/GOLDA対応 RUBY公式資格教科書
### 第七章 RUBY技術者認定試験 Silver演習問題
### やること
### エラー処理覚える 3

# 1. OK

# 2. X
# x = 0
# def hoge
#   (1...5).each do |i|
#     x += 1
#   end
#   puts x
# end
# hoge

# 3. X
# begin
#   puts 1+"2"
# rescue
#   puts "Error"
# rescue TypeError
#   puts "TypeError"
# ensure
#   puts "Ensure"
# end

# 4. X
# puts 0x90
# puts 090

# 5. OK
# x = 10
# y = x < 10 ? "A" : "B"
# puts y

# 6. OK
# MAX = 10
# print MAX
# MAX = 100
# print MAX

# 7. OK
# def foo(*a)
#   p a
# end
# foo(1,2,3)

# 8. X

# 9.
# class Hoge
#   attr_reader :message
#   def initialize
#     @message = "Hello"
#   end
# end
#
# class Piyo < Hoge
#   def initialize
#     @message = "Hi"
#     super
#   end
# end
#
# puts Piyo.new.message

# 10. OK
# def area r
#   return r * r * PI
# end
# puts area(2)




### Kobo RUBY技術者認定合格教本 SILVER/GOLDA対応 RUBY公式資格教科書
### 第六章 添付ライブラリ
### http://qiita.com/ftakao2007/items/bed2102ab17ea59e0f46#%E6%B7%BB%E4%BB%98%E3%83%A9%E3%82%A4%E3%83%96%E3%83%A9%E3%83%AA
