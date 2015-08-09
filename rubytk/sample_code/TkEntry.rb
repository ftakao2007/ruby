require 'tk'

var = TkVariable.new('')
TkEntry.new(nil,
            textvariable: var,
            show: '*').pack

TkButton.new(nil,
             text: 'print', 
             command: proc{print var.value, "\n"}).pack

TkButton.new(nil,
             text: 'quit',
             command: proc{exit}).pack

Tk.mainloop
