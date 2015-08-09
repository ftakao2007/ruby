require 'tk'

button = TkButton.new
button.text = 'exit'
button.command = proc { exit }
button.pack

Tk.mainloop
