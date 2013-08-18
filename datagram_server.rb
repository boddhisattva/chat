require 'socket'
#this is like the chat room..

port = ARGV[0]

ds = UDPSocket.new

ds.bind(nil,port)

$b = IO.new(2,"w+")

$client_id = 1
$clients = []
$flag = 0
loop do

    request, address = ds.recvfrom(1024)
    response = request
    clientaddr = address[3]
    clientname = address[2]
    clientport = address[1]

    if ( $clients.empty? )
        $clients[$client_id-1] = clientport
        puts "Client #{$client_id} enters the chat room "
        $client_id += 1
        puts "#{$clients}"
    else
        #puts(r.include? 'a')
        unless $clients.include? clientport       
            puts "Client #{$client_id} enters the chat room "
            $clients[$client_id-1] = clientport
            $client_id += 1
        end
        #    $client_id += 1
    end

#    puts "Connection from :Client #{clientport} says: #{response} #{clientname} #{clientaddr} #{clientport}"
    if( response.chop != "quit")
        puts "Client #{clientport}  says: #{response} "
    else
        puts "Client #{clientport} leaves the chat room "
        $client_id -= 1
    end

    if($client_id == 1)
        print " Do you want to close the chat room(y/n)?: "
            a = $b.readline
        if ( a.chop == "y")
            break
        end
    end
#    ds.send(response, 0, clientaddr, clientport)

end
