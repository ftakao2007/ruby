#!/usr/bin/env ruby

require "tk"

size = 5

c1 = TkCanvas.new {|c|
  width 200
  height 200
  bind 'B1-Motion', proc { |x,y|
    #TkcRectangle.new(c, x, y, x+size, y+size) {
    TkcOval.new(c, x, y, x+size, y+size) {
      outline 'blue'
      fill 'blue'
      tag 'p'
    }}, "%x %y"
  pack
}

TkButton.new {
  text "Clear"
  command { c1.delete('p') }
  pack
}

Tk.mainloop
