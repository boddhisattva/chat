require 'socket'

host, port = ARGV

ds = UDPSocket.new
ds.connect(host,port)

request_message = ''
$a = IO.new(2,"w+")

while request_message.chop != "quit"
  puts "Enter Message: "
  request_message = $a.readline
#puts '{$client_id1} says:' + a
  ds.send(request_message,0)
#response,address = ds.recvfrom(1024)
#puts response
end
