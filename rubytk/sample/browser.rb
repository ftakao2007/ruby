# http://ameblo.jp/ymty/entry-10002866631.html

require 'tk'
require 'socket'

class HttpConnect
def initialize(host,port)
@host = host
@port = port
@sock = TCPSocket.open(@host,@port)
@buffer = ""
end
def sndmsg(msg)
print @sock.write(msg)
end
def rcvmsg
while @sock.gets;
@buffer = @buffer + $_
end
return @buffer
end
def close
@sock.close
end
end

url = TkVariable.new("http://")
TkEntry.new(nil,'width'=>50,'textvariable'=>url).pack
t = TkText.new.pack
TkButton.new(nil,'text'=>'GET','command'=>proc{
/^http:\/\/([^\/]+)\/(.*)/ =~ url.value;
myconnect = HttpConnect.new($1,"http");
myconnect.sndmsg "GET /#{$2} HTTP/1.0\r\n\r\n";
myval = myconnect.rcvmsg;
t.insert('end', myval);
myconnect.close}).pack
Tk.mainloop
