
require 'tk'

TkLabel.new(nil,
            text: '日本語テスト').pack

n = TkVariable.new('hoge')
TkLabel.new(nil,
            textvariable: n,
            cursor: 'watch',
            relief: 'raised',
            highlightthickness: 5,
            highlightbackground: 'blue',
            bg: 'black',
            fg: 'white').pack

Tk.mainloop
