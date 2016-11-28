# http://www.ruby.or.jp/ja/certification/examination/index.data/exam_prep_jp.pdf
# やること
# 予約語を覚える
# ヒアドキュメント覚える

#1. x  (2つ選ぶ)
# goto

#2. OK
# def foo(a, *b)
#   p a
# end
# foo(1,2,3,4)

#3. OK
#puts({"members" => 193, "year" => 2014}.size)
#puts({ members: 193, year: 2014}.size)

#4. OK B
#t = Time.now + (60*60*24)
#p t

#5. OK
#ABE

#6. x
# (5..8).each_with_index do |val,i|
#   puts "#{i} #{val}"
# end

#7. OK
#p 100.downto(90).select{|x| x%2==0}

#8. OK
#p [1,1,2,3,5,8].map{|x| x*2}

#9. x
#puts "Ruby on Rails".delete("Rails")

#10. x
# doc = <<EOF
#   The quick brown fox
#   jump over the lazy dog
#   EOF
# print doc

#11. x
# h = {1=>2, 3=>4}
# ary = [1,2]
#
# p h
# p ary

#12. OK
# a = [1,2,3,4,5]
# p a[]
# p a.slice()

#13. OK
#str = "RubyAssociation\n".chomp
#print str

#14. x
#str = "RubyAssociation\r\n".chop
#print str

#15. OK
# File.open("foo.txt","r") do |io|
#   puts io.gets
#   puts io.read
#   io.rewind
#   p lines = io.readlines
# end