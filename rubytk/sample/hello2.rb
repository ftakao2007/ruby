require 'tk'

TkLabel.new(nil,
            :text => 'Hello, World!',
            :fg   => 'green',  ### 文字の色
            :bg   => 'black').pack   ### 背景色

Tk.mainloop
