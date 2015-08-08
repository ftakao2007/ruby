
require 'tk'

TkButton.new(nil,
             text: 'push!', 
             command: proc{print "Hello World\n"}).pack

Tk.mainloop
