require 'socket'

host, port = ARGV

ds = UDPSocket.new
ds.connect(host,port)

request_message = ''
$a = IO.new(2,"w+")

while request_message.chop != "quit"
  puts "Enter Message: "
  request_message = $a.readline
  ds.send(request_message,0)
end
