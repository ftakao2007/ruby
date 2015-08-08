#!/home/vagrant/.rvm/rubies/ruby-1.9.3-p448/bin/ruby
# -*- encoding: utf-8 -*-

tmp = "hoge"
pattern = Regexp.new(tmp)

if pattern =~ "text"
	puts "text"
else
	puts "no"
end
