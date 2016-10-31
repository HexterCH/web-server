require "socket"

class Tube
  def initialize(port)
    @server = TCPServer.new(port)
  end

  def start
    socket = @server.accept

    data = socket.readpartial(1024)
    puts data

    socket.write "HTTP/1.1 200 OK\r\n"
    socket.write "\r\n"
    socket.write "hello\n"

    socket.close
  end
end

server = Tube.new(3000)

puts "plugging tube inot port 3000"
server.start
