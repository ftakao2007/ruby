#!/home/vagrant/.rvm/rubies/ruby-1.9.3-p448/bin/ruby
# -*- encoding: utf-8 -*-

filename = ARGV[0]
file = open(filename)
while text = file.gets do
  print text
end
file.close
